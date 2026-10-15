using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

namespace SkillBridge.Admin
{
    public partial class reports : System.Web.UI.Page
    {
        // PART 1: DATABASE VARIABLES

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;


        // PART 2: PAGE LOAD

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!SkillBridge.LoginSecurity.CheckRole(this, "Admin"))
                return;

            if (!IsPostBack)
            {
                reportfilldashboard();
            }
        }


        // PART 3: DATABASE CONNECTION

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }


        // PART 4: LOAD REPORT

        void reportfilldashboard()
        {
            try
            {
                reportfillgrid();
            }
            catch (Exception ex)
            {
                lblReportMessage.Text = "Error loading report: " + ex.Message;
            }
        }


        // PART 5: SELECT REPORT QUERY

        void reportfillgrid()
        {
            string query = "";
            string dateColumn = "";
            string reportName = "";

            if (ddlReportType.SelectedValue == "Applications")
            {
                reportName = "Application Report";

                query =
                    "SELECT A.ApplicationID, S.FullName AS StudentName, " +
                    "I.Title AS InternshipTitle, C.CompanyName, " +
                    "A.ApplicationDate, A.Status, A.CoverLetter " +
                    "FROM Applications A " +
                    "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                    "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE 1=1 ";

                dateColumn = "A.ApplicationDate";
            }

            else if (ddlReportType.SelectedValue == "Students")
            {
                reportName = "Student Report";

                query =
                    "SELECT S.StudentID, S.FullName, U.Email, U.Phone, " +
                    "S.College, S.Course, S.Skills, S.GPA, " +
                    "S.GraduationYear, S.DateOfBirth, S.ResumePath, S.CreatedAt " +
                    "FROM Students S " +
                    "INNER JOIN Users U ON S.UserID = U.UserID " +
                    "WHERE 1=1 ";

                dateColumn = "S.CreatedAt";
            }

            else if (ddlReportType.SelectedValue == "Companies")
            {
                reportName = "Company Report";

                query =
                    "SELECT C.CompanyID, C.CompanyName, U.Email, U.Phone, " +
                    "C.Website, C.Industry, C.Location, C.ContactPerson, " +
                    "C.InternshipDomains, C.LogoPath, C.CreatedAt " +
                    "FROM Companies C " +
                    "INNER JOIN Users U ON C.UserID = U.UserID " +
                    "WHERE 1=1 ";

                dateColumn = "C.CreatedAt";
            }

            else if (ddlReportType.SelectedValue == "Internships")
            {
                reportName = "Internship Report";

                query =
                    "SELECT I.InternshipID, I.Title, C.CompanyName, " +
                    "I.Description, I.RequiredSkills, I.Location, I.Stipend, " +
                    "I.InternshipType, I.Deadline, I.CreatedAt " +
                    "FROM Internships I " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE 1=1 ";

                dateColumn = "I.CreatedAt";
            }

            else if (ddlReportType.SelectedValue == "Selection")
            {
                reportName = "Selection Report";

                query =
                    "SELECT A.ApplicationID, S.FullName AS StudentName, " +
                    "I.Title AS InternshipTitle, C.CompanyName, " +
                    "A.ApplicationDate, A.Status " +
                    "FROM Applications A " +
                    "INNER JOIN Students S ON A.StudentID = S.StudentID " +
                    "INNER JOIN Internships I ON A.InternshipID = I.InternshipID " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "WHERE 1=1 ";

                dateColumn = "A.ApplicationDate";
            }

            else if (ddlReportType.SelectedValue == "Registrations")
            {
                reportName = "Registration Report";

                query =
                    "SELECT U.UserID, " +
                    "CASE WHEN U.Role = 'Student' THEN S.FullName " +
                    "WHEN U.Role = 'Company' THEN C.CompanyName " +
                    "ELSE U.Email END AS Name, " +
                    "U.Email, U.Phone, U.Role, U.CreatedAt " +
                    "FROM Users U " +
                    "LEFT JOIN Students S ON U.UserID = S.UserID " +
                    "LEFT JOIN Companies C ON U.UserID = C.UserID " +
                    "WHERE U.Role IN ('Student', 'Company') ";

                dateColumn = "U.CreatedAt";
            }

            else if (ddlReportType.SelectedValue == "Contacts")
            {
                reportName = "Contact Messages Report";

                query =
                    "SELECT ContactID, FullName, Email, Subject, Message, CreatedAt " +
                    "FROM ContactMessages WHERE 1=1 ";

                dateColumn = "CreatedAt";
            }

            else if (ddlReportType.SelectedValue == "Performance")
            {
                reportName = "Internship Performance Report";

                query =
                    "SELECT I.InternshipID, I.Title AS InternshipTitle, " +
                    "C.CompanyName, I.Location, I.Stipend, " +
                    "COUNT(A.ApplicationID) AS TotalApplications, " +
                    "SUM(CASE WHEN A.Status = 'Accepted' THEN 1 ELSE 0 END) AS Accepted, " +
                    "SUM(CASE WHEN A.Status = 'Rejected' THEN 1 ELSE 0 END) AS Rejected, " +
                    "SUM(CASE WHEN A.Status = 'Pending' THEN 1 ELSE 0 END) AS Pending " +
                    "FROM Internships I " +
                    "INNER JOIN Companies C ON I.CompanyID = C.CompanyID " +
                    "LEFT JOIN Applications A ON I.InternshipID = A.InternshipID " +
                    "WHERE 1=1 ";

                dateColumn = "I.CreatedAt";
            }

            else
            {
                lblReportMessage.Text = "Please select a valid report type.";
                return;
            }


            // PART 6: ADD DATE FILTERS

            if (txtFromDate.Text != "")
            {
                query += " AND " + dateColumn + " >= @FromDate ";
            }

            if (txtToDate.Text != "")
            {
                query += " AND " + dateColumn + " < @ToDate ";
            }


            // PART 7: ADD APPLICATION STATUS FILTER

            if (ddlStatus.SelectedValue != "" &&
                (ddlReportType.SelectedValue == "Applications" ||
                 ddlReportType.SelectedValue == "Selection"))
            {
                query += " AND A.Status = @Status ";
            }


            // PART 8: GROUP PERFORMANCE REPORT

            if (ddlReportType.SelectedValue == "Performance")
            {
                query +=
                    " GROUP BY I.InternshipID, I.Title, C.CompanyName, " +
                    "I.Location, I.Stipend ";
            }

            query += " ORDER BY " + dateColumn + " DESC ";


            // PART 9: EXECUTE QUERY

            getcon();

            cmd = new SqlCommand(query, con);

            if (txtFromDate.Text != "")
            {
                DateTime fromDate;

                if (!DateTime.TryParse(txtFromDate.Text, out fromDate))
                {
                    con.Close();
                    lblReportMessage.Text = "Please select a valid From Date.";
                    return;
                }

                cmd.Parameters.AddWithValue("@FromDate", fromDate.Date);
            }

            if (txtToDate.Text != "")
            {
                DateTime toDate;

                if (!DateTime.TryParse(txtToDate.Text, out toDate))
                {
                    con.Close();
                    lblReportMessage.Text = "Please select a valid To Date.";
                    return;
                }

                cmd.Parameters.AddWithValue("@ToDate", toDate.Date.AddDays(1));
            }

            if (ddlStatus.SelectedValue != "" &&
                (ddlReportType.SelectedValue == "Applications" ||
                 ddlReportType.SelectedValue == "Selection"))
            {
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            }

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();

            da.Fill(ds);

            con.Close();


            // PART 10: DISPLAY REPORT

            gvReport.DataSource = ds;
            gvReport.DataBind();

            lblReportTitle.Text = reportName;
            lblRecordCount.Text = ds.Tables[0].Rows.Count + " Records";

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblReportMessage.Text = "Report loaded successfully.";
            }
            else
            {
                lblReportMessage.Text = "No records found for the selected filters.";
            }
        }


        // PART 11: VIEW REPORT BUTTON

        protected void btnViewReport_Click(object sender, EventArgs e)
        {
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                DateTime fromDate;
                DateTime toDate;

                if (!DateTime.TryParse(txtFromDate.Text, out fromDate) ||
                    !DateTime.TryParse(txtToDate.Text, out toDate) ||
                    fromDate.Date > toDate.Date)
                {
                    lblReportMessage.Text =
                        "Please select a valid date range. From Date cannot be after To Date.";

                    return;
                }
            }

            reportfilldashboard();
        }


        // PART 12: CSV VALUE FORMAT

        string CSVValue(string value)
        {
            return "\"" + value.Replace("\"", "\"\"") + "\"";
        }


        // PART 13: DOWNLOAD CSV BUTTON

        protected void btnDownloadCSV_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtFromDate.Text != "" && txtToDate.Text != "")
                {
                    DateTime fromDate;
                    DateTime toDate;

                    if (!DateTime.TryParse(txtFromDate.Text, out fromDate) ||
                        !DateTime.TryParse(txtToDate.Text, out toDate) ||
                        fromDate.Date > toDate.Date)
                    {
                        lblReportMessage.Text = "Please select a valid date range.";
                        return;
                    }
                }

                reportfillgrid();

                if (ds == null || ds.Tables.Count == 0 ||
                    ds.Tables[0].Rows.Count == 0)
                {
                    return;
                }

                StringBuilder csv = new StringBuilder();


                // ADD COLUMN HEADINGS

                for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                {
                    if (i > 0)
                    {
                        csv.Append(",");
                    }

                    csv.Append(CSVValue(ds.Tables[0].Columns[i].ColumnName));
                }

                csv.AppendLine();


                // ADD REPORT RECORDS

                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    for (int i = 0; i < ds.Tables[0].Columns.Count; i++)
                    {
                        if (i > 0)
                        {
                            csv.Append(",");
                        }

                        csv.Append(CSVValue(
                            row[i] == DBNull.Value ? "" : row[i].ToString()));
                    }

                    csv.AppendLine();
                }


                // DOWNLOAD CSV FILE

                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "text/csv";
                Response.ContentEncoding = Encoding.UTF8;

                Response.AddHeader(
                    "Content-Disposition",
                    "attachment;filename=SkillBridge_" +
                    ddlReportType.SelectedValue + "_Report.csv");

                Response.BinaryWrite(Encoding.UTF8.GetPreamble());
                Response.Write(csv.ToString());
                Response.Flush();

                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {
                lblReportMessage.Text = "Error downloading report: " + ex.Message;
            }
        }
    }
}
