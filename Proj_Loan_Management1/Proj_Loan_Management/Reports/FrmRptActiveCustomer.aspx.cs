using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using CrystalDecisions.Shared;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Proj_Loan_Management.Reports
{
    public partial class FrmRptActiveCustomer : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        private string serverName= @"LAPTOP-KID3V6H4\SQLEXPRESS";
        private string databaseName= "Proj_LoanApp_By_BlockChain";
        private string userIDs = null;
        private string password = null;
        //ReportDocument cryRpt = new ReportDocument();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //           new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" },
                //    new MenuItem { Title = "Dispute", Url = "frmDispute.aspx" },
                //    new MenuItem { Title = "Log Out", Url = "login.aspx" }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null },
                { "Loan Approval", "/frmLoanApproval.aspx", null, null, null, null },
                { "Loan Payment", "/frmLoanRepayment.aspx", null, null, null, null },
                { "Dispute", "/frmDispute.aspx", null, null , null, null},
                { "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "/login.aspx", null, null, null, null }
            };

                //// Generate the menu dynamically
                //foreach (MenuItem item in menuItems)
                //{
                //    HyperLink link = new HyperLink();
                //    link.Text = item.Title;
                //    link.NavigateUrl = item.Url;

                //    // Add the link to the menu container
                //    menuContainer.Controls.Add(link);

                //    // Add a separator between menu items
                //    menuContainer.Controls.Add(new LiteralControl(" | "));
                //}
                // Generate HTML navbar using the 2D array
                string htmlNavbar = GenerateNavbar(navbarItems);

                // Display the HTML in a Label control
                lblNavbar.Text = htmlNavbar;
            }
            else
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Apply For Loan", Url = "frmLoanApplication.aspx" },
                //    new MenuItem { Title = "Log Out", Url = "login.aspx" }
                string[,] navbarItems = new string[,] {
                { "Home", "/DeshBoard.aspx", null, null, null, null },

                { "Dispute Resolve", "/frmDisputeResolve.aspx", null, null , null, null},
                 { "User Managment", "/frmUserManagement.aspx", null, null , null, null},
                { "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "/login.aspx", null, null, null, null }
            };


                //// Generate the menu dynamically
                //foreach (MenuItem item in menuItems)
                //{
                //    HyperLink link = new HyperLink();
                //    link.Text = item.Title;
                //    link.NavigateUrl = item.Url;

                //    // Add the link to the menu container
                //    menuContainer.Controls.Add(link);

                //    // Add a separator between menu items
                //    menuContainer.Controls.Add(new LiteralControl(" | "));
                //}

                string htmlNavbar = GenerateNavbar(navbarItems);

                // Display the HTML in a Label control
                lblNavbar.Text = htmlNavbar;

            }
        }
        private static string GenerateNavbar(string[,] items)
        {
            // Use StringBuilder for efficient string concatenation
            StringBuilder navbarHtml = new StringBuilder("<ul class=\"navbar\">");

            // Iterate through each row in the 2D array
            for (int i = 0; i < items.GetLength(0); i++)
            {
                string text = items[i, 0];
                string link = items[i, 1];

                // Create a list to store child items
                List<string> childItems = new List<string>();

                // Check if there are child items (sub-menu)
                if (items.GetLength(1) > 2 && !string.IsNullOrEmpty(items[i, 2]))
                {
                    // Add child items to the list
                    for (int j = 2; j < items.GetLength(1); j += 2)
                    {
                        string childText = items[i, j];
                        string childLink = items[i, j + 1];
                        childItems.Add("<li><a href=\"" + childLink + "\">" + childText + "</a></li>");
                    }
                }

                // Add an <li> element with an <a> link for each navbar item
                navbarHtml.Append("<li><a href=\"" + link + "\">" + text + "</a>");

                // Check if there are child items (sub-menu)
                if (childItems.Count > 0)
                {
                    // Start the sub-menu
                    navbarHtml.Append("<ul class=\"dropdown\">");

                    // Add child items to the sub-menu
                    foreach (var childItem in childItems)
                    {
                        navbarHtml.Append(childItem);
                    }

                    // End the sub-menu
                    navbarHtml.Append("</ul>");
                }

                // Close the <li> element
                navbarHtml.Append("</li>");
            }

            // End the HTML navbar
            navbarHtml.Append("</ul>");

            // Return the final HTML as a string
            return navbarHtml.ToString();
        }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                string rptFileName = "RptActiveMember.rpt";
                // Create new report document
                var rd = new ReportDocument();

                // Construct full filename pointing to rpt
                //var reportFile = Path.Combine(Environment.CurrentDirectory, @"Reports\", rptFileName);
                var reportFile = Server.MapPath("~/Reports") + "/RptActiveMember.rpt";

                // Load the rpt file
                rd.Load(reportFile);


                // Create connectionInfo object to override default rpt config info
                // Provide login information
                var crConnectionInfo = new ConnectionInfo();

                // In the form - "SERVER_NAME\\SQLEXPRESS"
                // In this example we store serverName, db, user and PW in config table
                // If userID config is not in config table, assume we will use Microsoft integrated security
                crConnectionInfo.ServerName = serverName;
                crConnectionInfo.DatabaseName = databaseName;
                if (userIDs != null)
                {
                    crConnectionInfo.UserID = userIDs;
                    crConnectionInfo.Password = password;
                }
                else
                {
                    crConnectionInfo.IntegratedSecurity = true;
                }

                // For every table defined in rpt, override login info
                var CrTables = rd.Database.Tables;
                foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
                {
                    var crtableLogoninfo = CrTable.LogOnInfo;
                    crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                    CrTable.ApplyLogOnInfo(crtableLogoninfo);
                }
                //var repname = Server.MapPath("~/Reports") + "/DailyAttendanceSht.rpt";
                //cryRpt = objreps.PassCredentials(cryRpt, repname);
                //cryRpt.SetParameterValue("tcode", "'" + cmbTeams.SelectedValue + "'");
                //cryRpt.SetParameterValue("d1", FirstDayOfMonth(dtMonth.SelectedDate.Value));
                //cryRpt.SetParameterValue("d2", LastDayOfMonth(dtMonth.SelectedDate.Value));
                //cryRpt.SetParameterValue("Teamname", cmbTeams.SelectedItem.Text);
                //crv.ReportSource = cryRpt;
                //crv.ReportSource = cryRpt;

                ReportDocument crystalReport = new ReportDocument();
                crystalReport.Load(Server.MapPath("~/Reports") + "/RptActiveMember.rpt");
                DataTable dsCustomers = GetData();
                crystalReport.SetDataSource(dsCustomers);
                crv.ReportSource = crystalReport;
                //commented this 1 line below
                //crv.ReportSource = crystalReport;
                //crv.DisplayGroupTree = false;
                // If this is a web service and you want to return a PDF ...
                //  var s = rd.ExportToStream(ExportFormatType.PortableDocFormat);



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private DataTable GetData()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query = "SELECT        dbo.tbl_loan_Application.Loan_Application_id, dbo.tbl_loan_Application.Customer_id, dbo.tbl_loan_Application.Loan_id, dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.status, ";
                    //query +="dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name, Sum(dbo.tbl_payment.Payment_Amount) PaidAmount ";
                    //query +=" FROM          dbo.tbl_loan_Application ";
                    //query +=" INNER JOIN dbo.tbl_customer ON dbo.tbl_loan_Application.Customer_id = dbo.tbl_customer.Customer_id ";
                    //query +="INNER JOIN dbo.tbl_payment ON dbo.tbl_customer.Customer_id = dbo.tbl_payment.Customer_id ";
                    //query +=" Inner Join tbl_users ON tbl_users.Customer_ID = tbl_loan_Application.Customer_id ";
                    //query +="where tbl_users.IsActive = 1 ";
                    //query +=" Group by ";
                    //query +=" dbo.tbl_loan_Application.Loan_Application_id, dbo.tbl_loan_Application.Customer_id, dbo.tbl_loan_Application.Loan_id, dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.status, ";
                    //query += " dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name ";

                    //string query = "SELECT  distinct dbo.tbl_loan_Application.Customer_id,dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name,l.Loan_Amount, Sum(dbo.tbl_payment.Payment_Amount) PaidAmount ";
                    //query += " FROM  dbo.tbl_loan_Application Inner Join tbl_loan L on l.Loan_id = tbl_loan_Application.Loan_id INNER JOIN dbo.tbl_customer ON dbo.tbl_loan_Application.Customer_id = dbo.tbl_customer.Customer_id ";
                    //query += " INNER JOIN dbo.tbl_payment ON dbo.tbl_customer.Customer_id = dbo.tbl_payment.Customer_id Inner Join tbl_users ON tbl_users.Customer_ID = tbl_loan_Application.Customer_id ";
                    //query += " where tbl_users.IsActive = 1 Group by dbo.tbl_loan_Application.Loan_Application_id, dbo.tbl_loan_Application.Customer_id, dbo.tbl_loan_Application.Loan_id, dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.status, ";
                    //query += " dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name ,l.Loan_Amount ";

                    string query = "SELECT  distinct dbo.tbl_loan_Application.Customer_id,dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name, ";
                    query += "ISNULL(l.Loan_Amount, 0) Loan_Amount,Isnull(App.Extra_discount, 0)Extra_discount, Sum(dbo.tbl_payment.Payment_Amount) PaidAmount FROM  dbo.tbl_loan_Application ";
                    query += "  Inner Join tbl_loan L on l.Loan_id = tbl_loan_Application.Loan_id ";
                    query += "INNER JOIN dbo.tbl_customer ON dbo.tbl_loan_Application.Customer_id = dbo.tbl_customer.Customer_id ";
                    query += "LEFT JOIN dbo.tbl_payment ON dbo.tbl_customer.Customer_id = dbo.tbl_payment.Customer_id ";
                    query += "Inner Join tbl_users ON tbl_users.Customer_ID = tbl_loan_Application.Customer_id ";
                    query += "inner join tbl_loan_Application App on App.Loan_id = l.Loan_id ";
                    query += " where tbl_users.IsActive = 1 ";
                    query += " Group by dbo.tbl_loan_Application.Loan_Application_id, dbo.tbl_loan_Application.Customer_id, dbo.tbl_loan_Application.Loan_id,";
                    query += " dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.status, dbo.tbl_customer.Customer_First_name,  ";
                    query += " dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name ,l.Loan_Amount ,app.Extra_discount ";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            return dataTable;



                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}