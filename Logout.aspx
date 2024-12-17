<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="EmployeeManagementSystem.Logout" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex; /* Enable Flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
        }
        .logout-container {
            width: 300px;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center; /* Center text inside the container */
        }
        .logout-container h2 {
            margin-bottom: 20px; /* Space below the heading */
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        .btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-container">
            <h2>You have been logged out.</h2>
            <asp:Button ID="btnRedirect" runat="server" Text="Return to Login" CssClass="btn" OnClick="btnRedirect_Click" />
        </div>
    </form>
</body>
</html>
