using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conStr);

            string query = "INSERT INTO Users(FullName,Email,Password) VALUES(@FullName,@Email,@Password)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@FullName", txtName.Text);
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Registration Successful')</script>");
        }
    }
}