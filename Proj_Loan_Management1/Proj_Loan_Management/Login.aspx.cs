using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proj_Loan_Management
{
    public partial class Login : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Customer_id"] = null;
                Session["Customer_First_name"] = null;
                Session["Role_ID"] = null;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                //string query = "select * from [dbo].[tbl_users] where User_name='"+txtUsername.Text+"' and user_pwd='"+txtPassword.Text+ "' and IsActive=1";
                string query = "SELECT  dbo.tbl_customer.Customer_id, dbo.tbl_customer.Customer_First_name, dbo.tbl_users.user_id, dbo.tbl_users.user_name, dbo.tbl_users.user_pwd, dbo.tbl_users.role_Id, dbo.tbl_users.IsActive ";
                query += " FROM dbo.tbl_users Left JOIN  dbo.tbl_customer ON dbo.tbl_users.Customer_ID = dbo.tbl_customer.Customer_id ";
                query += " where dbo.tbl_users.user_name = '" + txtUsername.Text + "' and user_pwd = '" + txtPassword.Text + "' and dbo.tbl_users.IsActive = '1'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        if (dataTable.Rows.Count > 0)
                        {
                            Session["Customer_id"] = dataTable.Rows[0]["Customer_id"].ToString();
                            Session["Customer_First_name"] = dataTable.Rows[0]["Customer_First_name"].ToString();
                            Session["Role_ID"] = dataTable.Rows[0]["role_Id"].ToString();
                            if (dataTable.Rows[0]["role_Id"].ToString() == "1")
                            {
                                Response.Redirect("~/DeshBoard.aspx");
                            }
                            else
                            {
                                Response.Redirect("~/DeshBoard.aspx");
                            }
                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "User Name Or Password is Invalid";
                        }
                    }
                }
            }
            }
    }
}