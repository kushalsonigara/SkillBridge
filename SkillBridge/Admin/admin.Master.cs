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
    public partial class admin : System.Web.UI.MasterPage
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
                Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/login.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminDetails();
            }
        }

        void LoadAdminDetails()
        {
            int userID;

            if (!int.TryParse(Session["UserID"].ToString(), out userID))
            {
                lblAdminName.Text = "Admin User";
                lblAdminEmail.Text = "";
                return;
            }

            getCon();

            string q = "SELECT Email FROM Users WHERE UserID = " + userID;

            cmd = new SqlCommand(q, con);

            object result = cmd.ExecuteScalar();

            if (result != null && result != DBNull.Value)
            {
                lblAdminEmail.Text = result.ToString();
            }
            else
            {
                lblAdminEmail.Text = "";
            }

            lblAdminName.Text = "Admin User";
            con.Close();
        }
    }
}