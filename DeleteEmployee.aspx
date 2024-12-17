 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteEmployee.aspx.cs" Inherits="EmployeeManagementSystem.DeleteEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Employee</title>
    <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Delete Employee</h1>
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
                <h2>Delete Employee</h2>
                <div>
                    <label>Employee ID:</label>
                    <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
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
