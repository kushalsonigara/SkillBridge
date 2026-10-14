
using System;
using System.Web;
using System.Web.UI;

namespace SkillBridge
{
    public class LoginSecurity
    {
        public static bool CheckRole(Page page, string role)
        {
            // Check whether the user is logged in
            if (page.Session["UserID"] == null ||
                page.Session["Role"] == null)
            {
                page.Response.Redirect("~/login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return false;
            }

            // Check the user's role
            if (page.Session["Role"].ToString() != role)
            {
                page.Response.Redirect("~/login.aspx", false);
                HttpContext.Current.ApplicationInstance.CompleteRequest();
                return false;
            }

            return true;
        }
    }
}
