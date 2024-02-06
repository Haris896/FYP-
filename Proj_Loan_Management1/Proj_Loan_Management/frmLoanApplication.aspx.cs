using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using CrystalDecisions.Shared;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace Proj_Loan_Management
{
    public partial class frmLoanApplication : System.Web.UI.Page
    {
        public string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        private string serverName = @"LAPTOP-KID3V6H4\SQLEXPRESS";
        private string databaseName = "Proj_LoanApp_By_BlockChain";
        private string userIDs = null;
        private string password = null;
        Classes.LoanBlockchain blockchain = new Classes.LoanBlockchain();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtInterest_rate.Attributes.Add("readonly", "readonly");
            txtTotalLoanAMount.Attributes.Add("readonly", "readonly");
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" },
                //    new MenuItem { Title = "Log Out", Url = "login.aspx" }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null },
                { "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                { "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
                { "Dispute", "frmDispute.aspx", null, null , null, null},
                { "Dispute Resolve", "frmDisputeResolve.aspx", null, null , null, null},
                { "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "login.aspx", null, null, null, null }
            };

                // Generate the menu dynamically
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
            else
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Apply For Loan", Url = "frmLoanApplication.aspx" },
                //        new MenuItem { Title = "Log Out", Url = "login.aspx" },

                //string[,] navbarItems = new string[,] {
                //{ "Home", "DeshBoard.aspx",  null, null },
                //{ "Apply For Loan", "frmLoanApplication.aspx", null, null },
                ////add reports here 
                //{ "Log Out", "login.aspx", null, null }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx",  null, null },
                { "Apply For Loan", "frmLoanApplication.aspx", null, null },
                { "Reports",  null,"Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "login.aspx", null, null }
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
            if (!IsPostBack)
            {
                Load_Grid();
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                txtLoanID.Text = row.Cells[0].Text;
                txtLoanAmount.Text = row.Cells[1].Text;
                ddlTenure.SelectedValue = row.Cells[2].Text;
                txtInterest_rate.Text = row.Cells[3].Text;
                txtStartDate.Text = row.Cells[4].Text;
                txtEndDate.Text = row.Cells[5].Text;

            }

            if (e.CommandName == "DeleteRow")
            {
                string Loan_ID = "";

                string Query = "delete from [dbo].[tbl_block_chain_ledger] where Customer_ID=@Customer_id and Loan_ID=@Loan_ID Delete from tbl_loan where  Loan_ID = @Loan_ID ";
                Query += "Delete from tbl_loan_Application where Customer_ID = @Customer_id and Loan_ID = @Loan_ID";



                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(Query, connection);
                    command.Parameters.AddWithValue("@Loan_ID", txtLoanID.Text);
                    command.Parameters.AddWithValue("@Customer_id", Session["Customer_id"].ToString());

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                
                }

                Load_Grid();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // DataRow newRow = GetDataRow();

            // Add the image file paths to the row
            //newRow["ImagePaths"] = string.Join(",", imagePaths);
            //banquetTable.Rows.Add(newRow);



            int Loan_ID = 0;
            int Loan_Application_ID = 0;

            if (txtLoanID.Text == "")
            {

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[tbl_loan] ([Loan_Amount],[interest],[start_date],[end_date],[status_id],[tenure_id],total_amount) VALUES (@Loan_Amount,@interest,@start_date,@end_date,@status_id,@tenure_id,@total_amount) SELECT SCOPE_IDENTITY()";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Loan_Amount", Convert.ToDouble(txtLoanAmount.Text));
                    command.Parameters.AddWithValue("@interest", Convert.ToDouble((txtInterest_rate.Text).Replace("%", "")));
                    command.Parameters.AddWithValue("@start_date", Convert.ToDateTime(txtStartDate.Text));
                    command.Parameters.AddWithValue("@end_date", Convert.ToDateTime(txtEndDate.Text));
                    command.Parameters.AddWithValue("@status_id", 1);
                    command.Parameters.AddWithValue("@total_amount", Convert.ToDouble(txtTotalLoanAMount.Text));
                    command.Parameters.AddWithValue("@tenure_id", Convert.ToInt32(ddlTenure.SelectedValue.ToString()));


                    connection.Open();
                    Loan_ID = Convert.ToInt32(command.ExecuteScalar());


                    //   command.ExecuteNonQuery();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[tbl_loan_Application] ([Customer_id],[Loan_id],[application_date],[status]) VALUES (@Customer_id,@Loan_id,@application_date, @status) SELECT SCOPE_IDENTITY()";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Customer_id", Session["Customer_id"].ToString());
                    command.Parameters.AddWithValue("@Loan_id", Loan_ID);
                    command.Parameters.AddWithValue("@application_date", DateTime.Now.ToString());
                    command.Parameters.AddWithValue("@status", 1);



                    connection.Open();
                    Loan_Application_ID = Convert.ToInt32(command.ExecuteScalar());


                    //   command.ExecuteNonQuery();
                }

                blockchain.AddLoanRequest(Session["Customer_id"].ToString(), Convert.ToDecimal(txtLoanAmount.Text), Loan_Application_ID.ToString());
                blockchain.AddLoanInProcess(Convert.ToDecimal(txtLoanAmount.Text), Session["Customer_id"].ToString(), Loan_Application_ID.ToString());

                //     public Block AddLoanInProcess(string applicantName, decimal loanAmount, string PrevBlock, string Customer_ID)
                //{
                //    string data = $"Loan In Process: {applicantName}, Amount: ${loanAmount}";
                //    return AddBlock(data, PrevBlock, Customer_ID);
                //    //return AddBlock(data);
                //}

                // Refresh the GridView
                // BindGridView();
            }
            else
            {

                string Query = "delete from [dbo].[tbl_block_chain_ledger] where Customer_ID=@Customer_id and Loan_ID=@Loan_ID ";
                
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(Query, connection);
                    command.Parameters.AddWithValue("@Loan_ID", txtLoanID.Text);
                    command.Parameters.AddWithValue("@Customer_id", Session["Customer_id"].ToString());

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE [dbo].[tbl_loan] SET [Loan_Amount] = @Loan_Amount,[interest] = @interest,[start_date] = @start_date ,[end_date] = @end_date    ,[status_id] = @status_id   ,[tenure_id] = @tenure_id,total_amount=@total_amount WHERE Loan_id='" + txtLoanID.Text+"'";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Loan_Amount", Convert.ToDouble(txtLoanAmount.Text));
                    command.Parameters.AddWithValue("@interest", Convert.ToDouble((txtInterest_rate.Text).Replace("%", "")));
                    command.Parameters.AddWithValue("@start_date", Convert.ToDateTime(txtStartDate.Text));
                    command.Parameters.AddWithValue("@end_date", Convert.ToDateTime(txtEndDate.Text));
                    command.Parameters.AddWithValue("@status_id", 1);
                    command.Parameters.AddWithValue("@total_amount", Convert.ToDouble(txtTotalLoanAMount.Text));
                    command.Parameters.AddWithValue("@tenure_id", Convert.ToInt32(ddlTenure.SelectedValue.ToString()));

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();


                    //   command.ExecuteNonQuery();
                }


                blockchain.AddLoanRequest(Session["Customer_id"].ToString(), Convert.ToDecimal(txtLoanAmount.Text), txtLoanID.Text);
                blockchain.AddLoanInProcess(Convert.ToDecimal(txtLoanAmount.Text), Session["Customer_id"].ToString(), txtLoanID.Text);


            }
            Load_Grid();
            ClearFormFields();
        }

        private void Load_Grid()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //string query = "select tenure_id, a.Loan_Application_id,Loan_Amount,interest,start_date,end_date,case when a.status=1 then 'In Process'  when a.status=2 then 'Loan Approved' end as Status from tbl_loan as l Inner Join tbl_loan_Application as A on a.Loan_id = l.Loan_id where a.Customer_id = '" + Session["Customer_id"].ToString() + "'";
                string query = "select tenure_id, a.Loan_id,Loan_Amount,interest,start_date,end_date,case when a.status=1 then 'In Process'  when a.status=2 then 'Loan Approved' end as Status,c.score from tbl_loan as l Inner Join tbl_loan_Application as A on a.Loan_id = l.Loan_id left join tbl_credit_Report c on c.Loan_Application_id = a.Loan_Application_id where a.Customer_id = '" + Session["Customer_id"].ToString() + "'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                }
            }
        }

        private void ClearFormFields()
        {
            txtLoanAmount.Text = string.Empty;
            txtInterest_rate.Text = string.Empty;
            txtStartDate.Text = string.Empty;
            txtEndDate.Text = string.Empty;

        }

        protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                txtLoanID.Text = row.Cells[0].Text;
                txtLoanAmount.Text = row.Cells[1].Text;
                ddlTenure.SelectedValue = row.Cells[2].Text;
                txtInterest_rate.Text = row.Cells[3].Text+"%";
                txtStartDate.Text = row.Cells[4].Text;
                txtEndDate.Text = row.Cells[5].Text;

                try
                {
                    string rptFileName = "RptSchedule.rpt";
                    // Create new report document
                    var rd = new ReportDocument();

                    // Construct full filename pointing to rpt
                    //var reportFile = Path.Combine(Environment.CurrentDirectory, @"Reports\", rptFileName);
                    var reportFile = Server.MapPath("~/Reports") + "/RptSchedule.rpt";

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
                  

                    ReportDocument crystalReport = new ReportDocument();
                    crystalReport.Load(Server.MapPath("~/Reports") + "/RptSchedule.rpt");
                    DataTable dsCustomers = GetData(txtLoanID.Text, Session["Customer_id"].ToString());
                    crystalReport.SetDataSource(dsCustomers);
                    crv.ReportSource = crystalReport;
                    // byte[] pdfBytes = rd.ExportToStream(ExportFormatType.PortableDocFormat).ToArray();
                    // Export the report to PDF
                    Stream stream = rd.ExportToStream(ExportFormatType.PortableDocFormat);

                    byte[] pdfBytes;

                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        stream.CopyTo(memoryStream);
                        pdfBytes = memoryStream.ToArray();
                    }

                    // Provide the file name for the downloaded PDF file
                    string fileName = "InstallmentSchedule"+DateTime.Now.ToString()+".pdf";

                    // Send the PDF file to the response output stream
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                    Response.BinaryWrite(pdfBytes);
                    Response.End();



                    //crv.DisplayGroupTree = false;
                    // If this is a web service and you want to return a PDF ...
                    //  var s = rd.ExportToStream(ExportFormatType.PortableDocFormat);



                }
                catch (Exception ex)
                {
                    throw ex;
                }


            }
            if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex]; 
                string Loan_ID = row.Cells[0].Text;
                string StatusDesc = row.Cells[6].Text;
                if (StatusDesc != "In Process")
                {

                    return;
                }
                else
                {


                    string Query = "delete from [dbo].[tbl_block_chain_ledger] where Customer_ID=@Customer_id and Loan_ID=@Loan_ID Delete from tbl_loan where  Loan_ID = @Loan_ID ";
                    Query += "Delete from tbl_loan_Application where Customer_ID = @Customer_id and Loan_ID = @Loan_ID";



                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand(Query, connection);
                        command.Parameters.AddWithValue("@Loan_ID", row.Cells[0].Text);
                        command.Parameters.AddWithValue("@Customer_id", Session["Customer_id"].ToString());

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }

                    Load_Grid();
                }
            }
        }

        private DataTable GetData(string Loan_ID,string Customer_ID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    string query = " SELECT        dbo.tbl_Loan_Scheduler.Loan_Application_id, dbo.tbl_Loan_Scheduler.Schedule_Year, dbo.tbl_Loan_Scheduler.Schedule_Month, dbo.tbl_Loan_Scheduler.AmountPerMonth, dbo.tbl_Loan_Scheduler.PaidAmount, ";
                     query+= " dbo.tbl_Loan_Scheduler.PaidDate, dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name, dbo.tbl_customer.Source_Of_Income, dbo.tbl_city.City_id, ";
                    query += " dbo.tbl_customer.City, dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.Extra_discount, dbo.tbl_city.City_name, dbo.tbl_Loan_Scheduler.Customer_id ";
                    query += " FROM            dbo.tbl_Loan_Scheduler INNER JOIN ";
                    query += " dbo.tbl_customer ON dbo.tbl_Loan_Scheduler.Customer_id = dbo.tbl_customer.Customer_id INNER JOIN ";
                    query += " dbo.tbl_loan_Application ON dbo.tbl_Loan_Scheduler.Loan_Application_id = dbo.tbl_loan_Application.Loan_Application_id INNER JOIN ";
                    query += " dbo.tbl_city ON dbo.tbl_customer.City = dbo.tbl_city.City_id ";
                    query += "where Loan_id='"+ Loan_ID + "' and dbo.tbl_Loan_Scheduler.Customer_id='" + Customer_ID + "'";

                    //string query = " select c.Customer_id,c.Customer_First_name,c.Customer_Middle_Name,p.payment_date,p.Payment_Amount,l.Loan_Application_id,c.Customer_Last_Name from tbl_customer c ";
                    //query += " inner Join tbl_users u on u.Customer_ID = c.Customer_id   Inner Join tbl_loan_Application L on l.Customer_id = c.Customer_id   Inner Join tbl_payment p on p.loan_id = l.Loan_id and c.Customer_id = p.Customer_id  where u.IsActive = 1  and c.Customer_id = '5' and l.Loan_id = '3' ";


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