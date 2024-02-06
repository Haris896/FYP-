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

namespace Proj_Loan_Management
{
    public partial class frmUserManagement : System.Web.UI.Page
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

        private void Load_Customer()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
            {
                    //string query = "select Customer_id, Loan_id,Customer_First_name,Customer_Middle_Name,a.Loan_Application_id,Loan_Amount,Isnull(PaidAmount,0) PaidAmount,isnull((Loan_Amount-PaidAmount),0) RemainingAmount from  ";
                    //query += " (select c.Customer_id, l.Loan_id, c.Customer_First_name, c.Customer_Middle_Name, l.Loan_Amount, (select Sum(Payment_Amount) from[tbl_payment] where Loan_id = l.Loan_id) PaidAmount,Loan_Application_id ";
                    //query += " from tbl_customer c inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id where c.IsActive=1 ) as a ";

                    string query = " select Customer_id, Customer_First_name, Customer_Middle_Name, Sum(Loan_Amount)Loan_Amount,";
                    query += " Sum(Isnull(PaidAmount, 0)) PaidAmount, SUm(Extra_discount) Extra_discount, sum(isnull((Loan_Amount - (PaidAmount + Extra_discount)), 0)) RemainingAmount from ";
                    query += " ( ";
                    query += " select c.Customer_id, l.Loan_id, c.Customer_First_name, c.Customer_Middle_Name, l.Loan_Amount,";
                    query += " (select Sum(Payment_Amount) from[tbl_payment] where Loan_id = l.Loan_id) PaidAmount, Loan_Application_id, ISNULL(Extra_discount, 0) Extra_discount  from tbl_customer c ";
                    query += "   inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id where c.IsActive = 1 ";
                    query += " ) as a group by Customer_id,Customer_First_name,Customer_Middle_Name ";

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
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DeleteRow")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[rowIndex];
                    string Customer_ID = row.Cells[0].Text;


                    string Query = "update tbl_customer set IsActive=0 where Customer_id='" + Customer_ID + "' update tbl_users set IsActive=0 where Customer_id='" + Customer_ID + "'";


                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand(Query, connection);
                        command.Parameters.AddWithValue("@Customer_id", Customer_ID);

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                        Load_Customer();

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