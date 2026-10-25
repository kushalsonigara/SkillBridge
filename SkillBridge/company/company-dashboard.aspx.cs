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
    public partial class company_dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;

            if (!IsPostBack)
            {
                companyfilldashboard();
                companyfillapplications();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void companyfilldashboard()
        {
            getcon();

            cmd = new SqlCommand(
                "SELECT CompanyID FROM Companies WHERE UserID='" +
                Session["UserID"].ToString() + "'", con);

            int companyid = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Internships WHERE CompanyID='" + companyid + "'", con);
            lblTotalPositions.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Internships WHERE CompanyID='" + companyid +
                "' AND (Deadline IS NULL OR Deadline >= CAST(GETDATE() AS date))", con);
            lblActiveOpenings.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Applications A INNER JOIN Internships I " +
                "ON A.InternshipID=I.InternshipID WHERE I.CompanyID='" + companyid + "'", con);
            lblTotalApplications.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Applications A INNER JOIN Internships I " +
                "ON A.InternshipID=I.InternshipID WHERE I.CompanyID='" + companyid +
                "' AND A.Status='Selected'", con);
            lblSelectedStudents.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        void companyfillapplications()
        {
            getcon();

            cmd = new SqlCommand(
                "SELECT TOP 5 S.FullName, I.Title, S.College, A.ApplicationDate " +
                "FROM Applications A " +
                "INNER JOIN Internships I ON A.InternshipID=I.InternshipID " +
                "INNER JOIN Companies C ON I.CompanyID=C.CompanyID " +
                "INNER JOIN Students S ON A.StudentID=S.StudentID " +
                "WHERE C.UserID='" + Session["UserID"].ToString() + "' " +
                "ORDER BY A.ApplicationDate DESC", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            gvRecentApplications.DataSource = ds;
            gvRecentApplications.DataBind();

            con.Close();
        }
    }
}