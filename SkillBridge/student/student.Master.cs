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
    public partial class student : System.Web.UI.MasterPage
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
            if (Session["UserID"] == null ||
                Session["Role"] == null ||
                Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/login.aspx", false); 
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentDetails();
            }
        }

        void LoadStudentDetails()
        {
            int userID;

            if (!int.TryParse(Session["UserID"].ToString(), out userID))
            {
                lblStudentName.Text = "Student";
                return;
            }

            getCon();

            string q = "SELECT FullName FROM Students WHERE UserID = " + userID;

            cmd = new SqlCommand(q, con);

            object result = cmd.ExecuteScalar();

            if (result != null && result != DBNull.Value)
            {
                lblStudentName.Text = result.ToString();
            }
            else
            {
                lblStudentName.Text = "Student";
            }

            con.Close();
        }
    }
}