using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge
{
    public partial class Default : System.Web.UI.MasterPage
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn =
                Session["UserID"] != null &&
                Session["Role"] != null;

            phGuest.Visible = !loggedIn;
            phLoggedIn.Visible = loggedIn;

            if (!loggedIn)
                return;

            string role = Session["Role"].ToString();

            lblUserEmail.Text = Convert.ToString(Session["Email"]);
            lblUserRole.Text = role;

            if (role == "Student")
                lnkDashboard.NavigateUrl = "~/student/student-dashboard.aspx";
            else if (role == "Company")
                lnkDashboard.NavigateUrl = "~/company/company-dashboard.aspx";
            else if (role == "Admin")
                lnkDashboard.NavigateUrl = "~/Admin/admin-dashboard.aspx";
            else
            {
                Session.Clear();
                Session.Abandon();

                phGuest.Visible = true;
                phLoggedIn.Visible = false;
            }
        }


    }
}