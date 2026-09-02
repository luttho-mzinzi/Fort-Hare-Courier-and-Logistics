using System;
using System.Data.SqlClient;
using System.Configuration;

namespace FCLSystem
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match.";
                return;
            }

            if (!chkTerms.Checked)
            {
                lblMessage.Text = "You must agree to the Terms of Service.";
                return;
            }

            string connString = ConfigurationManager.ConnectionStrings["FCLDatabase"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Creating a new Client User based on ERD Table 8 (Users) and Table 10 (Client)
                string userQuery = @"INSERT INTO Users (User_ID, FirstName, LastName, Email, Password, Role_ID) 
                                     OUTPUT INSERTED.User_ID 
                                     VALUES (NEWID(), @FirstName, @LastName, @Email, @Password, @RoleID)";

                string clientQuery = @"INSERT INTO Client (Client_ID, User_ID, AccountStatus, Campus, StudentNumber, CreatedAt) 
                                       VALUES (NEWID(), @UserID, 'Pending', @Campus, @StudentNum, GETDATE())";

                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    Guid newUserId;
                    using (SqlCommand cmdUser = new SqlCommand(userQuery, conn, transaction))
                    {
                        cmdUser.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        cmdUser.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        cmdUser.Parameters.AddWithValue("@Email", txtEmail.Text);
                        // In production, hash the password
                        cmdUser.Parameters.AddWithValue("@Password", txtPassword.Text);
                        cmdUser.Parameters.AddWithValue("@RoleID", Guid.Parse("CLIENT-ROLE-GUID-HERE"));

                        newUserId = (Guid)cmdUser.ExecuteScalar();
                    }

                    using (SqlCommand cmdClient = new SqlCommand(clientQuery, conn, transaction))
                    {
                        cmdClient.Parameters.AddWithValue("@UserID", newUserId);
                        cmdClient.Parameters.AddWithValue("@Campus", ddlCampus.SelectedValue);
                        cmdClient.Parameters.AddWithValue("@StudentNum", txtStudentNumber.Text);
                        cmdClient.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    Response.Redirect("Login.aspx?status=registered");
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.Text = "Registration failed. " + ex.Message;
                }
            }
        }
    }
}