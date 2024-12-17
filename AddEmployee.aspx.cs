using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeeManagementSystem
{
    public partial class AddEmployee : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["EmployeeDBConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Employee (FirstName, LastName, Email, MobileNo, Department, Salary,Designation) VALUES (@FirstName, @LastName, @Email, @MobileNo, @Department, @Salary,@Designation)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Department", txtDepartment.Text);
                cmd.Parameters.AddWithValue("@Salary", decimal.Parse(txtSalary.Text));
                cmd.Parameters.AddWithValue("@Designation", txtdes.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("DisplayEmployee.aspx"); 
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx"); 
        }
    }
}
