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
    public partial class frmLoanRepayment : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        Classes.LoanBlockchain blockchain = new Classes.LoanBlockchain();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //     new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" },
                //    new MenuItem { Title = "Dispute", Url = "frmDispute.aspx" },
                //    new MenuItem { Title = "Log Out", Url = "login.aspx" }
                //string[,] navbarItems = new string[,] {
                //{ "Home", "DeshBoard.aspx", null, null, null, null },
                //{ "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                //{ "Loan Payment", "frmLoanRepayment.aspx", null, null , null, null},
                //{ "Dispute", "frmDispute.aspx", null, null, null, null },
                //{ "Dispute Resolve", "frmDisputeResolve.aspx", null, null , null, null},
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
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null},
                { "Apply For Loan", "frmLoanApplication.aspx", null, null, null, null }

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
            txtdate.Text = DateTime.Now.ToShortDateString();
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
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //string query = "Select 0 Customer_id,'Select ' Customer_First_name Union All select c.Customer_id,c.Customer_First_name from tbl_customer c inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id";

                string query = "  Select '0' Customer_id,'Select ' Customer_First_name  Union All  select CONVERT(varchar(20), c.Customer_id) + '-' + CONVERT(varchar(20), a.Loan_Application_id) Customer_id,c.Customer_First_name from tbl_customer c  inner join tbl_loan_Application A on a.Customer_id = c.Customer_id  Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id where a.status=2";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        cmbCustomer.DataSource = dataTable;
                        cmbCustomer.DataValueField = "Customer_id";
                        cmbCustomer.DataTextField= "Customer_First_name";
                        cmbCustomer.DataBind();
                    }
                }
            }
        }

        protected void cmbCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //using (SqlConnection connection = new SqlConnection(connectionString))
                //{
                //    string query = "select Loan_id,Customer_First_name,a.Loan_Application_id,Loan_Amount,Isnull(PaidAmount,0) PaidAmount,isnull((Loan_Amount-PaidAmount),0) RemainingAmount from ";
                //    query += " (select l.Loan_id,c.Customer_First_name,l.Total_Amount as Loan_Amount,(select Sum(Payment_Amount) from[tbl_payment] where Loan_id = l.Loan_id) PaidAmount,Loan_Application_id from tbl_customer c ";
                //    query += " inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id ";
                //    query += " where a.Customer_id = '" + cmbCustomer.SelectedValue.ToString()+"') as a ";
                //    using (SqlCommand command = new SqlCommand(query, connection))
                //    {
                //        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                //        {
                //            DataTable dataTable = new DataTable();
                //            adapter.Fill(dataTable);
                //            txtloanAmount.Text = dataTable.Rows[0]["Loan_Amount"].ToString();
                //            txtPaidAmount.Text= dataTable.Rows[0]["PaidAmount"].ToString();
                //            txtRemainingAmount.Text= dataTable.Rows[0]["RemainingAmount"].ToString();
                //            ViewState["Loan_id"]= dataTable.Rows[0]["Loan_id"].ToString();
                //            ViewState["Loan_Application_id"] = dataTable.Rows[0]["Loan_Application_id"].ToString();
                //            BindGridView(cmbCustomer.SelectedValue.ToString(), dataTable.Rows[0]["Loan_id"].ToString());
                //        }
                //    }
                //}

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    //string query = "select Loan_id,Customer_First_name,a.Loan_Application_id,Loan_Amount,Isnull(PaidAmount,0) PaidAmount,isnull((Loan_Amount-PaidAmount),0) RemainingAmount from ";
                    //query += " (select l.Loan_id,c.Customer_First_name,l.Total_Amount as Loan_Amount,(select Sum(Payment_Amount) from[tbl_payment] where Loan_id = l.Loan_id) PaidAmount,Loan_Application_id from tbl_customer c ";
                    //query += " inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id ";
                    //query += " where a.Customer_id = '" + cmbCustomer.SelectedValue.ToString()+"') as a ";

                    string query = " select Loan_id, Customer_First_name, a.Loan_Application_id,Loan_Amount,Isnull(PaidAmount, 0) PaidAmount,isnull((Loan_Amount - PaidAmount), 0) RemainingAmount1,CASE WHEN DATEdIFFERENCE > 0 and Extra_discount!= 0 THEN((DATEdIFFERENCE / 100) * isnull((Loan_Amount -  (isnull(PaidAmount,0)+ISNULL(Extra_discount,0))), 0))  ELSE isnull((Loan_Amount - (isnull(PaidAmount,0)+ISNULL(Extra_discount,0))), 0) END RemainingAmount,ISNULL(Extra_discount,0) Extra_discount ";
                    query += " from(select l.Loan_id, c.Customer_First_name, l.Total_Amount as Loan_Amount, (select Sum(Payment_Amount) from[tbl_payment] where Loan_id = l.Loan_id AND Customer_id = A.Customer_id) PaidAmount,Loan_Application_id,ISNULL((SELECT DATEDIFF(MONTH, (SELECT MAX(payment_date) FROM[tbl_payment] WHERE loan_id = A.Loan_id AND  Customer_id = A.Customer_id), GETDATE())),0) DATEdIFFERENCE,Extra_discount from tbl_customer c ";
                    query += " inner join tbl_loan_Application A on a.Customer_id = c.Customer_id Inner Join tbl_loan AS l On L.Loan_id = a.Loan_id where a.Customer_id = '" + cmbCustomer.SelectedValue.ToString().Split('-')[0] + "' AND Loan_Application_id = '"+ cmbCustomer.SelectedValue.ToString().Split('-')[1] + "') as a ";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);
                            txtloanAmount.Text = dataTable.Rows[0]["Loan_Amount"].ToString();
                            txtPaidAmount.Text = dataTable.Rows[0]["PaidAmount"].ToString();
                            txtRemainingAmount.Text = dataTable.Rows[0]["RemainingAmount"].ToString();
                            txtExtradiscount.Text = dataTable.Rows[0]["Extra_discount"].ToString();
                            ViewState["Loan_id"] = dataTable.Rows[0]["Loan_id"].ToString();
                            ViewState["Loan_Application_id"] = dataTable.Rows[0]["Loan_Application_id"].ToString();
                            BindGridView(cmbCustomer.SelectedValue.ToString().Split('-')[0], dataTable.Rows[0]["Loan_id"].ToString());
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [dbo].[tbl_payment] ([Payment_Amount],[payment_date],[loan_id],[Customer_id])  VALUES (@Payment_Amount,@payment_date,@loan_id ,@Customer_id)";
                    query += " update tbl_Loan_Scheduler set PaidAmount = @Payment_Amount, PaidDate = @payment_date  where Schedule_ID = (select MIN(Schedule_ID) from tbl_Loan_Scheduler where PaidAmount is null and Customer_id = @Customer_id and Loan_Application_id = @Loan_Application_id) ";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Payment_Amount", txtPayAMount.Text);
                    command.Parameters.AddWithValue("@payment_date",Convert.ToDateTime(txtdate.Text));
                    command.Parameters.AddWithValue("@loan_id", ViewState["Loan_id"].ToString());
                    command.Parameters.AddWithValue("@Customer_id", cmbCustomer.SelectedValue.ToString().Split('-')[0]);
                    command.Parameters.AddWithValue("@Loan_Application_id", ViewState["Loan_Application_id"].ToString());
                    
                    connection.Open();
                    command.ExecuteNonQuery();
                    blockchain.AddLoanPayment( Convert.ToDecimal(txtRemainingAmount.Text), cmbCustomer.SelectedValue.ToString().Split('-')[0], ViewState["Loan_Application_id"].ToString());

                    BindGridView(cmbCustomer.SelectedValue.ToString().Split('-')[0], ViewState["Loan_id"].ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void BindGridView(string Customer_Id ,string Loan_Id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "  select c.Customer_id,c.Customer_First_name,c.Customer_Middle_Name,p.payment_date,p.Payment_Amount,l.Loan_Application_id,c.Customer_Last_Name from tbl_customer c ";
                query += "Inner Join tbl_loan_Application L on l.Customer_id = c.Customer_id Inner Join tbl_payment p on p.loan_id = l.Loan_id and c.Customer_id = p.Customer_id ";
                query += " where c.Customer_id = '"+ Customer_Id + "' and l.Loan_id = '"+Loan_Id+"' ";
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