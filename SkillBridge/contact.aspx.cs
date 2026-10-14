using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge
{
    public partial class contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            contactname.Text = "";
            contactemail.Text = "";
            contactsubject.Text = "";
            contactmessage.Text = "";
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("insert into ContactMessages (FullName,Email,Subject,Message) values('" + contactname.Text + "','" + contactemail.Text + "','" + contactsubject.Text + "','" + contactmessage.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            clear();
            lblContactResult.Text = "Message sent successfully! We will contact you soon.";
        }
    }
}