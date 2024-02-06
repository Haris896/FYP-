<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLoanApplication.aspx.cs" Inherits="Proj_Loan_Management.frmLoanApplication" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html>
<head>
    <title>Form with Panels and Columns</title>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <%--<link rel="stylesheet" href="/resources/demos/style.css">--%>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script>
      $(function () {
          $("#txtStartDate").datepicker();
      });
      $(function () {
          $("#txtEndDate").datepicker();
      });

  </script>
    <script type="text/javascript">
   //     function GetSelectedTextValue() {
   //         alert("Selected Text: ");
   //         var ddlFruits = document.getElementById("<%=ddlTenure.ClientID %>");
   //     var selectedText = ddlFruits.options[ddlFruits.selectedIndex].innerHTML;
   //     var selectedValue = ddlFruits.value;
   //     alert("Selected Text: " + selectedText + " Value: " + selectedValue);
   //     return false;
        // }

        //$(document).ready(function () {
        //    //Dropdownlist Selectedchange event
        //    $('#ddlTenure').change(function () {
        //        // Get Dropdownlist seleted item text
        //        $("#txtInterest_rate").text($("#ddlTenure option:selected").text());
        //        // Get Dropdownlist selected item value
        //        $("#txtInterest_rate").text($("#ddlTenure").val());
        //        return false;
        //    })
        //});

        
        function GetMaster1Details() {
            var value = document.getElementById("<%=ddlTenure.ClientID%>").value;;
            var LoanAmount = document.getElementById('<%= txtLoanAmount.ClientID %>').value;
            
           
            if(value == 1)
            {
                var TotalAMount = (5 / 100) * LoanAmount;
               
                var toatlLoanAmount = parseFloat(TotalAMount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "5%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = toatlLoanAmount;
            }
            if (value == 2)
            {
                var TotalAMount = parseFloat((7 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "7%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 3) {
                var TotalAMount = parseFloat((9 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "9%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 4)
            {
                var TotalAMount = parseFloat((11 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "11%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 5)
            {
                var TotalAMount = parseFloat((13 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "13%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 6)
            {
                var TotalAMount = parseFloat((15 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "15%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 7)
            {
                var TotalAMount = parseFloat((17 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "17%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 8)
            {
                var TotalAMount = parseFloat((19 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "19%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 9)
            {
                var TotalAMount = parseFloat((20 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "20%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 10)
            {
                var TotalAMount = parseFloat((21 / 100) * LoanAmount) + parseFloat(LoanAmount);
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = "21%";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = TotalAMount;
            }
            if (value == 0 || LoanAmount=="") {
                document.getElementById('<%=txtInterest_rate.ClientID %>').value = " ";
                document.getElementById('<%=txtTotalLoanAMount.ClientID %>').value = " ";
             }
            
    //var getvalue = value.options[value.selectedIndex].value;
    //var gettext = value.options[value.selectedIndex].text;
    //$("#txtInterest_rate").text($("#ddlTenure").val());
 
}
</script>
</script>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
   <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
              <style>
        /* General Styling */
.panel {
    width: 90%;
    margin: 10px auto;
    border: 1px solid #ccc;
    padding: 10px;
}

.container {
   
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
    <form id="FormWithColumns" runat="server">
        <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">
                                        <%--nav bar starts here --%>
    <nav class="navbar navbar-expand-lg bg-body-tertiary mx-3" style="color:#66707f">
       
            <%--<div class="container-fluid d-flex justify-content-center ">
            <asp:PlaceHolder ID="menuContainer" runat="server"></asp:PlaceHolder>
                </div>--%>

         <div class="container-fluid d-flex justify-content-center mt-2 mb-2">
    <!-- Other controls may be here -->
            
    <asp:Label ID="lblNavbar" runat="server"></asp:Label>
</div>
       
        </nav>
    <%--nav bar ends here--%>
        <div class="container">
                                 


            <div class="PanelDetails">
                <h2>Apply for Loan</h2>
                <div class="row">
                        <div class="col-md-4">
                        <div class="form-group">
                              <asp:Label ID="lblLoanID" runat="server" CssClass="form-label" AssociatedControlID="txtLoanID">Loan ID:</asp:Label>
                        <asp:TextBox ID="txtLoanID" runat="server" CssClass="form-control"  Enabled="false"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                              <asp:Label ID="lblLoanAMount" runat="server" CssClass="form-label" AssociatedControlID="txtLoanAmount">Loan Amount:</asp:Label>
                        <asp:TextBox ID="txtLoanAmount" runat="server" CssClass="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtLoanAmount" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                      <div class="col-md-4">
                        <div class="form-group">
                                   <asp:Label ID="lblTenure" runat="server" CssClass="form-label" >Tenure:</asp:Label>
                              
          
           <%-- <select id="price" name="price" class="form-control">
              <option value="">Select price range</option>
              <option value="0-100">$0 - $100</option>
              <option value="100-500">$100 - $500</option>
              <option value="500-1000">$500 - $1000</option>
              <option value="1000+">$1000+</option>
            </select>--%>

                         <%--     <asp:DropDownList ID="ddlTenure" runat="server" class="form-control"   OnClientClick="return GetSelectedTextValue()">
                                <asp:ListItem Text="1 Year" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2 Year" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3 Year" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4 Year" Value="4"></asp:ListItem>

                            </asp:DropDownList>--%>
                                 <asp:DropDownList ID="ddlTenure" runat="server" class="form-control" onchange="GetMaster1Details()" >
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="1 Year" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2 Year" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3 Year" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4 Year" Value="4"></asp:ListItem>
                                     <asp:ListItem Text="5 Year" Value="5"></asp:ListItem>
                                     <asp:ListItem Text="6 Year" Value="6"></asp:ListItem>
                                     <asp:ListItem Text="7 Year" Value="7"></asp:ListItem>
                                     <asp:ListItem Text="8 Year" Value="8"></asp:ListItem>
                                     <asp:ListItem Text="9 Year" Value="9"></asp:ListItem>
                                     <asp:ListItem Text="10 Year" Value="10"></asp:ListItem>
                         

                            </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="ddlTenure" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
         
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                           <asp:Label ID="lblInterest_rate" runat="server" CssClass="form-label" AssociatedControlID="txtInterest_rate">Interest Rate:</asp:Label>
                        <asp:TextBox ID="txtInterest_rate" runat="server" CssClass="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtInterest_rate" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                           <asp:Label ID="lblStartDate" runat="server" CssClass="form-label" AssociatedControlID="txtStartDate">Start Date:</asp:Label>
                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" name="date"  />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtStartDate" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                     <div class="col-md-4">
                        <div class="form-group">
                           <asp:Label ID="lblEndDate" runat="server" CssClass="form-label" AssociatedControlID="txtEndDate">End Date:</asp:Label>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtEndDate" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                         <div class="col-md-4">
                        <div class="form-group">
                              <asp:Label ID="lblTotalLoanAmount" runat="server" CssClass="form-label" AssociatedControlID="txtTotalLoanAmount">Total Loan Amount:</asp:Label>
                        <asp:TextBox ID="txtTotalLoanAMount" runat="server" CssClass="form-control" />
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ValidationGroup="a" ControlToValidate="txtTotalLoanAMount" ForeColor="Red" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
 
                <div class="row">
                    <div class="col">
                  <%--      <button id="btnAdd" type="button" class="btn btn-primary">Add</button>
                        <button id="btnUpdate" type="button" class="btn btn-success">Update</button>
                        <button id="btnDelete" type="button" class="btn btn-danger">Delete</button>--%>
                                  <asp:Button ID="btnAdd" runat="server" Text="Add"  CssClass="btn btn-primary" OnClick="btnAdd_Click" ValidationGroup="a" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" Visible="false" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"  CssClass="btn btn-danger"  Visible="false" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                            
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand1">
                            <Columns>
                                <asp:BoundField DataField="Loan_id" HeaderText="Loan Id" />
                                <asp:BoundField DataField="Loan_Amount" HeaderText="Loan Amount" />
                                 <asp:BoundField DataField="tenure_id" HeaderText="Tenure" />
                                <asp:BoundField DataField="interest" HeaderText="Interest" />
                                <asp:BoundField DataField="start_date" HeaderText="Start Date" />
                                <asp:BoundField DataField="end_date" HeaderText="End Date" />
                                 <asp:BoundField DataField="Status" HeaderText="Status" />
                                <asp:BoundField DataField="score" HeaderText="Remarks" />
                                
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>

                                        <asp:Button ID="btnEdit" runat="server" Text="Schedule" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-primary btn-sm" />
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                         <div style="width:100%; padding-top:10px" align="center">
        <CR:CrystalReportViewer ID="crv" runat="server" AutoDataBind="true"
            BestFitPage="False" DisplayStatusbar="False" EnableDatabaseLogonPrompt="False"
            EnableDrillDown="False" EnableParameterPrompt="False" EnableTheming="False" HasDrilldownTabs="False"
            HasDrillUpButton="False" HasGotoPageButton="False" HasPrintButton="False" HasToggleGroupTreeButton="False"
            HasToggleParameterPanelButton="False" HasZoomFactorList="False" ReuseParameterValuesOnRefresh="True"
            ToolbarStyle-Width="960px" ToolPanelView="None" Width="930px" PrintMode="ActiveX"
            HasPageNavigationButtons="true" HasCrystalLogo="False"  />
    </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
     


       
    </script>
</body>
</html>