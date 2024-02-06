<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Proj_Loan_Management.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8">
    <title>Registration Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

    <!-- STYLE CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="wrapper" style="background-image: url('images/1.jpg');">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="inner">
                        <form runat="server" id="form1" class="mt-5">
                            <h3 class="text-center mb-4">Registration Form</h3>
                            <div class="form-group row">
                                <label for="txtUsername" class="col-sm-3 col-form-label">Username:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-account-o"></i></span>
                                        </div>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtUsername"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtEmail" class="col-sm-3 col-form-label">Email:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i style="font-style: normal; font-size: 15px;">@</i></span>
                                        </div>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtPassword" class="col-sm-3 col-form-label">Password:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-lock-outline"></i></span>
                                        </div>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" placeholder="********"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="txtRepeatPassword" class="col-sm-3 col-form-label">Repeat Password:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-lock-outline"></i></span>
                                        </div>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtRepeatPassword" TextMode="Password" placeholder="********"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ddlCountry" class="col-sm-3 col-form-label">Country:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-pin"></i></span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCountry">
                                            <asp:ListItem Text="United States" Value="united states" />
                                            <asp:ListItem Text="United Kingdom" Value="united kingdom" />
                                            <asp:ListItem Text="Viet Nam" Value="viet nam" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ddlCity" class="col-sm-3 col-form-label">City:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-pin"></i></span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCity">
                                            <asp:ListItem Text="City 1" Value="city1" />
                                            <asp:ListItem Text="City 2" Value="city2" />
                                            <asp:ListItem Text="City 3" Value="city3" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ddlArea" class="col-sm-3 col-form-label">Area:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-pin"></i></span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlArea">
                                            <asp:ListItem Text="Area 1" Value="area1" />
                                            <asp:ListItem Text="Area 2" Value="area2" />
                                            <asp:ListItem Text="Area 3" Value="area3" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ddlGender" class="col-sm-3 col-form-label">Gender:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-face"></i></span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlGender">
                                            <asp:ListItem Text="Male" Value="male" />
                                            <asp:ListItem Text="Female" Value="female" />
                                            <asp:ListItem Text="Other" Value="other" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ddlUserType" class="col-sm-3 col-form-label">User Type:</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"><i class="zmdi zmdi-person"></i></span>
                                        </div>
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlUserType">
                                            <asp:ListItem Text="Customer" Value="customer" />
                                            <asp:ListItem Text="Vendor" Value="vendor" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <div class="form-check">
                                        <asp:CheckBox runat="server" ID="chkAgree" CssClass="form-check-input" />
                                        <label class="form-check-label" for="chkAgree">I agree to the Terms of Use</label>
                                    </div>
                                </div>
                            </div>
                                  <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <div class="form-check">
                                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                      

                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button runat="server" ID="btnRegister" Text="Register Now"  CssClass="btn btn-primary" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
