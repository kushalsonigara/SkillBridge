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
        SqlDataAdapter da;
        DataSet ds;

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

            if (!IsPostBack)
            {
                if (Request.QueryString["edit"] == "true")
                {
                    LoadInternship();
                    btnPublishInternship.Text = "Update Internship";
                }
            }
        }


        void clear()
        {
            intern_title.Text = "";
            intern_dept.SelectedIndex = 0;
            intern_stipend.Text = "";
            intern_duration.SelectedIndex = 0;
            intern_loc_type.SelectedIndex = 0;
            intern_location.Text = "";
            intern_deadline.Text = "";
            intern_skills.Text = "";
            intern_description.Text = "";

            lblInternshipMessage.Text = "";
        }

        void LoadInternship()
        {
            if (Request.QueryString["InternshipID"] == null)
                return;

            getcon();

            cmd = new SqlCommand(
                "select I.* from Internships I inner join Companies C " +
                "on I.CompanyID=C.CompanyID where I.InternshipID='" +
                Request.QueryString["InternshipID"] + "' and C.UserID='" +
                Session["UserID"].ToString() + "'", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                intern_title.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                intern_dept.SelectedValue = ds.Tables[0].Rows[0]["Department"].ToString();
                intern_stipend.Text = ds.Tables[0].Rows[0]["Stipend"].ToString();
                intern_duration.SelectedValue = ds.Tables[0].Rows[0]["Duration"].ToString();
                intern_loc_type.SelectedValue = ds.Tables[0].Rows[0]["InternshipType"].ToString();
                intern_location.Text = ds.Tables[0].Rows[0]["Location"].ToString();

                if (ds.Tables[0].Rows[0]["Deadline"] != DBNull.Value)
                    intern_deadline.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["Deadline"]).ToString("yyyy-MM-dd");

                intern_skills.Text = ds.Tables[0].Rows[0]["RequiredSkills"].ToString();
                intern_description.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            }

            con.Close();
        }


        protected void btnPublishInternship_Click(object sender, EventArgs e)
        {
            getcon();

            if (Request.QueryString["edit"] == "true" &&
                Request.QueryString["InternshipID"] != null)
            {
                int internshipid = Convert.ToInt32(Request.QueryString["InternshipID"]);

                cmd = new SqlCommand("select CompanyID from Companies where UserID='" +
                    Session["UserID"].ToString() + "'", con);

                int companyid = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = new SqlCommand(
                    "update Internships set Title='" + intern_title.Text +
                    "', Department='" + intern_dept.SelectedValue +
                    "', Description='" + intern_description.Text +
                    "', RequiredSkills='" + intern_skills.Text +
                    "', Location='" + intern_location.Text +
                    "', Stipend='" + intern_stipend.Text +
                    "', Duration='" + intern_duration.SelectedValue +
                    "', InternshipType='" + intern_loc_type.SelectedValue +
                    "', Deadline='" + intern_deadline.Text +
                    "' where InternshipID='" + internshipid +
                    "' and CompanyID='" + companyid + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("internship-management.aspx");
            }
            else
            {
                cmd = new SqlCommand(
                    "select CompanyID from Companies where UserID='" +
                    Session["UserID"].ToString() + "'", con);

                int companyid = Convert.ToInt32(cmd.ExecuteScalar());

                cmd = new SqlCommand(
                    "insert into Internships(CompanyID,Title,Department,Description,RequiredSkills,Location,Stipend,Duration,InternshipType,Deadline,CreatedAt) values('" +
                    companyid + "','" + intern_title.Text + "','" +
                    intern_dept.SelectedValue + "','" + intern_description.Text +
                    "','" + intern_skills.Text + "','" + intern_location.Text +
                    "','" + intern_stipend.Text + "','" + intern_duration.SelectedValue +
                    "','" + intern_loc_type.SelectedValue + "','" +
                    intern_deadline.Text + "','" + DateTime.Now + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                clear();

                lblInternshipMessage.ForeColor = System.Drawing.Color.Green;
                lblInternshipMessage.Text = "Internship published successfully.";
            }
        }


        protected void btnCancelInternship_Click(object sender, EventArgs e)
        {
            clear();
            Response.Redirect("internship-management.aspx");
        }
    }
}