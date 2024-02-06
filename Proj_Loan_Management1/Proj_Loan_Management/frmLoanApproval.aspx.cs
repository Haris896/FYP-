using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proj_Loan_Management
{
    public partial class frmLoanApproval : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        Classes.LoanBlockchain blockchain = new Classes.LoanBlockchain();
        Classes.smartCOntract smrtCtrt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" },
                //     new MenuItem { Title = "Log Out", Url = "login.aspx" }
                //string[,] navbarItems = new string[,] {
                //{ "Home", "DeshBoard.aspx", null, null, null, null },
                //{ "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                //{ "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
                //{ "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                //{ "Log Out", "login.aspx", null, null, null, null }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null },
                { "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                { "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
                { "Dispute", "frmDispute.aspx", null, null , null, null},
                { "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "login.aspx", null, null, null, null }
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
                //};

                //    // Generate the menu dynamically
                //    foreach (MenuItem item in menuItems)
                //    {
                //        HyperLink link = new HyperLink();
                //        link.Text = item.Title;
                //        link.NavigateUrl = item.Url;

                //        // Add the link to the menu container
                //        menuContainer.Controls.Add(link);

                //        // Add a separator between menu items
                //        menuContainer.Controls.Add(new LiteralControl(" | "));
                //    }

                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null },
                { "Apply For Loan", "frmLoanApplication.aspx", null, null }
                    };
                string htmlNavbar = GenerateNavbar(navbarItems);

                // Display the HTML in a Label control
                lblNavbar.Text = htmlNavbar;

            }
            if (!IsPostBack)
            {
                BindGridView();

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
        private void BindGridView()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "  select distinct l.Loan_Application_id,C.Customer_id, C.Customer_First_name, C.Customer_Middle_Name, C.Customer_Last_Name,C.Customer_Source_of_income, C.Customer_address, ";
                query += " G.Gender_ID, C.Monthly_Income, G.Gender, tl.Tenure_ID, ten.Duration, t.City_name, t.City_id, s.SOI_id, S.SOI_Description, tl.Loan_id, tl.total_amount Loan_Amount, tl.interest, tl.start_date, tl.end_date,c.Customer_Mobile from tbl_customer C ";
                query += " Inner Join tbl_Gender G on G.Gender_Alias = c.Customer_Gender Inner Join tbl_Source_Of_Income S on S.SOI_id = c.Customer_Source_of_income inner join  tbl_city t on t.City_id = c.City ";
                query += " inner join tbl_loan_Application L on L.Customer_id = c.Customer_id Inner Join tbl_loan tl on tl.Loan_id = l.Loan_id inner join tbl_tenure ten on ten.Tenure_ID = tl.tenure_id where L.status=1 ";
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                ViewState["Loan_Application_id"] = row.Cells[0].Text;
                ViewState["Customer_id"] = row.Cells[1].Text;
                txtFirstName.Text = row.Cells[2].Text;
                txtMiddleName.Text = row.Cells[3].Text;
                txtLastName.Text = row.Cells[4].Text;
                ddlGender.SelectedValue = row.Cells[8].Text;
                ddlCity.SelectedValue = row.Cells[14].Text;
                txtLoanAmount.Text = row.Cells[17].Text;
                txtInterestRate.Text = row.Cells[18].Text;
                ddlTenure.SelectedValue = row.Cells[10].Text;
                //txtPhoneNumber.Text = row.Cells[0].Text;
                txtContactName.Text = row.Cells[21].Text;
                //txtEmailAddress.Text = row.Cells[0].Text;
                ddlSourceOfIncome.SelectedValue = row.Cells[5].Text;
                txtMonthlyIncome.Text = row.Cells[7].Text;
                txtPhysicalAddress.Text = row.Cells[6].Text;
                //txtPassword.Text = row.Cells[0].Text;
                //txtRepeatPassword.Text = row.Cells[0].Text;
                //txtContactName.Text = row.Cells[1].Text;
                //txtPhoneNumber.Text = row.Cells[2].Text;
                myHiddenDiv.Style["display"] = "block";
            }
            else if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string banquetName = row.Cells[0].Text;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM BanquetTable WHERE BanquetName = @BanquetName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@BanquetName", banquetName);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Refresh the GridView
                BindGridView();
            }
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[tbl_credit_Report] ([customer_id],[score],[last_update],Loan_Application_id) VALUES (@Customer_id,@score,@last_update,@Loan_Application_id) UPDATE [dbo].[tbl_loan_Application]  SET [status]=2 where [Customer_id] =@Customer_id and Loan_Application_id=@Loan_Application_id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Customer_id", ViewState["Customer_id"].ToString());
                    command.Parameters.AddWithValue("@score", txtScore.Text);
                    command.Parameters.AddWithValue("@last_update", DateTime.Now.ToString());
                    command.Parameters.AddWithValue("@Loan_Application_id", ViewState["Loan_Application_id"].ToString());


                    connection.Open();
                    command.ExecuteNonQuery();
                    blockchain.AddLoanApproval(Convert.ToDecimal(txtLoanAmount.Text), ViewState["Customer_id"].ToString(), ViewState["Loan_Application_id"].ToString());
                    //smrtCtrt = new Classes.smartCOntract("", "", "");
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {



                    string Qry = "DECLARE @StartDate DATE = '"+ DateTime.Now.ToString() + "'; DECLARE @Amount DECIMAL(18, 2) = '"+ txtLoanAmount.Text + "';";
                    Qry += " DECLARE @Years INT = '"+ ddlTenure.SelectedValue.ToString() + "';";
                    Qry += " WITH DateSeries AS( ";
                    Qry += " SELECT TOP(12 * @Years)";
                    Qry += " DATEADD(MONTH, ROW_NUMBER() OVER(ORDER BY(SELECT NULL)) - 1, @StartDate) AS[Date]";
                    Qry += " FROM master.sys.all_columns ac1 ";
                    Qry += " CROSS JOIN master.sys.all_columns ac2 ";
                    Qry += " )";
                    Qry += " INSERT INTO[dbo].[tbl_Loan_Scheduler] ([Loan_Application_id] ,[Customer_id] ,[Schedule_Year],[Schedule_Month],[AmountPerMonth])";
                    Qry += " SELECT '"+ ViewState["Loan_Application_id"].ToString() + "','"+ ViewState["Customer_id"].ToString() + "',    YEAR(ds.[Date]) AS[Year], ds.[Date] AS[Month], @Amount / (12 * @Years) AS[AmountPerMonth] FROM DateSeries ds;";
                    SqlCommand command = new SqlCommand(Qry, connection);
                    connection.Open();
                    command.ExecuteNonQuery();
                   
                }

                myHiddenDiv.Style["display"] = "none";

                BindGridView();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnRejected_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[tbl_credit_Report] ([customer_id],[score],[last_update],Loan_Application_id) VALUES (@Customer_id,@score,@last_update,@Loan_Application_id) UPDATE [dbo].[tbl_loan_Application]  SET [status]=3 where [Customer_id] =@Customer_id and Loan_Application_id=@Loan_Application_id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Customer_id", ViewState["Customer_id"].ToString());
                    command.Parameters.AddWithValue("@score", txtScore.Text);
                    command.Parameters.AddWithValue("@last_update", DateTime.Now.ToString());
                    command.Parameters.AddWithValue("@Loan_Application_id", ViewState["Loan_Application_id"].ToString());
                    connection.Open();
                    command.ExecuteNonQuery();
                    blockchain.AddLoanRejected( Convert.ToDecimal(txtLoanAmount.Text), ViewState["Customer_id"].ToString(), ViewState["Loan_Application_id"].ToString());
                    BindGridView();
                    myHiddenDiv.Style["display"] = "none";
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}