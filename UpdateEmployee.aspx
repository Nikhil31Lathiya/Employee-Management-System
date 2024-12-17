<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEmployee.aspx.cs" Inherits="EmployeeManagementSystem.UpdateEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Employee</title>
    <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Update Employee</h1>
                <nav>
                    <ul>
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="AddEmployee.aspx">Add Employee</a></li>
                        <li><a href="DisplayEmployee.aspx">View Employees</a></li>
                        <li><a href="SearchEmployee.aspx">Search Employee</a></li>
                        <li><a href="UpdateEmployee.aspx">Update Employee</a></li>
                        <li><a href="DeleteEmployee.aspx">Delete Employee</a></li>
                    </ul>
                </nav>
            </header>
            <main>
                <h2>Update Employee Details</h2>
                <div>
                    <label>Employee ID:</label>
                    <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Mobile No:</label>
                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Department:</label>
                    <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Salary:</label>
                    <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                </div>
                <div>
                    <label>Designation:</label>
                    <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                  <h2>List of Employees</h2>
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="EmployeeID" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" />
                            <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
                            <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" ReadOnly="True" />
                            <asp:BoundField DataField="Department" HeaderText="Department" ReadOnly="True" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnSelect" runat="server" Text="Select" CommandName="Select" CommandArgument='<%# Eval("EmployeeID") %>' OnCommand="btnSelect_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                     </Columns>
               </asp:GridView>

            </main>
            <footer>
                <p>&copy; 2024 Employee Management System</p>
                <p><a href="Logout.aspx">Logout</a></p>
            </footer>
             
        </div>
    </form>
</body>
</html>

