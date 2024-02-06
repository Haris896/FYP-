<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUserManagement.aspx.cs" Inherits="Proj_Loan_Management.frmUserManagement" %>

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
            
    //var getvalue = value.options[value.selectedIndex].value;
    //var gettext = value.options[value.selectedIndex].text;
    //$("#txtInterest_rate").text($("#ddlTenure").val());
 

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
                <h2>Customers</h2>
        
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"   >
                            <Columns>
                                 <%--<asp:BoundField DataField="Loan_Application_id" HeaderText="Loan_Application_id" />--%>
                                <asp:BoundField DataField="Customer_id" HeaderText="Customer_id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Customer_First_name" HeaderText="First Name" />
                                <asp:BoundField DataField="Customer_Middle_Name" HeaderText="Middle Name" />
                                <asp:BoundField DataField="Loan_Amount" HeaderText="Loan Amount" />
                                <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount"/>
                                <asp:BoundField DataField="Extra_discount" HeaderText="Payment Amount" />
                                <asp:BoundField DataField="RemainingAmount" HeaderText="Remaing Amount" />
                               
                                    <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>


                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" />

                                    </ItemTemplate>
                                </asp:TemplateField>
                             
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
     


       
    </script>
</body>
</html>