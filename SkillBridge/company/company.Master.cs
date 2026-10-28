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
    public partial class company : System.Web.UI.MasterPage
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
                Session["Role"].ToString() != "Company")
            {
                Response.Redirect("~/login.aspx", false);
                return;
            }

            if (!IsPostBack)
            {
                LoadCompanyDetails();
            }
        }

        void LoadCompanyDetails()
        {
            if (Session["UserID"] == null)
            {
                lblCompanyName.Text = "Company";
                return;
            }

            int userID;

            if (!int.TryParse(Session["UserID"].ToString(), out userID))
            {
                lblCompanyName.Text = "Company";
                return;
            }

            getCon();

            string q = "SELECT CompanyName FROM Companies WHERE UserID = " + userID;

            cmd = new SqlCommand(q, con);

            object result = cmd.ExecuteScalar();

            if (result != null && result != DBNull.Value)
            {
                lblCompanyName.Text = result.ToString();
            }
            else
            {
                lblCompanyName.Text = "Company";
            }

            con.Close();
        }


    }
}