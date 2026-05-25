using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conStr);

            string query = "SELECT * FROM Users WHERE Email=@Email AND Password=@Password";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["UserId"] = dr["UserId"].ToString();
                Session["UserName"] = dr["FullName"].ToString();

                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Login')</script>");
            }

            con.Close();
        }
    }
}