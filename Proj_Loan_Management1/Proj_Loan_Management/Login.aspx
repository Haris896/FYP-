<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proj_Loan_Management.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="scripts/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    var $ = jQuery.noConflict();
</script>

   <title>Login Form</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .error-msg {
            color: #ff0000;
            margin-top: 10px;
            text-align: center;
        }
  </style>
</head>
<body>
 <div class="container">
        <h2>Login</h2>
        <form id="formLogin" runat="server">
            <div>
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            </div>
            <div>
                <label for="txtPassword">Password:</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="********"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            </div>
            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblError" runat="server" Text=""  ForeColor ="Red" Visible="false"></asp:Label></h3>
            <br />
                        <br />
             <div>
                 
                 
            </div>
            <div class="error-msg" runat="server" visible="false" id="lblErrorMessage"></div>
        </form>

      <h2><a href="frmCustomer.aspx" >Sign Up</a></h2>      <h2><a href="frmResetPassword.aspx" >Forget Password</a></h2>
    </div>
</body>
</html>
