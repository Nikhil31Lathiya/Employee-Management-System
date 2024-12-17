 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayEmployee.aspx.cs" Inherits="EmployeeManagementSystem.DisplayEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee List</title>
    <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Employee List</h1>
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
                <h2>List of Employees</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" CssClass="grid-view">
                    <Columns>
                        <asp:BoundField DataField="EmployeeId" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" ReadOnly="True" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" ReadOnly="True" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" />
                        <asp:BoundField DataField="MobileNo" HeaderText="Mobile No" ReadOnly="True" />
                        <asp:BoundField DataField="Department" HeaderText="Department" ReadOnly="True" />
                        <asp:BoundField DataField="Salary" HeaderText="Salary" ReadOnly="True" />

                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("EmployeeId") %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("EmployeeId") %>' />
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
