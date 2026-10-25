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
    public partial class my_applications : System.Web.UI.Page
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
            if (Session["UserID"] == null || Session["Role"] == null ||
               Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                fillapplications();
            }
        }

        void fillapplications()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT A.ApplicationID, I.Title, I.Location, I.Duration, " +
                "C.CompanyName, A.ApplicationDate, A.Status " +
                "FROM Applications A " +
                "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                "WHERE S.UserID = " + Session["UserID"] +
                " AND I.InternshipID IS NOT NULL " +
                "ORDER BY A.ApplicationDate DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            gvApplications.DataSource = ds;
            gvApplications.DataBind();

            con.Close();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT A.ApplicationID, I.Title, I.Location, I.Duration, " +
                "C.CompanyName, A.ApplicationDate, A.Status " +
                "FROM Applications A " +
                "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                "WHERE S.UserID = " + Session["UserID"] +
                " AND (I.Title LIKE '%" + txtSearch.Text.Trim().Replace("'", "''") +
                "%' OR C.CompanyName LIKE '%" + txtSearch.Text.Trim().Replace("'", "''") + "%')" +
                " ORDER BY A.ApplicationDate DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            gvApplications.DataSource = ds;
            gvApplications.DataBind();

            con.Close();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCon();

            string query =
                "SELECT A.ApplicationID, I.Title, I.Location, I.Duration, " +
                "C.CompanyName, A.ApplicationDate, A.Status " +
                "FROM Applications A " +
                "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                "WHERE S.UserID = " + Session["UserID"];

            if (ddlStatus.SelectedValue != "")
            {
                query += " AND A.Status = '" + ddlStatus.SelectedValue.Replace("'", "''") + "'";
            }

            query += " ORDER BY A.ApplicationDate DESC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            gvApplications.DataSource = ds;
            gvApplications.DataBind();

            con.Close();
        }

    }
}