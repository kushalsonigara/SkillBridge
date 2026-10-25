using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge.company
{
    public partial class company_profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;
        }

        protected void btnPublishInternship_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("select CompanyID from Companies where UserID='" + Session["UserID"].ToString() + "'", con);
            int companyid = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand("insert into Internships(CompanyID,Title,Department,Description,RequiredSkills,Location,Stipend,Duration,InternshipType,Deadline,CreatedAt) values('" + companyid + "','" + intern_title.Text + "','" + intern_dept.SelectedValue + "','" + intern_description.Text + "','" + intern_skills.Text + "','" + intern_location.Text + "','" + intern_stipend.Text + "','" + intern_duration.SelectedValue + "','" + intern_loc_type.SelectedValue + "','" + intern_deadline.Text + "','" + DateTime.Now + "')", con);
            cmd.ExecuteNonQuery();

        }

        protected void btnCancelInternship_Click(object sender, EventArgs e)
        {
            Response.Redirect("internship-management.aspx");
        }
    }
}