<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EmployeeManagementSystem.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        header {
            text-align: center;
            margin-bottom: 20px;
        }
        header h1 {
            color: #007BFF;
        }
        nav {
            background-color: #007BFF;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            text-align: center; 
        }
        nav ul li {
            display: inline;
            margin: 0 15px; 
        }
        nav ul li a {
            text-decoration: none;
            color: white; 
            font-weight: bold;
            padding: 10px 5px; 
            border-radius: 3px; 
            transition: background-color 0.3s;
        }
        nav ul li a:hover {
            background-color: #0056b3; 
        }
        main {
            text-align: center;
            margin-bottom: 20px;
        }
        main h2 {
            color: #333;
        }
        footer {
            text-align: center;
            font-size: 0.9em;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Employee Management System</h1>
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
                <h2>Welcome to the Employee Management System</h2>
                <p>The Employee Management System is a comprehensive platform designed to streamline the management of employee information. It allows for efficient handling of CRUD operations—Create, Read, Update, and Delete—ensuring that employee data is always up-to-date and easily accessible. Admin can add new employees, view detailed employee profiles, search for specific employees, update existing employee information, and delete records as needed. This system is essential for maintaining an organized and efficient workplace, providing a user-friendly interface for managing all aspects of employee data.</p>
            </main>
            <footer>
                <p>&copy; 2024 Employee Management System</p>
                 <p><a href="Logout.aspx">Logout</a></p>
            </footer>
            
        </div>
    </form>
</body>
</html>
