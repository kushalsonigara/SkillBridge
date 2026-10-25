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
    public partial class apply_internship : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/login.aspx?ReturnUrl=" + Server.UrlEncode(Request.RawUrl));
                return;
            }

            if (!IsPostBack)
                filldetails();
        }

        void filldetails()
        {
            getCon();

            int id = Convert.ToInt32(Request.QueryString["InternshipID"]);

            da = new SqlDataAdapter(
                "SELECT I.*, C.CompanyName FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE I.InternshipID = " + id, con);

            ds = new DataSet();
            da.Fill(ds);

            lblTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
            lblCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
            lblLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
            lblStipend.Text = ds.Tables[0].Rows[0]["Stipend"].ToString();
            lblDuration.Text = ds.Tables[0].Rows[0]["Duration"].ToString() + " Months";
            lblDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            lblSkills.Text = ds.Tables[0].Rows[0]["RequiredSkills"].ToString();
            lblDeadline.Text = ds.Tables[0].Rows[0]["Deadline"].ToString();

            da = new SqlDataAdapter(
                "SELECT * FROM Students WHERE UserID = " + Session["UserID"], con);

            ds = new DataSet();
            da.Fill(ds);

            lblStudentName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
            lblCollege.Text = ds.Tables[0].Rows[0]["College"].ToString();
            lblCourse.Text = ds.Tables[0].Rows[0]["Course"].ToString();
            lblStudentSkills.Text = ds.Tables[0].Rows[0]["Skills"].ToString();

            con.Close();
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            getCon();

            int id = Convert.ToInt32(Request.QueryString["InternshipID"]);

            cmd = new SqlCommand(
                "INSERT INTO Applications (StudentID, InternshipID, ApplicationDate, Status, CoverLetter) " +
                "SELECT StudentID, " + id + ", GETDATE(), 'Pending', '" +
                txtCoverLetter.Text.Trim().Replace("'", "''") +
                "' FROM Students WHERE UserID = " + Session["UserID"], con);

            cmd.ExecuteNonQuery();
            con.Close();

            lblMessage.Text = "Application submitted successfully.";
            btnApply.Enabled = false;
        }
    }
}