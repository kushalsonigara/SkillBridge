
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge.student
{
    public partial class student_profile1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string sres;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Student"))
                return;

            if (!IsPostBack)
            {
                studentfillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        // Show student profile
        void studentfillgrid()
        {
            try
            {
                getcon();

                int userid = Convert.ToInt32(Session["UserID"]);

                cmd = new SqlCommand(
                    "SELECT s.FullName, s.College, s.Course, s.Skills, " +
                    "s.ResumePath, s.DateOfBirth, s.GPA, s.GraduationYear, " +
                    "u.Email, u.Phone " +
                    "FROM Students s INNER JOIN Users u ON s.UserID = u.UserID " +
                    "WHERE s.UserID = '" + userid + "' AND u.Role = 'Student'", con);

                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    studentname.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                    studentemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    studentphone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                    studentcollege.Text = ds.Tables[0].Rows[0]["College"].ToString();
                    studentcourse.Text = ds.Tables[0].Rows[0]["Course"].ToString();
                    studentskills.Text = ds.Tables[0].Rows[0]["Skills"].ToString();

                    lblStudentName.Text = studentname.Text;
                    lblStudentCollege.Text = studentcollege.Text;

                    if (ds.Tables[0].Rows[0]["DateOfBirth"] != DBNull.Value)
                    {
                        studentdob.Text = Convert.ToDateTime(
                            ds.Tables[0].Rows[0]["DateOfBirth"]).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        studentdob.Text = "";
                    }

                    studentgpa.Text = ds.Tables[0].Rows[0]["GPA"].ToString();
                    studentgrad.Text = ds.Tables[0].Rows[0]["GraduationYear"].ToString();

                    if (ds.Tables[0].Rows[0]["ResumePath"] != DBNull.Value &&
                        ds.Tables[0].Rows[0]["ResumePath"].ToString() != "")
                    {
                        sres = ds.Tables[0].Rows[0]["ResumePath"].ToString();
                        lblResumeName.Text = System.IO.Path.GetFileName(sres);
                    }
                    else
                    {
                        sres = "";
                        lblResumeName.Text = "No resume uploaded";
                    }

                    studentprofilescore();
                }
                else
                {
                    lblStudentName.Text = "Student profile not found";
                    lblStudentCollege.Text = "";
                    lblResumeName.Text = "No resume uploaded";
                    lblProfileScore.Text = "0%";
                }

                con.Close();
            }
            catch (Exception)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                lblStudentName.Text = "Unable to load profile";
            }
        }

        // Calculate profile completion
        void studentprofilescore()
        {
            int score = 0;

            if (studentname.Text != "") score += 15;
            if (studentemail.Text != "") score += 15;
            if (studentphone.Text != "") score += 10;
            if (studentdob.Text != "") score += 10;
            if (studentcollege.Text != "") score += 15;
            if (studentcourse.Text != "") score += 10;
            if (studentgpa.Text != "") score += 5;
            if (studentgrad.Text != "") score += 5;
            if (studentskills.Text != "") score += 10;
            if (sres != "") score += 5;

            lblProfileScore.Text = score + "%";
        }

        // Upload student resume
        void studentresumeupload()
        {
            if (studentresume.HasFile)
            {
                string extension = System.IO.Path.GetExtension(
                    studentresume.FileName).ToLower();

                if (extension != ".pdf")
                {
                    throw new Exception("Please upload a PDF resume.");
                }

                if (studentresume.PostedFile.ContentLength > 5 * 1024 * 1024)
                {
                    throw new Exception("Resume size must not exceed 5 MB.");
                }

                string filename = System.IO.Path.GetFileName(studentresume.FileName);

                sres = "Uploads/Resumes/" + filename;

                string folder = Server.MapPath("~/Uploads/Resumes/");

                if (!System.IO.Directory.Exists(folder))
                {
                    System.IO.Directory.CreateDirectory(folder);
                }

                studentresume.SaveAs(Server.MapPath("~/" + sres));
            }
        }

        // Update student profile and phone number
        void studentupdate()
        {
            int userid = Convert.ToInt32(Session["UserID"]);

            // Get existing resume path
            cmd = new SqlCommand(
                "SELECT ResumePath FROM Students WHERE UserID = '" + userid + "'", con);

            object oldresume = cmd.ExecuteScalar();

            if (oldresume == null || oldresume == DBNull.Value)
            {
                sres = "";
            }
            else
            {
                sres = oldresume.ToString();
            }

            // Upload new resume if selected
            studentresumeupload();

            // Update student details
            cmd = new SqlCommand(
                "UPDATE Students SET " +
                "FullName = '" + studentname.Text + "', " +
                "College = '" + studentcollege.Text + "', " +
                "Course = '" + studentcourse.Text + "', " +
                "Skills = '" + studentskills.Text + "', " +
                "DateOfBirth = " +
                (studentdob.Text == "" ? "NULL" : "'" + studentdob.Text + "'") + ", " +
                "GPA = " +
                (studentgpa.Text == "" ? "NULL" : "'" + studentgpa.Text + "'") + ", " +
                "GraduationYear = " +
                (studentgrad.Text == "" ? "NULL" : studentgrad.Text) + ", " +
                "ResumePath = " +
                (sres == "" ? "NULL" : "'" + sres + "'") +
                " WHERE UserID = '" + userid + "'", con);

            int result = cmd.ExecuteNonQuery();

            // Update phone number in Users table
            cmd = new SqlCommand(
                "UPDATE Users SET Phone = '" + studentphone.Text +
                "' WHERE UserID = '" + userid + "' AND Role = 'Student'", con);

            cmd.ExecuteNonQuery();

            if (result == 0)
            {
                throw new Exception("Student profile not found.");
            }
        }

        // Save profile
        protected void studentsave_Click(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Student"))
                return;

            try
            {
                getcon();

                studentupdate();

                con.Close();

                studentfillgrid();

                studentsave.Text = "Saved Successfully";
            }
            catch (Exception ex)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                lblStudentName.Text = ex.Message;
            }
        }

        protected void studentreset_Click(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Student"))
                return;

            studentfillgrid();
        }
    }
}
