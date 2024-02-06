using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data;
using System.Text;

namespace Proj_Loan_Management
{
    public partial class frmCustomer : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        private DataTable imageTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmailAddress.Attributes.Add("onChange", "javascript:CheckAvailability()");
            txtRepeatPassword.Attributes.Add("onChange", "javascript:Validate()");
            //List<MenuItem> menuItems = new List<MenuItem>
            //{
            //    new MenuItem { Title = "Home", Url = "frmCustomer.aspx" },
            //    new MenuItem { Title = "Log Out", Url = "login.aspx" }
          

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
            

            if (!IsPostBack)
            {
            //    CreateImageDataTable();
            //    Load_City();
            //    // Bind data to the GridView
             //  BindGridView();
                GetBanquetDataTable();
            //    Load_Area();
            //    // Create a list of menu items
            //    List<MenuItem> menuItems = new List<MenuItem>
            //{
            //    new MenuItem { Title = "Home", Url = "Home.aspx" },
            //    new MenuItem { Title = "About", Url = "About.aspx" },
            //    new MenuItem { Title = "Services", Url = "ServicesRegisteration.aspx" },
            //    new MenuItem { Title = "Vendor Registeration", Url = "Vendor_Registeration.aspx" },
            //    new MenuItem { Title = "Contact", Url = "Contact.aspx" }
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


            }

            //if (Session["Role_ID"].ToString() == "1")
            //{
            //    List<MenuItem> menuItems = new List<MenuItem>
            //{
            //    new MenuItem { Title = "Home", Url = "DeshBoard.aspx" },
            //    new MenuItem { Title = "Loan Approval", Url = "frmLoanApproval.aspx" },
            //    new MenuItem { Title = "Loan Payment", Url = "frmLoanRepayment.aspx" }

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
            //}
            //else
            //{
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

            //}
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
        private DataTable GetBanquetDataTable()
        {
            // Retrieve the data source (e.g., DataTable) from a database or other source
            // For demonstration purposes, let's assume we have a DataTable called "banquetTable"
            DataTable banquetTable = new DataTable();

            // Add columns to the DataTable
            banquetTable.Columns.Add("BanquetName", typeof(string));
            banquetTable.Columns.Add("ContactName", typeof(string));
            banquetTable.Columns.Add("PhoneNumber", typeof(string));
            banquetTable.Columns.Add("EmailAddress", typeof(string));
            banquetTable.Columns.Add("PhysicalAddress", typeof(string));
            banquetTable.Columns.Add("EventSpaces", typeof(string));
            banquetTable.Columns.Add("AdditionalInfo", typeof(string));

            // Add sample data to the DataTable
            banquetTable.Rows.Add("Banquet 1", "John Doe", "1234567890", "john@example.com", "123 Main St", "Event Space 1", "Additional info 1");
            banquetTable.Rows.Add("Banquet 2", "Jane Smith", "0987654321", "jane@example.com", "456 Elm St", "Event Space 2", "Additional info 2");

            return banquetTable;
        }
        private void BindGridView()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT [Customer_id],[Customer_First_name],[Customer_Middle_Name],[Customer_Last_Name],[Customer_Source_of_income],[Customer_Email_address],[Customer_address],[Customer_Phone],[Customer_Mobile],[IsActive] FROM[dbo].[tbl_customer]";

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
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // DataRow newRow = GetDataRow();

            // Add the image file paths to the row
            //newRow["ImagePaths"] = string.Join(",", imagePaths);
            //banquetTable.Rows.Add(newRow);

           
            string contactName = txtContactName.Text;
            string phoneNumber = txtPhoneNumber.Text;
            int customer_ID = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [dbo].[tbl_customer] ([Customer_First_name],[Customer_Middle_Name],[Customer_Last_Name],[Customer_Source_of_income],[Customer_Email_address],[Customer_address],[Customer_Phone],[Customer_Mobile],[IsActive],City,Source_Of_Income,Monthly_Income,Customer_Gender) ";
                    query += "  VALUES (@Customer_First_name,@Customer_Middle_Name,@Customer_Last_Name,@Customer_Source_of_income,@Customer_Email_address,@Customer_address,@Customer_Phone,@Customer_Mobile,@IsActive,@City,@Source_Of_Income,@Monthly_Income,@Customer_Gender) SELECT SCOPE_IDENTITY()";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Customer_First_name", txtFirstName.Text);
                command.Parameters.AddWithValue("@Customer_Middle_Name", txtMiddleName.Text);
                command.Parameters.AddWithValue("@Customer_Last_Name", txtLastName.Text);
                command.Parameters.AddWithValue("@Customer_Source_of_income", ddlSourceOfIncome.SelectedValue.ToString());
                command.Parameters.AddWithValue("@Customer_Email_address", txtEmailAddress.Text);
                command.Parameters.AddWithValue("@Customer_address", txtPhysicalAddress.Text);
                command.Parameters.AddWithValue("@Customer_Phone", txtPhoneNumber.Text);
                command.Parameters.AddWithValue("@Customer_Mobile", txtContactName.Text);
                command.Parameters.AddWithValue("@IsActive", 1);
                command.Parameters.AddWithValue("@City", ddlCity.SelectedValue.ToString());
                command.Parameters.AddWithValue("@Source_Of_Income", ddlSourceOfIncome.SelectedValue.ToString());
                command.Parameters.AddWithValue("@Monthly_Income", txtMonthlyIncome.Text);
                command.Parameters.AddWithValue("@Customer_Gender", ddlGender.SelectedValue.ToString());
                
                connection.Open();
                customer_ID = Convert.ToInt32(command.ExecuteScalar());


                //   command.ExecuteNonQuery();
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO [dbo].[tbl_users]([user_name],[user_pwd],[role_Id] ,[IsActive],[Customer_ID])  VALUES  (@user_name,@user_pwd,@role_Id,@IsActive ,@Customer_ID)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@user_name", txtEmailAddress.Text);
                command.Parameters.AddWithValue("@user_pwd", txtPassword.Text);
                command.Parameters.AddWithValue("@role_Id", "2");
                command.Parameters.AddWithValue("@IsActive", 1);
                command.Parameters.AddWithValue("@Customer_ID", customer_ID);
                

                connection.Open();
                customer_ID = Convert.ToInt32(command.ExecuteScalar());


                //   command.ExecuteNonQuery();
            }

            Response.Redirect("~/Login.aspx");

            // Refresh the GridView
           // BindGridView();
            ClearFormFields();
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE [dbo].[tbl_customer] SET[Customer_First_name] = @Customer_First_name,[Customer_Middle_Name] = @Customer_Middle_Name,[Customer_Last_Name] = @Customer_Last_Name,[Customer_Source_of_income] = @Customer_Source_of_income,[Customer_Email_address] = @Customer_Email_address,[Customer_address] = @Customer_address,[Customer_Phone] = @Customer_Phone,[Customer_Mobile] = @Customer_Mobile,[IsActive] = @IsActive  WHERE Customer_id='"+ ViewState["CustomerID"].ToString() + "' ";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Customer_First_name", txtFirstName.Text);
                command.Parameters.AddWithValue("@Customer_Middle_Name", txtMiddleName.Text);
                command.Parameters.AddWithValue("@Customer_Last_Name", txtLastName.Text);
                command.Parameters.AddWithValue("@Customer_Source_of_income", ddlSourceOfIncome.SelectedValue.ToString());
                command.Parameters.AddWithValue("@Customer_Email_address", txtEmailAddress.Text);
                command.Parameters.AddWithValue("@Customer_address", txtPhysicalAddress.Text);
                command.Parameters.AddWithValue("@Customer_Phone", txtPhoneNumber.Text);
                command.Parameters.AddWithValue("@Customer_Mobile", txtContactName.Text);
                command.Parameters.AddWithValue("@IsActive", 1);

                connection.Open();
                command.ExecuteNonQuery();
            }

            // Refresh the GridView
            BindGridView();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM [dbo].[tbl_customer]  WHERE Customer_id=@Customer_id";
                 SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Customer_id",  ViewState["CustomerID"].ToString());
                connection.Open();
                command.ExecuteNonQuery();
            }

            // Refresh the GridView
            BindGridView();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                ViewState["CustomerID"] =  row.Cells[0].Text;
                txtContactName.Text = row.Cells[1].Text;
                txtPhoneNumber.Text = row.Cells[2].Text;
            }
            else if (e.CommandName == "DeleteRow")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string banquetName = row.Cells[0].Text;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM [dbo].[tbl_customer]  WHERE Customer_id=@Customer_id";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Customer_id", ViewState["CustomerID"].ToString());
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Refresh the GridView
                BindGridView();
            }
        }
    

        private void ClearFormFields()
        {
            txtFirstName.Text = string.Empty;
            txtMiddleName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtContactName.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtEmailAddress.Text = string.Empty;
            txtPhysicalAddress.Text = string.Empty;
            
        }


        [System.Web.Services.WebMethod]
        public static bool CheckEmail(string email)
            {
            bool status = false;
            string constr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("CheckEmailAvailability", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", email.Trim());
                    conn.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                    conn.Close();
                }
            }
            return status;
        }
    }
}