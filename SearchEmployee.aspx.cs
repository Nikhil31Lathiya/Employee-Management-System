using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class SearchEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string searchTerm = txtSearch.Text.Trim();
                string query;
             
                if (int.TryParse(searchTerm, out int employeeId))
                {
                    query = "SELECT * FROM Employee WHERE EmployeeId = @Search";
                }
                else
                {
                    query = "SELECT * FROM Employee WHERE FirstName LIKE '%' + @Search + '%' OR LastName LIKE '%' + @Search + '%'";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Search", searchTerm);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect($"UpdateEmployee.aspx?id={e.CommandArgument}");
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect($"DeleteEmployee.aspx?id={e.CommandArgument}");
        }
    }
}
