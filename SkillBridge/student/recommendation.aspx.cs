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
    public partial class recommendation : System.Web.UI.Page
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
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Student"))
                return;

            if (!IsPostBack)
            {
                fillrecommendations();
            }
        }

        protected void btnViewMore_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            Response.Redirect("../internship-details.aspx?InternshipID=" +
                btn.CommandArgument);
        }

        protected void btnApplyNow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            Response.Redirect("../internship-list.aspx");
        }


        
        void fillrecommendations()
        {
            
            getCon();

            da = new SqlDataAdapter(
                "SELECT Skills FROM Students WHERE UserID = " +
                Session["UserID"], con);

            ds = new DataSet();
            da.Fill(ds);

            string studentSkills = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                studentSkills = Convert.ToString(
                    ds.Tables[0].Rows[0]["Skills"]);
            }

            con.Close();

            lblStudentSkills.Text = studentSkills.Trim() == ""
                ? "No skills added to your profile yet."
                : studentSkills;

            
            getCon();

            da = new SqlDataAdapter(
                "SELECT I.InternshipID, I.Title, I.Description, " +
                "I.RequiredSkills, I.Location, I.Stipend, " +
                "I.InternshipType, I.Duration, C.CompanyName " +
                "FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE I.Deadline >= CAST(GETDATE() AS DATE) " +
                "ORDER BY I.CreatedAt DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            DataTable dt = ds.Tables[0];

            dt.Columns.Add("MatchPercentage", typeof(int));
            dt.Columns.Add("MatchedSkills", typeof(string));

            string[] studentSkillList = studentSkills.Split(',');

           
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string[] requiredSkills = Convert.ToString(
                    dt.Rows[i]["RequiredSkills"]).Split(',');

                int matched = 0;
                string matchedSkills = "";

                foreach (string skill in requiredSkills)
                {
                    foreach (string studentSkill in studentSkillList)
                    {
                        if (skill.Trim().Equals(studentSkill.Trim(),
                            StringComparison.OrdinalIgnoreCase)
                            && skill.Trim() != "")
                        {
                            matched++;

                            if (matchedSkills != "")
                                matchedSkills += ", ";

                            matchedSkills += skill.Trim();
                            break;
                        }
                    }
                }

                int percentage = 0;

                if (requiredSkills.Length > 0)
                    percentage = matched * 100 / requiredSkills.Length;

                dt.Rows[i]["MatchPercentage"] = percentage;

                dt.Rows[i]["MatchedSkills"] = matchedSkills == ""
                    ? "No matching skills"
                    : matchedSkills;
            }

            
            DataView dv = dt.DefaultView;
            dv.Sort = "MatchPercentage DESC";

            dlRecommendations.DataSource = dv;
            dlRecommendations.DataBind();
            
            con.Close();
        }
    }
}