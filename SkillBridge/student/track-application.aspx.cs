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
    public partial class student_profile : System.Web.UI.Page
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
                filldetails();
            }
        }

        void filldetails()
        {
            if (Request.QueryString["id"] != null)
            {
                getCon();

                int id = Convert.ToInt32(Request.QueryString["id"]);

                da = new SqlDataAdapter(
                    "SELECT A.ApplicationID, A.ApplicationDate, A.Status, " +
                    "I.Title, I.Location, I.Duration, C.CompanyName " +
                    "FROM Applications A " +
                    "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                    "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE A.ApplicationID = " + id +
                    " AND S.UserID = " + Session["UserID"], con);

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                    lblCompanyName.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    lblLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                    lblDuration.Text = ds.Tables[0].Rows[0]["Duration"].ToString() + " Months";
                    lblApplicationID.Text = ds.Tables[0].Rows[0]["ApplicationID"].ToString();

                    lblAppliedDate.Text = Convert.ToDateTime(
                        ds.Tables[0].Rows[0]["ApplicationDate"]).ToString("dd MMM yyyy");

                    lblTimelineAppliedDate.Text = lblAppliedDate.Text;

                    string status = ds.Tables[0].Rows[0]["Status"].ToString();

                    lblStatus.Text = status;
                    lblStatusMessage.Text = "Your application is currently " + status + ".";

                    pnlApplied.CssClass = "timeline-step completed";
                    pnlReview.CssClass = "timeline-step";
                    pnlDecision.CssClass = "timeline-step";
                    pnlProgress.Style["width"] = "0%";

                    if (status == "Pending")
                    {
                        lblStatusMessage.Text = "Your application has been submitted and is waiting for review.";
                        pnlApplied.CssClass = "timeline-step completed";
                        pnlProgress.Style["width"] = "0%";
                    }
                    else if (status == "Under Review" || status == "Interview")
                    {
                        lblStatusMessage.Text = "Your application is being reviewed by the company.";
                        pnlApplied.CssClass = "timeline-step completed";
                        pnlReview.CssClass = "timeline-step active";
                        lblReviewDate.Text = "In progress";
                        pnlProgress.Style["width"] = "50%";
                    }
                    else if (status == "Accepted" || status == "Rejected" || status == "Selected")
                    {
                        lblStatusMessage.Text = "The company has made a decision on your application.";
                        pnlApplied.CssClass = "timeline-step completed";
                        pnlReview.CssClass = "timeline-step completed";
                        pnlDecision.CssClass = "timeline-step active";
                        lblReviewDate.Text = "";
                        lblDecisionDate.Text = status;
                        pnlProgress.Style["width"] = "100%";
                    }

                    pnlNoApplication.Visible = false;
                }
                else
                {
                    pnlNoApplication.Visible = true;
                }

                con.Close();
            }
            else
            {
                pnlNoApplication.Visible = true;
            }
        }
    }
}