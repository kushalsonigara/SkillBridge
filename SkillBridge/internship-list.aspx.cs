using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge
{
    public partial class internship_list : System.Web.UI.Page
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
                filldatalist();
            }
        }

        void filldatalist()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT I.InternshipID, I.Title, I.Description, I.RequiredSkills, " +
                "I.Location, I.Stipend, I.Duration, I.Deadline, C.CompanyName " +
                "FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE I.Deadline IS NULL OR I.Deadline >= CAST(GETDATE() AS date) " +
                "ORDER BY I.CreatedAt DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            dlInternships.DataSource = ds;
            dlInternships.DataBind();

            lblPositionCount.Text = "Showing " + ds.Tables[0].Rows.Count + " Positions";

            if (ds.Tables[0].Rows.Count == 0)
            {
                pnlNoInternships.Visible = true;
            }
            else
            {
                pnlNoInternships.Visible = false;
            }

            con.Close();
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            getCon();

            string query = "SELECT I.InternshipID, I.Title, I.Description, I.RequiredSkills, " +
                "I.Location, I.Stipend, I.Duration, I.Deadline, C.CompanyName " +
                "FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE (I.Deadline IS NULL OR I.Deadline >= CAST(GETDATE() AS date))";

            if (txtKeyword.Text != "")
            {
                query += " AND (I.Title LIKE '%" + txtKeyword.Text + "%' OR I.RequiredSkills LIKE '%" + txtKeyword.Text + "%')";
            }

            if (ddlLocation.SelectedValue != "")
            {
                query += " AND I.Location = '" + ddlLocation.SelectedValue + "'";
            }

            if (ddlDuration.SelectedValue != "")
            {
                query += " AND I.Duration = '" + ddlDuration.SelectedValue + "'";
            }

            if (txtCompany.Text != "")
            {
                query += " AND C.CompanyName LIKE '%" + txtCompany.Text + "%'";
            }

            query += " ORDER BY I.CreatedAt DESC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            dlInternships.DataSource = ds;
            dlInternships.DataBind();

            lblPositionCount.Text = "Showing " + ds.Tables[0].Rows.Count + " Positions";
            pnlNoInternships.Visible = ds.Tables[0].Rows.Count == 0;

            con.Close();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCon();

            string query = "SELECT I.InternshipID, I.Title, I.Description, I.RequiredSkills, " +
                "I.Location, I.Stipend, I.Duration, I.Deadline, C.CompanyName " +
                "FROM Internships I " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE I.Deadline IS NULL OR I.Deadline >= CAST(GETDATE() AS date) ";

            if (ddlSort.SelectedValue == "stipend")
            {
                query += " ORDER BY I.Stipend DESC";
            }
            else if (ddlSort.SelectedValue == "deadline")
            {
                query += " ORDER BY I.Deadline ASC";
            }
            else
            {
                query += " ORDER BY I.CreatedAt DESC";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            dlInternships.DataSource = ds;
            dlInternships.DataBind();

            lblPositionCount.Text = "Showing " + ds.Tables[0].Rows.Count + " Positions";
            pnlNoInternships.Visible = ds.Tables[0].Rows.Count == 0;

            con.Close();
        }
    }
}