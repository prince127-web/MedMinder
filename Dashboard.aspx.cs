using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            lblName.Text = Session["UserName"].ToString();

            if (!IsPostBack)
            {
                CheckReminder();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            CheckReminder();
        }

        void CheckReminder()
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            SqlConnection con = new SqlConnection(conStr);

            // Convert server time to IST (UTC+5:30)
            TimeZoneInfo istZone = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
            DateTime istNow = TimeZoneInfo.ConvertTime(DateTime.UtcNow, istZone);
            string currentTime = istNow.ToString("HH:mm");

            string query = "SELECT MedicineName, ReminderTime FROM Medicines WHERE UserId=@UserId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserId", Convert.ToInt32(Session["UserId"]));

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;
            while (dr.Read())
            {
                TimeSpan reminderTime = (TimeSpan)dr["ReminderTime"];

                string dbTime = reminderTime.Hours.ToString("D2") + ":" + reminderTime.Minutes.ToString("D2");

                if (dbTime == currentTime)
                {
                    lblReminder.Text = "⏰ Time to take medicine: "
                        + dr["MedicineName"].ToString();

                    found = true;
                }
            }

            if (!found)
            {
                lblReminder.Text = "✅ No medicine reminder right now.";
            }

            con.Close();
        }
    }
}