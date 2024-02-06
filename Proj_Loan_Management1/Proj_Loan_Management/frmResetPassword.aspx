<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmResetPassword.aspx.cs" Inherits="Proj_Loan_Management.frmResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            max-width: 400px;
            margin: auto;
        }

        .card-header {
            background-color: #007bff;
            color: #ffffff;
            text-align: center;
            font-weight: bold;
        }

        .card-body {
            padding: 20px;
        }

        .btn-reset {
            background-color: #007bff;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
           <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    Reset Password
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="txtEmail">Enter your email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                    </div>
                    <div class="form-group text-center">
                        <asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-reset" Text="Reset Password" OnClick="btnResetPassword_Click" />
                    </div>



                    </div>
                    <div class="alert alert-danger" id="lblErrorMessage" runat="server" Visible="false">
                                                            <asp:Label ID="lblMessage" runat="server" EnableViewState="false" Visible="false" />

                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>