using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace SkillBridge
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["LoginRole"] = "Student";
            }
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        protected void studlog_Click(object sender, EventArgs e)
        {
            ViewState["LoginRole"] = "Student";
            studlog.CssClass = "form-tab-btn active py-2 fs-8 rounded-2";
            comlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            adminlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            lblMessage.Text = "";
        }

        protected void comlog_Click(object sender, EventArgs e)
        {
            ViewState["LoginRole"] = "Company";
            studlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            comlog.CssClass = "form-tab-btn active py-2 fs-8 rounded-2";
            adminlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            lblMessage.Text = "";
        }

        protected void adminlog_Click(object sender, EventArgs e)
        {
            ViewState["LoginRole"] = "Admin";
            studlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            comlog.CssClass = "form-tab-btn py-2 fs-8 rounded-2";
            adminlog.CssClass = "form-tab-btn active py-2 fs-8 rounded-2";
            lblMessage.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text =
                "Please select Student, Company, or Admin to log in.";

            string role = ViewState["LoginRole"] == null ? "Student" : ViewState["LoginRole"].ToString();
            LoginUser(role);
        }

        void LoginUser(string role)
        {
            lblMessage.Text = "";

            if (!string.IsNullOrEmpty(txtEmail.Text) &&
                !string.IsNullOrEmpty(txtPassword.Text))
            {
                try
                {
                    getcon();

                    cmd = new SqlCommand(
                        "SELECT COUNT(*) FROM Users WHERE Email='" +
                        txtEmail.Text.Trim() +
                        "' AND PasswordHash='" + txtPassword.Text +
                        "' AND Role='" + role +
                        "' AND IsActive=1", con);

                    int i = Convert.ToInt32(cmd.ExecuteScalar());

                    if (i > 0)
                    {
                        Session["Email"] = txtEmail.Text.Trim();
                        Session["Role"] = role;

                        cmd = new SqlCommand(
                            "SELECT UserID FROM Users WHERE Email='" +
                            txtEmail.Text.Trim() +
                            "' AND Role='" + role + "'", con);

                        Session["UserID"] =
                            Convert.ToInt32(cmd.ExecuteScalar());

                        RedirectByRole(role);
                    }
                    else
                    {
                        lblMessage.Text =
                            "Invalid email, password, or login role.";
                    }
                }
                catch (Exception)
                {
                    lblMessage.Text =
                        "Unable to log in. Please try again.";
                }
                finally
                {
                    if (con != null)
                    {
                        con.Close();
                    }
                }
            }
            else
            {
                lblMessage.Text =
                    "Please enter email and password.";
            }
        }


        void RedirectByRole(string role)
        {
            if (role == "Student")
            {
                if (Request.QueryString["ReturnUrl"] != null &&
                    Request.QueryString["ReturnUrl"] != "")
                {
                    Response.Redirect(
                        Request.QueryString["ReturnUrl"], false);
                }
                else
                {
                    Response.Redirect(
                        "~/student/student-dashboard.aspx", false);
                }
            }
            else if (role == "Company")
            {
                Response.Redirect(
                    "~/company/company-dashboard.aspx", false);
            }
            else if (role == "Admin")
            {
                Response.Redirect(
                    "~/Admin/admin-dashboard.aspx", false);
            }
            else
            {
                Session.Clear();
                Response.Redirect("~/login.aspx", false);
            }

            Context.ApplicationInstance.CompleteRequest();
        }


    }
}