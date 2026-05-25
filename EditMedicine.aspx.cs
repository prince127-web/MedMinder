using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class EditMedicine : System.Web.UI.Page
    {
        string conStr =
            ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

        int medicineId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            medicineId =
                Convert.ToInt32(Request.QueryString["id"]);

            if (!IsPostBack)
            {
                LoadMedicine();
            }
        }

        void LoadMedicine()
        {
            SqlConnection con = new SqlConnection(conStr);

            string query =
                "SELECT * FROM Medicines WHERE MedicineId=@MedicineId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@MedicineId", medicineId);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtMedicine.Text =
                    dr["MedicineName"].ToString();

                txtDosage.Text =
                    dr["Dosage"].ToString();

                TimeSpan reminderTime =
                    (TimeSpan)dr["ReminderTime"];

                txtTime.Text =
                    reminderTime.ToString(@"hh\:mm");

                txtStart.Text =
                    Convert.ToDateTime(dr["StartDate"])
                    .ToString("yyyy-MM-dd");

                txtEnd.Text =
                    Convert.ToDateTime(dr["EndDate"])
                    .ToString("yyyy-MM-dd");
            }

            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conStr);

            string query = @"
            UPDATE Medicines
            SET MedicineName=@MedicineName,
                Dosage=@Dosage,
                ReminderTime=@ReminderTime,
                StartDate=@StartDate,
                EndDate=@EndDate
            WHERE MedicineId=@MedicineId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@MedicineId", medicineId);

            cmd.Parameters.AddWithValue("@MedicineName",
                txtMedicine.Text);

            cmd.Parameters.AddWithValue("@Dosage",
                txtDosage.Text);

            cmd.Parameters.AddWithValue("@ReminderTime",
                txtTime.Text);

            cmd.Parameters.AddWithValue("@StartDate",
                txtStart.Text);

            cmd.Parameters.AddWithValue("@EndDate",
                txtEnd.Text);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            Response.Redirect("ViewMedicine.aspx");
        }
    }
}