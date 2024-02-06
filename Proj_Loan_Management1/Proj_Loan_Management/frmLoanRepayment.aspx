<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLoanRepayment.aspx.cs" Inherits="Proj_Loan_Management.frmLoanRepayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
      <script>
      $(function () {
          $("#txtdate").datepicker();
      });
  

  </script>
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
</head>
<body>
     <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">

      
    <form id="FormWithColumns" runat="server" enctype="multipart/form-data">
        
                                        <%--nav bar starts here --%>
<nav class="navbar navbar-expand-lg bg-body-tertiary mx-3" style="color:#66707f">

        <div class="container-fluid d-flex justify-content-center mt-2 mb-2">
         <asp:Label ID="lblNavbar" runat="server"></asp:Label>
            </div>
   
    </nav>

            <div class="PanelDetails">
                <h2>Loan Payment</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                              <asp:Label ID="Label1" runat="server" CssClass="form-label" >Customer:</asp:Label>
                              <asp:DropDownList ID="cmbCustomer" runat="server" class="form-control mt-2" OnSelectedIndexChanged="cmbCustomer_SelectedIndexChanged" AutoPostBack="true"  >
                                      

                            </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="cmbCustomer" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                         <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtdate" class="form-label">Date:</label>
                            <asp:TextBox ID="txtdate" runat="server" CssClass="form-control" Enabled="false" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtloanAmount" class="form-label">Loan Amount:</label>
                            <asp:TextBox ID="txtloanAmount" runat="server" CssClass="form-control"  Enabled="false"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtloanAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                
                </div>
                      <div class="row">
               
                              <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtPaidAmount" class="form-label">Paid Amount:</label>
                            <asp:TextBox ID="txtPaidAmount" runat="server" CssClass="form-control"  Enabled="false"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtPaidAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                                                                   <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtExtradiscount" class="form-label">Extra Discount Amount:</label>
                            <asp:TextBox ID="txtExtradiscount" runat="server" CssClass="form-control" Enabled="false" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtExtradiscount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtRemainingAmount" class="form-label">Remaining Amount:</label>
                            <asp:TextBox ID="txtRemainingAmount" runat="server" CssClass="form-control" Enabled="false"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtRemainingAmount" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
           
                              <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtPayAmount" class="form-label">Pay Amount:</label>
                            <asp:TextBox ID="txtPayAMount" runat="server" CssClass="form-control"  />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtPayAMount" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regexValidator" runat="server"
    ControlToValidate="txtPayAMount"
    ErrorMessage="Only numeric input is allowed."
    ValidationExpression="^\d+$"
    Display="Dynamic" />  
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
                        <asp:Button ID="btnAdd" runat="server" Text="Update"  CssClass="btn btn-primary" OnClick="btnAdd_Click" ValidationGroup="a"/>

                     
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False"   >
                            <Columns>
                                 <asp:BoundField DataField="Loan_Application_id" HeaderText="Loan_Application_id" />
                                <asp:BoundField DataField="Customer_id" HeaderText="Customer_id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Customer_First_name" HeaderText="First Name" />
                                <asp:BoundField DataField="Customer_Middle_Name" HeaderText="Middle Name" />
                                  <asp:BoundField DataField="Customer_Last_Name" HeaderText="Last Name" />
                                <asp:BoundField DataField="payment_date" HeaderText="Payment Date"/>
                                 <asp:BoundField DataField="Payment_Amount" HeaderText="Payment Amount" />
                                 
                               
               
                             
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        
    </form>
</body>
</html>
