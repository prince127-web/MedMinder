using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MedMinder
{
    public partial class ViewMedicine : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["MedMinderDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check login session
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadData();
            }
        }

        // Load medicines into GridView
        void LoadData()
        {
            SqlConnection con = new SqlConnection(conStr);

            string query = "SELECT * FROM Medicines WHERE UserId=@UserId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dt = new DataTable();

            da.Fill(dt);

            GridView1.DataSource = dt;

            GridView1.DataBind();
        }

        // Delete Medicine
        protected void GridView1_RowDeleting(object sender,
            System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int medicineId =
                Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SqlConnection con = new SqlConnection(conStr);

            string query =
                "DELETE FROM Medicines WHERE MedicineId=@MedicineId";

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@MedicineId", medicineId);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            LoadData();
        }

        // Edit Medicine
        protected void GridView1_RowEditing(object sender,
            System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int medicineId =
                Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            Response.Redirect("EditMedicine.aspx?id=" + medicineId);
        }
    }
}