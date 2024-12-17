using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class UpdateEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeGrid();
                string employeeId = Request.QueryString["EmployeeID"];
                if (!string.IsNullOrEmpty(employeeId))
                {
                    LoadEmployeeData(employeeId);
                }
                else
                {
                    lblMessage.Text = "Invalid or missing Employee ID.";
                }
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
        private void LoadEmployeeData(string employeeId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Employee WHERE EmployeeID = @EmployeeID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            txtEmployeeID.Text = reader["EmployeeID"].ToString();
                            txtFirstName.Text = reader["FirstName"].ToString();
                            txtLastName.Text = reader["LastName"].ToString();
                            txtEmail.Text = reader["Email"].ToString();
                            txtMobile.Text = reader["MobileNo"].ToString();
                            txtDepartment.Text = reader["Department"].ToString();
                            txtSalary.Text = reader["Salary"].ToString();
                            txtDesignation.Text = reader["Designation"].ToString();
                        }
                        else
                        {
                            lblMessage.Text = "Employee not found.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error loading data: " + ex.Message;
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string employeeId = txtEmployeeID.Text;
            string connectionString = ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Employee SET FirstName = @FirstName, LastName = @LastName, Email = @Email, " +
                               "MobileNo = @MobileNo, Department = @Department, Salary = @Salary, Designation = @Designation " +
                               "WHERE EmployeeID = @EmployeeID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeeID", employeeId);
                    command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    command.Parameters.AddWithValue("@Email", txtEmail.Text);
                    command.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
                    command.Parameters.AddWithValue("@Department", txtDepartment.Text);
                    command.Parameters.AddWithValue("@Salary", txtSalary.Text);
                    command.Parameters.AddWithValue("@Designation", txtDesignation.Text);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        lblMessage.Text = rowsAffected > 0 ? "Employee updated successfully." : "Update operation failed.";

                        BindEmployeeGrid();
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error updating data: " + ex.Message;
                    }
                }
            }
        }

        protected void btnSelect_Command(object sender, CommandEventArgs e)
        {
            string employeeId = e.CommandArgument.ToString();
            LoadEmployeeData(employeeId);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisplayEmployee.aspx");
        }
    }
}
