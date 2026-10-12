using System;
using System.Collections.Generic;
using System.Configuration; //for configurationmanagerz
using System.Data; //for dataset
using System.Data.SqlClient; //for sqlconnection, sqlcommand, sqldataadapter
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con; //for connection
        SqlCommand cmd; //for insert, update, delete
        SqlDataAdapter da; //for container
        DataSet ds; //for store data
        string sres; //for student resume
        string clogo; //for company logo
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void clear()
        {
            studentname.Text = "";
            studentemail.Text = "";
            studentpassword.Text = "";
            studentphone.Text = "";
            studentcollege.Text = "";
            studentcourse.Text = "";
            skillinput.Text = "";
            studentpassword.Text = "";
            studentcnpassword.Text = "";
            companyname.Text = "";
            companyemail.Text = "";
            companypassword.Text = "";
            companyphone.Text = "";
            companywebsite.Text = "";
            companyindustry.Text = "";
            companylocation.Text = "";
            companycontact.Text = "";
            companydomain.Text = "";
            companypassword.Text = "";
            companyconfirmpassword.Text = "";
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void studentfillgrid()
        {

        }

        void studentresumeupload()
        {
            sres = "Uploads/Resumes/" + studentresume.FileName;
            studentresume.SaveAs(Server.MapPath(sres));
        }

        void companylogoupload()
        {
            clogo = "Uploads/ComLogos/" + companylogo.FileName;
            companylogo.SaveAs(Server.MapPath(clogo));
        }

        protected void studentregister_Click(object sender, EventArgs e)
        {
            string role = "Student";

            string name = studentname.Text;
            string email = studentemail.Text;
            string phone = studentphone.Text;
            string college = studentcollege.Text;
            string course = studentcourse.Text;
            string skills = skillinput.Text;
            string password = studentpassword.Text;
            string confirmPassword = studentcnpassword.Text;

            getcon();
            studentresumeupload();

            cmd = new SqlCommand("insert into Users (Email,PasswordHash,Role,Phone) values('" + email + "','" + password + "','" + role + "','" + phone + "'); SELECT SCOPE_IDENTITY()", con);
            int userid = Convert.ToInt32(cmd.ExecuteScalar());


            cmd = new SqlCommand("insert into Students (UserID,FullName,College,Course,Skills,ResumePath) values('" + userid + "','" + name + "','" + college + "','" + course + "','" + skills + "','" + sres + "')", con);

            cmd.ExecuteNonQuery();
            clear();
        }

        protected void companyregister_Click(object sender, EventArgs e)
        {
            string role = "Company";

            string companyName = companyname.Text;
            string email = companyemail.Text;
            string phone = companyphone.Text;
            string website = companywebsite.Text;
            string industry = companyindustry.Text;
            string location = companylocation.Text;
            string contact = companycontact.Text;
            string domain = companydomain.Text;
            string password = companypassword.Text;
            string confirmPassword = companyconfirmpassword.Text;

            getcon();
            companylogoupload();

            cmd = new SqlCommand("insert into Users (Email,PasswordHash,Role,Phone) values('" + email + "','" + password + "','" + role + "','" + phone + "'); SELECT SCOPE_IDENTITY()", con);
            int userid = Convert.ToInt32(cmd.ExecuteScalar());


            cmd = new SqlCommand("insert into Companies (UserID,CompanyName,Website,Industry,Location,ContactPerson,InternshipDomains,LogoPath) values('" + userid + "','" + companyName + "','" + website + "','" + industry + "','" + location + "','" + contact + "','" + domain + "','" + clogo + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}