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
    public partial class index : System.Web.UI.Page
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
                fillinternships();
                fillstatistics();
            }
        }

        void fillinternships()
        {
            getCon();

            string q = "SELECT TOP 6 I.InternshipID, I.Title, I.Description, " +
                       "I.RequiredSkills, I.Location, I.Stipend, I.InternshipType, " +
                       "I.Department, I.CreatedAt, C.CompanyName " +
                       "FROM Internships I " +
                       "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                       "WHERE I.Deadline IS NULL OR I.Deadline >= CAST(GETDATE() AS date) " +
                       "ORDER BY I.CreatedAt DESC";

            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            dlInternships.DataSource = ds;
            dlInternships.DataBind();

            con.Close();
        }

        void fillstatistics()
        {
            getCon();

            string q = "SELECT " +
                       "(SELECT COUNT(*) FROM Internships) AS TotalInternships, " +
                       "(SELECT COUNT(*) FROM Companies) AS TotalCompanies, " +
                       "(SELECT COUNT(*) FROM Students) AS TotalStudents, " +
                       "(SELECT COUNT(*) FROM Applications) AS TotalApplications";

            cmd = new SqlCommand(q, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblInternshipCount.Text = ds.Tables[0].Rows[0]["TotalInternships"].ToString();
                lblCompanyCount.Text = ds.Tables[0].Rows[0]["TotalCompanies"].ToString();
                lblStudentCount.Text = ds.Tables[0].Rows[0]["TotalStudents"].ToString();
                lblApplicationCount.Text = ds.Tables[0].Rows[0]["TotalApplications"].ToString();
            }

            con.Close();
        }
    }
}