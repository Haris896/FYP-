using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web.UI;


namespace Proj_Loan_Management
{
    public partial class frmResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT user_pwd FROM tbl_users WHERE user_name = @Email";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        // Send the password reset email
                        SendPasswordResetEmail(email, result.ToString());
                        lblMessage.Text = "Password reset instructions sent to your email.";
                        lblMessage.Visible = true;
                    }
                    else
                    {
                        lblMessage.Text = "Email not found.";
                        lblMessage.Visible = true;
                    }
                }
            }
        }

        private void SendPasswordResetEmail(string toEmail, string password)
        {

            // Configure your SMTP settings
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
            smtpClient.Port = 587;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential("yourgmail@gmail.com", "yourgmailpassword");
            smtpClient.EnableSsl = true;

            // Create the email message
            MailMessage mailMessage = new MailMessage("yourgmail@gmail.com", toEmail);
            mailMessage.Subject = "Password Reset";
            mailMessage.Body = $"Your new password is: {password}";

            // Send the email
            try
            {
                smtpClient.Send(mailMessage);
                lblMessage.Text = "Password reset instructions sent to your email.";
                lblMessage.Visible = true;
            }
            catch (SmtpException ex)
            {
                // Handle exceptions appropriately (log or display an error message)
                lblMessage.Text = $"Error sending email: {ex.Message}";
                lblMessage.Visible = true;
            };
        }

    }
}