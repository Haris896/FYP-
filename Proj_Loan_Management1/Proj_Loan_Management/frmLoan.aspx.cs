using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace Proj_Loan_Management
{
    public partial class frmLoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role_ID"].ToString() == "1")
            {
                //    List<MenuItem> menuItems = new List<MenuItem>
                //{
                //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
                //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
                //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" }
                string[,] navbarItems = new string[,] {
                { "Home", "DeshBoard.aspx", null, null, null, null },
                { "Loan Approval", "frmLoanApproval.aspx", null, null, null, null },
                { "Loan Payment", "frmLoanRepayment.aspx", null, null, null, null },
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
                { "Home", "DeshBoard.aspx",  null, null },
                { "Apply For Loan", "frmLoanApplication.aspx", null, null },
                //add reports here 
                { "Log Out", "login.aspx", null, null }
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
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Classes.LoanBlockchain BChain = new Classes.LoanBlockchain();
                // BChain.AddLoanRequest("Loan For Testing",1200);
               // BChain.AddLoanInProcess("Loan For Testing", 1200);


                string connectionString =  ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString; ;

                // Create a list to store the retrieved blocks
                List<Block> blocks = new List<Block>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Define your SQL query
                    string sqlQuery = "SELECT * FROM tbl_block_chain_ledger";

                    using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                // Parse the data and create Block objects
                                int index = (int)reader["transaction_id"];
                                string timestamp = (string)reader["timestamp"];
                                string previousHash = (string)reader["PreviousBlock"];
                                string data = (string)reader["Data"];
                                string hash = (string)reader["Hash"];

                                // Create a new Block object and add it to the list
                                //Block block = new Block(index, timestamp, previousHash, data, hash);
                                //blocks.Add(block);
                            }
                        }
                    }

                    connection.Close();
                    // BChain.InsertBlockData("",);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        class Block
        {
            public int Index { get; set; }
            public DateTime Timestamp { get; set; }
            public string PreviousHash { get; set; }
            public string Data { get; set; }
            public string Hash { get; set; }

            public Block(int index, DateTime timestamp, string previousHash, string data)
            {
                Index = index;
                Timestamp = timestamp;
                PreviousHash = previousHash;
                Data = data;
                Hash = CalculateHash();
            }

            public string CalculateHash()
            {
                using (SHA256 sha256 = SHA256.Create())
                {
                    string rawData = $"{Index}{Timestamp}{PreviousHash}{Data}";
                    byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                    StringBuilder builder = new StringBuilder();
                    foreach (byte b in bytes)
                    {
                        builder.Append(b.ToString("x2"));
                    }
                    return builder.ToString();
                }
            }
        }
    }
}