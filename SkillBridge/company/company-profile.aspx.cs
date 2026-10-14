
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
    public partial class company_profile1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string clogo;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;

            if (!IsPostBack)
            {
                companyfillgrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void companyfillgrid()
        {
            try
            {
                getcon();

                int userid = Convert.ToInt32(Session["UserID"]);

                cmd = new SqlCommand(
                    "SELECT c.CompanyName, c.Website, c.Industry, c.Location, " +
                    "c.ContactPerson, c.InternshipDomains, c.LogoPath, " +
                    "u.Email, u.Phone " +
                    "FROM Companies c INNER JOIN Users u ON c.UserID = u.UserID " +
                    "WHERE c.UserID = '" + userid + "' AND u.Role = 'Company'", con);

                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    companyname.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    companyemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    companyphone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                    companycontact.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
                    companywebsite.Text = ds.Tables[0].Rows[0]["Website"].ToString();
                    companylocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                    companydomain.Text = ds.Tables[0].Rows[0]["InternshipDomains"].ToString();

                    companyindustry.SelectedValue =
                        ds.Tables[0].Rows[0]["Industry"].ToString();

                    clogo = ds.Tables[0].Rows[0]["LogoPath"].ToString();

                    if (clogo != "")
                    {
                        companylogoimage.ImageUrl = "~/" + clogo;
                        companylogoimage.Visible = true;
                    }
                    else
                    {
                        companylogoimage.Visible = false;
                    }

                    lblCompanyName.Text = companyname.Text;
                    lblCompanyLocation.Text = companylocation.Text;
                    lblCompanyIndustry.Text = companyindustry.SelectedItem.Text;
                }
                else
                {
                    lblCompanyName.Text = "Company profile not found";
                    lblCompanyLocation.Text = "";
                    lblCompanyIndustry.Text = "";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                lblCompanyName.Text = "Error: " + ex.Message;
            }
        }

        void companylogoupload()
        {
            if (companylogo.HasFile)
            {
                string extension = System.IO.Path.GetExtension(
                    companylogo.FileName).ToLower();

                if (extension != ".jpg" &&
                    extension != ".jpeg" &&
                    extension != ".png")
                {
                    throw new Exception("Please upload a JPG or PNG company logo.");
                }

                if (companylogo.PostedFile.ContentLength > 5 * 1024 * 1024)
                {
                    throw new Exception("Company logo size must not exceed 5 MB.");
                }

                clogo = "Uploads/ComLogos/" + companylogo.FileName;

                string folder = Server.MapPath("~/Uploads/ComLogos/");

                if (!System.IO.Directory.Exists(folder))
                {
                    System.IO.Directory.CreateDirectory(folder);
                }

                companylogo.SaveAs(Server.MapPath("~/" + clogo));
            }
        }

        void companyupdate()
        {
            int userid = Convert.ToInt32(Session["UserID"]);

            cmd = new SqlCommand(
                "SELECT LogoPath FROM Companies WHERE UserID = '" +
                userid + "'", con);

            object oldlogo = cmd.ExecuteScalar();

            if (oldlogo == null || oldlogo == DBNull.Value)
            {
                clogo = "";
            }
            else
            {
                clogo = oldlogo.ToString();
            }

            companylogoupload();

            cmd = new SqlCommand(
                "UPDATE Companies SET " +
                "CompanyName = '" + companyname.Text + "', " +
                "Website = '" + companywebsite.Text + "', " +
                "Industry = '" + companyindustry.SelectedValue + "', " +
                "Location = '" + companylocation.Text + "', " +
                "ContactPerson = '" + companycontact.Text + "', " +
                "InternshipDomains = '" + companydomain.Text + "', " +
                "LogoPath = " +
                (clogo == "" ? "NULL" : "'" + clogo + "'") +
                " WHERE UserID = '" + userid + "'", con);

            int result = cmd.ExecuteNonQuery();

            cmd = new SqlCommand(
                "UPDATE Users SET Phone = '" + companyphone.Text +
                "' WHERE UserID = '" + userid +
                "' AND Role = 'Company'", con);

            cmd.ExecuteNonQuery();

            if (result == 0)
            {
                throw new Exception("Company profile not found.");
            }
        }

        protected void companysave_Click(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;

            try
            {
                getcon();

                companyupdate();

                con.Close();

                companyfillgrid();

                companysave.Text = "Saved Successfully";
            }
            catch (Exception ex)
            {
                if (con != null && con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                lblCompanyName.Text = "Error: " + ex.Message;
            }
        }

        protected void companyreset_Click(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Company"))
                return;

            companyfillgrid();
        }
    }
}
