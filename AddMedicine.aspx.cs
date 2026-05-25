using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class AddMedicine : System.Web.UI.Page
    {
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string conStr = ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

            SqlConnection con = new SqlConnection(conStr);

            string query = "INSERT INTO Medicines(UserId,MedicineName,Dosage,ReminderTime,StartDate,EndDate) VALUES(@UserId,@MedicineName,@Dosage,@ReminderTime,@StartDate,@EndDate)";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"]));
            cmd.Parameters.AddWithValue("@MedicineName", txtMedicine.Text);
            cmd.Parameters.AddWithValue("@Dosage", txtDosage.Text);
            cmd.Parameters.AddWithValue("@ReminderTime", txtTime.Text);
            cmd.Parameters.AddWithValue("@StartDate", txtStart.Text);
            cmd.Parameters.AddWithValue("@EndDate", txtEnd.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>alert('Medicine Added Successfully')</script>");
        }
    }
}