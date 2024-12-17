using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class DeleteEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeGrid();
            }
        }

        private void BindEmployeeGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT EmployeeID, FirstName, LastName, Email, MobileNo, Department, Salary FROM Employee";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error loading employee data: " + ex.Message;
                    }
                }
            }
        }

        //private void LoadEmployeeData(string employeeId)
        //{
        //    string connectionString = ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        string query = "SELECT FirstName, LastName FROM Employee WHERE EmployeeID = @EmployeeID";
        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            command.Parameters.AddWithValue("@EmployeeID", employeeId);
        //            try
        //            {
        //                connection.Open();
        //                SqlDataReader reader = command.ExecuteReader();
        //                if (reader.Read())
        //                {
        //                    txtEmployeeID.Text = employeeId;
        //                    // Uncomment if you want to show FirstName and LastName in the UI
        //                    //txtFirstName.Text = reader["FirstName"].ToString();
        //                    //txtLastName.Text = reader["LastName"].ToString();
        //                }
        //                else
        //                {
        //                    lblMessage.Text = "Employee not found.";
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                lblMessage.Text = "Error loading data: " + ex.Message;
        //            }
        //        }
        //    }
        //}

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string employeeId = txtEmployeeID.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Employee WHERE EmployeeID = @EmployeeID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        lblMessage.Text = rowsAffected > 0 ? "Employee deleted successfully." : "Delete operation failed.";
                        BindEmployeeGrid(); 
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error deleting data: " + ex.Message;
                    }
                }
            }
        }

        protected void btnSelect_Command(object sender, CommandEventArgs e)
        {
            txtEmployeeID.Text = e.CommandArgument.ToString();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayEmployee.aspx");
        }
    }
}
