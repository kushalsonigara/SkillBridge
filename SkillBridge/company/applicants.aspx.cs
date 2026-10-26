using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge.company
{
    public partial class applicants : System.Web.UI.Page
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
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;

            if (!IsPostBack)
            {
                fillpositions();
                fillapplicants();
            }
        }

        // Load Company Internship Positions
        void fillpositions()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT I.InternshipID, I.Title " +
                "FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE C.UserID = " + Session["UserID"] +
                " ORDER BY I.Title", con);

            ds = new DataSet();
            da.Fill(ds);

            ddlPosition.DataSource = ds;
            ddlPosition.DataTextField = "Title";
            ddlPosition.DataValueField = "InternshipID";
            ddlPosition.DataBind();

            ddlPosition.Items.Insert(0, new ListItem("All Openings", "0"));

            con.Close();
        }

        // Load Applicants
        void fillapplicants()
        {
            getCon();

            string query =
                    "SELECT A.ApplicationID, A.Status, " +
                    "S.FullName, S.College, S.Skills, S.ResumePath, " +
                    "I.Title " +
                    "FROM Applications A " +
                    "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                    "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE C.UserID = " + Session["UserID"];

            if (ddlPosition.SelectedValue != "0")
            {
                query += " AND I.InternshipID = " + ddlPosition.SelectedValue;
            }

            if (txtSearch.Text.Trim() != "")
            {
                query +=
                    " AND (S.FullName LIKE '%" + txtSearch.Text.Trim() + "%' " +
                    "OR S.College LIKE '%" + txtSearch.Text.Trim() + "%' " +
                    "OR S.Skills LIKE '%" + txtSearch.Text.Trim() + "%' " +
                    "OR I.Title LIKE '%" + txtSearch.Text.Trim() + "%')";
            }

            query += " ORDER BY A.ApplicationDate DESC";

            da = new SqlDataAdapter(query, con);

            ds = new DataSet();
            da.Fill(ds);

            gvApplicants.DataSource = ds;
            gvApplicants.DataBind();

            con.Close();
        }

        // Search Applicants
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            fillapplicants();
        }

        // Filter Applicants by Position
        protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            fillapplicants();
        }

        // Accept or Reject Application
        protected void gvApplicants_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptApplication" ||
                e.CommandName == "RejectApplication")
            {
                int applicationID = Convert.ToInt32(e.CommandArgument);
                string status = "";

                if (e.CommandName == "AcceptApplication")
                {
                    status = "Accepted";
                }
                else
                {
                    status = "Rejected";
                }

                getCon();

                cmd = new SqlCommand(
                    "UPDATE Applications SET Status = '" + status + "' " +
                    "WHERE ApplicationID = " + applicationID +
                    " AND InternshipID IN " +
                    "(SELECT I.InternshipID " +
                    "FROM Internships I " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE C.UserID = " + Session["UserID"] + ")", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillapplicants();
            }
        }
    }
}