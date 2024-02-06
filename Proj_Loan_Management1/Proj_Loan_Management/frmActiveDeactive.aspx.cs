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
    public partial class frmActiveDeactive : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        Classes.LoanBlockchain blockchain = new Classes.LoanBlockchain();
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
                { "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                { "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
                { "Dispute", "frmDispute.aspx", null, null , null, null},
                { "Reports", null, "Active Customer", "/Reports/FrmRptActiveCustomer.aspx","Payment Details", "/Reports/Rpt_PaymentDetails.aspx" },
                { "Log Out", "login.aspx", null, null, null, null }
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
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                //ViewState["Loan_Application_id"] = row.Cells[0].Text;
                ViewState["Customer_id"] = row.Cells[1].Text;
                //txtFirstName.Text = row.Cells[2].Text;
                //txtMiddleName.Text = row.Cells[3].Text;
                //txtLastName.Text = row.Cells[4].Text;
                //ddlGender.SelectedValue = row.Cells[8].Text;
                //ddlCity.SelectedValue = row.Cells[14].Text;
                //txtLoanAmount.Text = row.Cells[17].Text;
                //txtInterestRate.Text = row.Cells[18].Text;
                //ddlTenure.SelectedValue = row.Cells[10].Text;
                ////txtPhoneNumber.Text = row.Cells[0].Text;
                //txtContactName.Text = row.Cells[21].Text;
                ////txtEmailAddress.Text = row.Cells[0].Text;
                //ddlSourceOfIncome.SelectedValue = row.Cells[5].Text;
                //txtMonthlyIncome.Text = row.Cells[7].Text;
                //txtPhysicalAddress.Text = row.Cells[6].Text;
                //txtPassword.Text = row.Cells[0].Text;
                //txtRepeatPassword.Text = row.Cells[0].Text;
                //txtContactName.Text = row.Cells[1].Text;
                //txtPhoneNumber.Text = row.Cells[2].Text;
            }
            else if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string UserID = row.Cells[0].Text;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query = "DELETE FROM BanquetTable WHERE BanquetName = @BanquetName";
                    string query = "update tbl_users set IsActive=0 where user_id=@UserID";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@UserID", UserID);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Refresh the GridView
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "   SELECT  distinct dbo.tbl_loan_Application.Customer_id,dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name,l.Loan_Amount, Sum(dbo.tbl_payment.Payment_Amount) PaidAmount ";
                query += "  FROM          dbo.tbl_loan_Application Inner Join tbl_loan L on l.Loan_id = tbl_loan_Application.Loan_id INNER JOIN dbo.tbl_customer ON dbo.tbl_loan_Application.Customer_id = dbo.tbl_customer.Customer_id ";
                query += " INNER JOIN dbo.tbl_payment ON dbo.tbl_customer.Customer_id = dbo.tbl_payment.Customer_id Inner Join tbl_users ON tbl_users.Customer_ID = tbl_loan_Application.Customer_id where tbl_users.IsActive = 1 Group by ";
                query += " dbo.tbl_loan_Application.Loan_Application_id, dbo.tbl_loan_Application.Customer_id, dbo.tbl_loan_Application.Loan_id, dbo.tbl_loan_Application.application_date, dbo.tbl_loan_Application.status, ";
                query += " dbo.tbl_customer.Customer_First_name, dbo.tbl_customer.Customer_Middle_Name, dbo.tbl_customer.Customer_Last_Name ,l.Loan_Amount      ";
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

    }
}