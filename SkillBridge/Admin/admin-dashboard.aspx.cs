
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge.Admin
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Admin"))
                return;

            if (!IsPostBack)
            {
                adminfilldashboard();
                adminfillregistrations();
                adminfillmessages();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void adminfilldashboard()
        {
            getcon();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role = 'Student'", con);
            lblStudents.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Role = 'Company'", con);
            lblCompanies.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Internships", con);
            lblInternships.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Applications", con);
            lblApplications.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Applications WHERE Status = 'Accepted'", con);
            lblAccepted.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Applications WHERE Status = 'Rejected'", con);
            lblRejected.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }



        void adminfillregistrations()
        {
            getcon();

            cmd = new SqlCommand(
                "SELECT TOP 5 " +
                "CASE WHEN u.Role = 'Student' THEN s.FullName " +
                "WHEN u.Role = 'Company' THEN c.CompanyName " +
                "ELSE u.Email END AS FullName, " +
                "u.Role, u.CreatedAt " +
                "FROM Users u " +
                "LEFT JOIN Students s ON u.UserID = s.UserID " +
                "LEFT JOIN Companies c ON u.UserID = c.UserID " +
                "WHERE u.Role IN ('Student', 'Company') " +
                "ORDER BY u.CreatedAt DESC", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            gvRecentRegistrations.DataSource = ds;
            gvRecentRegistrations.DataBind();

            con.Close();
        }

        void adminfillmessages()
        {
            getcon();

            cmd = new SqlCommand(
                "SELECT TOP 5 FullName, Subject, CreatedAt " +
                "FROM ContactMessages " +
                "ORDER BY CreatedAt DESC", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            gvRecentMessages.DataSource = ds;
            gvRecentMessages.DataBind();

            con.Close();
        }


    }
}
