using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class DisplayEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Employee";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int employeeId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"UpdateEmployee.aspx?id={employeeId}");
            }
            else if (e.CommandName == "Delete")
            {
                int employeeId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"DeleteEmployee.aspx?id={employeeId}");
            }
        }
    }
}
