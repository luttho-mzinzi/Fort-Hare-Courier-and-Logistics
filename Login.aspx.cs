using System;
using System.Data.SqlClient;
using System.Configuration;

namespace FCLSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["FCLDatabase"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Joins User table with Role and Client tables to verify RBAC and Account Status
                string query = @"SELECT u.User_ID, r.RoleName, c.AccountStatus 
                                 FROM Users u 
                                 INNER JOIN Role r ON u.Role_ID = r.Role_ID
                                 LEFT JOIN Client c ON u.User_ID = c.User_ID
                                 WHERE u.Email = @Email AND u.Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string role = reader["RoleName"].ToString();

                            if (role == "Client")
                            {
                                string status = reader["AccountStatus"].ToString();
                                if (status == "Pending")
                                {
                                    lblError.Text = "Your account is pending Admin approval.";
                                    return;
                                }
                                Response.Redirect("ClientDashboard.aspx");
                            }
                            else if (role == "Admin")
                            {
                                Response.Redirect("AdminDashboard.aspx");
                            }
                            // Route Warehouse and Driver roles similarly
                        }
                        else
                        {
                            lblError.Text = "Invalid email or password.";
                        }
                    }
                }
            }
        }
    }
}