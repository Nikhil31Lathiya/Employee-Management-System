<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmployeeManagementSystem.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .login-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            height: 20px;
            padding: 10px,10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .logout{
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Admin Login</h2>
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" />
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
            <br />
            <div class="logout">
                <p><a href="Logout.aspx">Logout</a></p>
            </div>
        </div>
    </form>
</body>
</html>





