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
    public partial class internship_management : System.Web.UI.Page
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
                BindInternships();
            }

        }

        void BindInternships()
        {
            getcon();

            cmd = new SqlCommand(
                "select I.InternshipID, I.Title, I.Location, I.Stipend, I.Duration, I.CreatedAt, " +
                "(select COUNT(*) from Applications A where A.InternshipID = I.InternshipID) as Applicants " +
                "from Internships I " +
                "inner join Companies C on I.CompanyID = C.CompanyID " +
                "where C.UserID='" + Session["UserID"].ToString() + "' " +
                "and I.Title like '%" + txtSearch.Text.Trim() + "%' " +
                "order by I.CreatedAt desc", con);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            gvInternships.DataSource = ds;
            gvInternships.DataBind();

            con.Close();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            BindInternships();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int internshipid = Convert.ToInt32(btn.CommandArgument);

            getcon();

            cmd = new SqlCommand(
                "delete from Internships where InternshipID='" + internshipid + "' " +
                "and CompanyID=(select CompanyID from Companies where UserID='" +
                Session["UserID"].ToString() + "')", con);

            cmd.ExecuteNonQuery();
            con.Close();

            BindInternships();
        }

        protected void gvInternships_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteInternship")
            {
                int internshipid = Convert.ToInt32(e.CommandArgument);

                getcon();

                cmd = new SqlCommand(
                    "delete from Internships where InternshipID='" + internshipid +
                    "' and CompanyID=(select CompanyID from Companies where UserID='" +
                    Session["UserID"].ToString() + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                BindInternships();
            }
        }
    }
}