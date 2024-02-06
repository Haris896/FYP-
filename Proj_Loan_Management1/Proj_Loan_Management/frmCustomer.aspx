<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCustomer.aspx.cs" Inherits="Proj_Loan_Management.frmCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
          <style>
        /* General Styling */
.panel {
    width: 90%;
    margin: 10px auto;
    border: 1px solid #ccc;
    padding: 10px;
}

.container {
    margin-top: 10vh;
    width: 90%;
    max-width: 95%;
}

.PanelDetails {
    background-color: #f8f8f8;
    padding: 20px;
    width: 90%;
    margin: 10px auto;
    border: 1px solid #ccc;
    padding: 10px;
}

/* Navbar Styling */
body {
    margin: 0;
    font-family: Arial, sans-serif;
}

/* Slider Styling */
.slider-container {
    position: relative;
    max-width: 100%;
    margin: auto;
    overflow: hidden;
}

.slides {
    display: flex;
    transition: transform 0.5s ease-in-out;
}

.slide {
    min-width: 100%;
    box-sizing: border-box;
}

.slide img {
    width: 100%;
    height: auto;
}

/* Navigation Button Styling */
.prev, .next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: auto;
    padding: 16px;
    font-size: 20px;
    font-weight: bold;
    color: white;
    background-color: rgba(0, 0, 0, 0.5);
    border: none;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.prev {
    left: 0;
}

.next {
    right: 0;
}

.prev:hover, .next:hover {
    background-color: rgba(0, 0, 0, 0.8);
}

/* Responsive Navbar Styling */
.navbar {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.navbar li {
    display: inline-block;
    margin-right: 10px;
    position: relative;
}

.navbar li:hover .dropdown {
    display: block;
}

.dropdown {
    display: none;
    position: absolute;
    top: 20px;
    left: 0;
    background-color: #f9f9f9;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    padding: 10px;
    z-index: 1;
    margin-top: 5px;
}

.dropdown li {
    display: block;
    width:190px;
}

/* Navigation Link Styling */
.nav-link, ul li a {
    margin-left: 15px;
    margin-right: 15px;
    color: #66707f;
    font-weight: 600;
    font-size: 20px;
    text-decoration: none;
}

.nav-link:hover, ul li a:hover {
    color: #f51f8a;
    text-decoration: none;
    transition: all 0.3s ease-in-out;
}

/* Responsive Design Adjustments */
@media (max-width: 768px) {
    .navbar {
        text-align: center;
    }

    .navbar li {
        display: block;
        margin: 0;
        padding: 10px 0;
    }

    .navbar li:hover .dropdown {
        display: none;
    }
}

    </style>
 
    <style type="text/css">
    .hiddencol
    {
     display: none;
    }
</style>

    <script type="text/javascript">
    function CheckAvailability() {
        var email = $("#txtEmailAddress").val();
        $.ajax({
            type: "POST",
            url: "frmCustomer.aspx/CheckEmail",
            data: '{email: "' + email + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var message = $("#message");
                if (response.d) {
                    //Email available.
                    message.css("color", "green");
                    message.html("");
                }
                else {
                    //Email not available.
                    message.css("color", "red");
                    message.html("Email is Already available");
                }
            }
        });
    };
 
        function Validate() {
        var password = document.getElementById("<%=txtPassword.ClientID %>").value;
        var confirmPassword = document.getElementById("<%=txtRepeatPassword.ClientID %>").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
        }

    function ValidateMobileNumber() {
        var mobileNumber = document.getElementById("txtMobileNumber").value;
        var lblError = document.getElementById("lblError");
        lblError.innerHTML = "";
        var expr = /^(0|91)?[6-9][0-9]{9}$/;
        if (!expr.test(mobileNumber)) {
            lblError.innerHTML = "Invalid Mobile Number.";
        }
    }
</script>
    <script>
    function ClearMessage() {
        $("#message").html("");
    };
</script>
</head>
<body>
    <form id="FormWithColumns" runat="server" enctype="multipart/form-data">
        <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">
           

            <div class="PanelDetails">
                <h2>Registeration Form</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtFirstName" class="form-label">First Name:</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtMiddleName" class="form-label">Middle Name:</label>
                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtMiddleName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtLastName" class="form-label">Last Name:</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                         <div class="row">
                                                     <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlGender" class="form-label">Gender:</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="-SELECT-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                <asp:ListItem Text="FEMALE" Value="F"></asp:ListItem>
                           
                            </asp:DropDownList>

                            
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="ddlGender" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                                 <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlCity" class="form-label">City:</label>
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control">
                              <asp:ListItem Text="-SELECT-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Karachi" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Hyderabad" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Islamabad" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Lahore" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Sukkur" Value="5"></asp:ListItem>
                           
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="ddlCity" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtPhoneNumber" class="form-label">Phone Number:</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtPhoneNumber" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"  ControlToValidate="txtPhoneNumber" ErrorMessage="Value must be a whole number" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                                      <label for="txtContactName" class="form-label">Contact Name:</label>
                            <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control" />
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtContactName" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                             <label for="txtEmailAddress" class="form-label">Email Address:</label>
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtEmailAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                       <div class="col-md-4">
                        <div class="form-group">
                       <label for="txtEmailAddress" class="form-label"></label>
                            <br />
                            <asp:RegularExpressionValidator ID="emailValidator" runat="server"
    ControlToValidate="txtEmailAddress"
    ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b"
    Display="Dynamic"
    ForeColor="Red"
    ErrorMessage="Invalid email address format"
    ValidationGroup="ValidationGroup1">
</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtEmailAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                            <span id="message"></span>
                        </div>
                    </div>
                </div>
  

                 <div class="row">
           
                      <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlSourceOfIncome" class="form-label">Source Of Income:</label>
                            <asp:DropDownList ID="ddlSourceOfIncome" runat="server" CssClass="form-control">
                               <asp:ListItem Text="-SELECT-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Private Job" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Goverment Job" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Own Bussniss" Value="3"></asp:ListItem>
                           
                            </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="ddlSourceOfIncome" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                             <div class="col-md-4">
                        <div class="form-group">
                             <label for="txtMonthlyIncome" class="form-label">Monthly Income:</label>
                            <asp:TextBox ID="txtMonthlyIncome" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtMonthlyIncome" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>



                    <div class="col-md-4">
                        <div class="form-group">
                       <label for="txtPhysicalAddress" class="form-label">Physical Address:</label>
                            <asp:TextBox ID="txtPhysicalAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtPhysicalAddress" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                                       <div class="col-md-4">
                        <div class="form-group">
                             <label for="txtPassword" class="col-sm-3 col-form-label">Password:</label>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPassword" TextMode="Password" placeholder="********"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="password required" ValidationGroup="a" ControlToValidate="txtPassword" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>

                                 <div class="col-md-4">
                        <div class="form-group">
                             <label for="txtRepeatPassword" class="form-label">Repeat Password:</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtRepeatPassword" TextMode="Password" placeholder="********"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="password required" ValidationGroup="a" ControlToValidate="txtRepeatPassword" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>


               
                </div>
                <div class="row">
                 <div class="col">
    <div class="form-group">
        
    </div>
</div>

                </div>
        
                <div class="row">
                    <div class="col">
                        <asp:Button ID="btnAdd" runat="server" Text="Save"  CssClass="btn btn-primary" OnClick="btnAdd_Click"  ValidationGroup="a"/>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" Visible="false"/>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"  CssClass="btn btn-danger"  Visible="false" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" >
                            <Columns>
                                
                                <asp:BoundField DataField="BQ_ID" HeaderText="Banquet ID" />
                                <asp:BoundField DataField="Name" HeaderText="Banquet Name" />
                                <asp:BoundField DataField="ContactName" HeaderText="Contact Name" />
                                <asp:BoundField DataField="PhoneNo" HeaderText="Phone Number" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-primary btn-sm" />
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        
    </form>
</body>
</html>
