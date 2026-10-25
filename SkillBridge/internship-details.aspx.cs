using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace SkillBridge
{
    public partial class internship_details : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                filldetails();
            }
        }

        void filldetails()
        {
            if (Request.QueryString["InternshipID"] != null)
            {
                getCon();

                int id = Convert.ToInt32(Request.QueryString["InternshipID"]);

                da = new SqlDataAdapter(
                    "SELECT I.InternshipID, I.Title, I.Description, I.RequiredSkills, " +
                    "I.Location, I.Stipend, I.Duration, I.Deadline, C.CompanyName " +
                    "FROM Internships I " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE I.InternshipID = " + id, con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    lblCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    lblLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                    lblStipend.Text = ds.Tables[0].Rows[0]["Stipend"].ToString();
                    lblDuration.Text = ds.Tables[0].Rows[0]["Duration"].ToString(); 
                    lblSkills.Text = ds.Tables[0].Rows[0]["RequiredSkills"].ToString();

                    if (ds.Tables[0].Rows[0]["Deadline"] == DBNull.Value)
                    {
                        lblDeadline.Text = "Not specified";
                    }
                    else
                    {
                        lblDeadline.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Deadline"]).ToString("dd MMM yyyy");
                    }

                    lnkApply.NavigateUrl = "~/student/apply-internship.aspx?InternshipID=" +
                        ds.Tables[0].Rows[0]["InternshipID"].ToString();

                    pnlInternshipDetails.Visible = true;
                    pnlNoInternship.Visible = false;
                }
                else
                {
                    pnlInternshipDetails.Visible = false;
                    pnlNoInternship.Visible = true;
                }

                con.Close();
            }
            else
            {
                pnlInternshipDetails.Visible = false;
                pnlNoInternship.Visible = true;
            }
        }
    }
}
