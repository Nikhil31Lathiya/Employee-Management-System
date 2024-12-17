 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchEmployee.aspx.cs" Inherits="EmployeeManagementSystem.SearchEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Employee</title>
    <link rel="stylesheet" type="text/css" href="Styles/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Search Employee</h1>
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
                <h2>Search for an Employee</h2>
                <div>
                    <label>Search by ID or Name:</label>
                    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </div>
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                        <Columns>
                            <asp:BoundField DataField="EmployeeId" HeaderText="ID" />
                            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("EmployeeId") %>' OnCommand="btnEdit_Command" />
                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("EmployeeId") %>' OnCommand="btnDelete_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </main>
            <footer>
                <p>&copy; 2024 Employee Management System</p>
                 <p><a href="Logout.aspx">Logout</a></p>
            </footer>
        </div>
    </form>
</body>
</html>
