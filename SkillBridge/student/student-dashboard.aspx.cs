using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkillBridge.student
{
    public partial class student_dashboard : System.Web.UI.Page
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
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Student"))
                return;

            if (!IsPostBack)
            {
                fillstudentname();
                fillcounts();
                fillrecommendations();
                fillactivities();
                fillmatchnotification();
            }
        }

        // Get Student Name
        void fillstudentname()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT FullName FROM Students WHERE UserID = " + Session["UserID"], con);

            object name = cmd.ExecuteScalar();

            if (name != null && name != DBNull.Value)
            {
                lblStudentName.Text = Server.HtmlEncode(name.ToString());
            }
            else
            {
                lblStudentName.Text = "Student";
            }

            con.Close();
        }

        // Get Application Counts
        void fillcounts()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT " +
                "COUNT(*) AS AppliedCount, " +
                "ISNULL(SUM(CASE WHEN A.Status = 'Accepted' THEN 1 ELSE 0 END), 0) AS AcceptedCount, " +
                "ISNULL(SUM(CASE WHEN A.Status = 'Pending' THEN 1 ELSE 0 END), 0) AS PendingCount, " +
                "ISNULL(SUM(CASE WHEN A.Status = 'Rejected' THEN 1 ELSE 0 END), 0) AS RejectedCount " +
                "FROM Applications A " +
                "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                "WHERE S.UserID = " + Session["UserID"], con);

            ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblAppliedCount.Text = ds.Tables[0].Rows[0]["AppliedCount"].ToString();
                lblAcceptedCount.Text = ds.Tables[0].Rows[0]["AcceptedCount"].ToString();
                lblPendingCount.Text = ds.Tables[0].Rows[0]["PendingCount"].ToString();
                lblRejectedCount.Text = ds.Tables[0].Rows[0]["RejectedCount"].ToString();
            }

            con.Close();
        }

        // Get Recommended Internship Count
        void fillrecommendations()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT COUNT(DISTINCT I.InternshipID) " +
                "FROM Internships I " +
                "INNER JOIN Students S ON S.UserID = " + Session["UserID"] + " " +
                "WHERE S.Skills IS NOT NULL AND S.Skills <> '' " +
                "AND EXISTS (" +
                    "SELECT 1 FROM STRING_SPLIT(S.Skills, ',') X " +
                    "WHERE LTRIM(RTRIM(X.value)) <> '' " +
                    "AND I.RequiredSkills LIKE '%' + LTRIM(RTRIM(X.value)) + '%'" +
                ")", con);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            lblRecommendationCount.Text = count + " matches";

            con.Close();
        }

        // Get Recent Activities
        void fillactivities()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT TOP 4 " +
                "CASE " +
                    "WHEN A.Status = 'Accepted' THEN 'Application Accepted' " +
                    "WHEN A.Status = 'Rejected' THEN 'Application Rejected' " +
                    "WHEN A.Status = 'Interview' THEN 'Interview Update' " +
                    "WHEN A.Status = 'Under Review' THEN 'Application Under Review' " +
                    "ELSE 'Applied for Internship' " +
                "END AS ActivityTitle, " +

                "'Your application for ' + I.Title + ' at ' + C.CompanyName + " +
                "' is currently ' + A.Status + '.' AS ActivityDescription, " +

                "A.ApplicationDate AS ActivityDate, " +

                "CASE " +
                    "WHEN A.Status = 'Accepted' THEN 'success' " +
                    "WHEN A.Status = 'Rejected' THEN 'warning' " +
                    "WHEN A.Status = 'Interview' THEN 'primary' " +
                    "WHEN A.Status = 'Under Review' THEN 'info' " +
                    "ELSE 'primary' " +
                "END AS ActivityClass, " +

                "CASE " +
                    "WHEN A.Status = 'Accepted' THEN 'fa-solid fa-circle-check' " +
                    "WHEN A.Status = 'Rejected' THEN 'fa-solid fa-circle-xmark' " +
                    "WHEN A.Status = 'Interview' THEN 'fa-solid fa-envelope' " +
                    "WHEN A.Status = 'Under Review' THEN 'fa-solid fa-clock' " +
                    "ELSE 'fa-solid fa-paper-plane' " +
                "END AS ActivityIcon " +

                "FROM Applications A " +
                "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                "WHERE S.UserID = " + Session["UserID"] + " " +
                "ORDER BY A.ApplicationDate DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            dlRecentActivities.DataSource = ds;
            dlRecentActivities.DataBind();

            if (ds.Tables[0].Rows.Count == 0)
            {
                pnlNoActivities.Visible = true;
            }
            else
            {
                pnlNoActivities.Visible = false;
            }

            con.Close();
        }

        // Get Latest Matching Internship for Notification
        void fillmatchnotification()
        {
            getCon();

            da = new SqlDataAdapter(
                "SELECT TOP 1 I.Title, I.RequiredSkills " +
                "FROM Internships I " +
                "INNER JOIN Students S ON S.UserID = " + Session["UserID"] + " " +
                "WHERE S.Skills IS NOT NULL AND S.Skills <> '' " +
                "AND EXISTS (" +
                    "SELECT 1 FROM STRING_SPLIT(S.Skills, ',') X " +
                    "WHERE LTRIM(RTRIM(X.value)) <> '' " +
                    "AND I.RequiredSkills LIKE '%' + LTRIM(RTRIM(X.value)) + '%'" +
                ") " +
                "ORDER BY I.CreatedAt DESC", con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblMatchTitle.Text = "Recommended Internship";

                lblMatchDescription.Text =
                    "The " +
                    Server.HtmlEncode(ds.Tables[0].Rows[0]["Title"].ToString()) +
                    " position matches at least one of your listed skills.";
            }
            else
            {
                lblMatchTitle.Text = "No Match Found";

                lblMatchDescription.Text =
                    "Complete your profile and add your skills to find matching internships.";
            }

            con.Close();
        }
    }
}