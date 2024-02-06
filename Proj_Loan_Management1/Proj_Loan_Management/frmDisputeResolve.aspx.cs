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
    public partial class frmDisputeResolve : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        Classes.LoanBlockchain blockchain = new Classes.LoanBlockchain();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" },
                //    new MenuItem { Title = "Dispute", Url = "frmDispute.aspx" }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null , null, null },
                { "Loan Approval", "frmLoanApproval.aspx", null, null, null, null  },
                { "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
                { "Dispute", "frmDispute.aspx", null, null, null, null },
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

                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null },

                { "Dispute Resolve", "frmDisputeResolve.aspx", null, null , null, null},
                 { "User Managment", "frmUserManagement.aspx", null, null , null, null},
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
                string htmlNavbar = GenerateNavbar(navbarItems);

                // Display the HTML in a Label control
                lblNavbar.Text = htmlNavbar;
            }


            if (!IsPostBack)
            {
                Load_Grid();
                Load_Customer();

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

        private void Load_Grid()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // string query = "SELECT [Dispute_ID],[Dispute_TotalAmount],[Dispute_PayableAmount],[payment_date],[loan_id],[Customer_id],[Remarks],[Status],[Dispute_date],[Dispute_close_date],[Settle_Amount],[SettleAmount_date],[SettleAMount_by] FROM[dbo].[tbl_dispute] where Status = 1";


                string query = "SELECT dbo.tbl_dispute.Dispute_ID, dbo.tbl_dispute.Dispute_TotalAmount, dbo.tbl_dispute.Dispute_PayableAmount, dbo.tbl_dispute.payment_date, dbo.tbl_dispute.Remarks, dbo.tbl_dispute.Settle_Amount, dbo.tbl_dispute.SettleAmount_date, dbo.tbl_dispute.SettleAMount_by, dbo.tbl_dispute.loan_id, dbo.tbl_dispute.Customer_id, dbo.tbl_dispute.Status, dbo.tbl_dispute.Dispute_date, dbo.tbl_dispute.Dispute_close_date, dbo.tbl_customer.Customer_First_name, ";
                query += "  dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name,Total_PaidAmount FROM  dbo.tbl_dispute INNER JOIN dbo.tbl_loan ON dbo.tbl_dispute.loan_id = dbo.tbl_loan.Loan_id INNER JOIN     dbo.tbl_customer ON dbo.tbl_dispute.Customer_id = dbo.tbl_customer.Customer_id where tbl_dispute.Status=1 ";
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
                ViewState["Dispute_ID"] = row.Cells[0].Text;
                ViewState["loan_id"] = row.Cells[1].Text;
                ViewState["Customer_id"] = row.Cells[2].Text;
                cmbCustomer.SelectedValue= row.Cells[2].Text;
                //txtdate.Text = row.Cells[2].Text;
                txtloanAmount.Text = row.Cells[6].Text;
                txtPaidAmount.Text= row.Cells[8].Text;
                txtRemainingAmount.Text= row.Cells[7].Text;
                txtRemarks.Text= row.Cells[9].Text;
               
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
                Load_Grid();
            }
        }

        private void Load_Customer()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //   string query = "Select 0 Customer_id,'Select ' Customer_First_name Union All select c.Customer_id,c.Customer_First_name from tbl_customer c inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id";
                string query = "  Select '0' Customer_id,'Select ' Customer_First_name  Union All  select  c.Customer_id,c.Customer_First_name from tbl_customer c  inner join tbl_loan_Application A on a.Customer_id = c.Customer_id  Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        cmbCustomer.DataSource = dataTable;
                        cmbCustomer.DataValueField = "Customer_id";
                        cmbCustomer.DataTextField = "Customer_First_name";
                        cmbCustomer.DataBind();
                    }
                }
            }
        }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
  
                    // string query = "INSERT INTO [dbo].[tbl_credit_Report] ([customer_id],[score],[last_update],Loan_Application_id) VALUES (@Customer_id,@score,@last_update,@Loan_Application_id) UPDATE [dbo].[tbl_loan_Application]  SET [status]=2 where [Customer_id] =@Customer_id and Loan_Application_id=@Loan_Application_id";
                    string query = " Update tbl_dispute set Settle_Amount = @Settle_Amount,Status = 2 where Dispute_ID = @Dispute_ID Update tbl_loan_Application set Extra_discount = @Extra_discount where Customer_id = @Customer_id and Loan_id = @Loan_id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Dispute_ID", ViewState["Dispute_ID"].ToString());
                    command.Parameters.AddWithValue("@Settle_Amount", txtDisCountAmount.Text);
                    command.Parameters.AddWithValue("@Extra_discount", txtDisCountAmount.Text);
                    command.Parameters.AddWithValue("@Customer_id", ViewState["Customer_id"].ToString());
                    command.Parameters.AddWithValue("@Loan_id", ViewState["loan_id"].ToString());



                    connection.Open();
                    command.ExecuteNonQuery();

                    //smrtCtrt = new Classes.smartCOntract("", "", "");
                }


                myHiddenDiv.Style["display"] = "none";


                Load_Grid();
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
                    string query = " Update tbl_dispute set Settle_Amount = @Settle_Amount,Status = 2 where Dispute_ID = @Dispute_ID ";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Dispute_ID", ViewState["Dispute_ID"].ToString());
                    command.Parameters.AddWithValue("@Settle_Amount", txtDisCountAmount.Text);
                  
                    myHiddenDiv.Style["display"] = "none";
                    Load_Grid();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}