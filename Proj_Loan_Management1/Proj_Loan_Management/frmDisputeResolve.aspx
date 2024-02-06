<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDisputeResolve.aspx.cs" Inherits="Proj_Loan_Management.frmDisputeResolve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
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
    <form id="FormWithColumns" runat="server" enctype="multipart/form-data">
        
     <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">



                            <%--nav bar starts here --%>
<nav class="navbar navbar-expand-lg bg-body-tertiary mx-3" style="color:#66707f">

        <div class="container-fluid d-flex justify-content-center mt-2 mb-2">
         <asp:Label ID="lblNavbar" runat="server"></asp:Label>
            </div>
   
    </nav>
<%--nav bar ends here--%>

      
 
            <div class="PanelDetails">
                <div id="myHiddenDiv" runat="server" style="display: none;" class="customer_block">
               <h2>Dispute</h2>
                 <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                              <asp:Label ID="Label1" runat="server" CssClass="form-label" >Customer:</asp:Label>
                              <asp:DropDownList ID="cmbCustomer" runat="server" class="form-control"  >
                                      

                            </asp:DropDownList>
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
                            <asp:TextBox ID="txtloanAmount" runat="server" CssClass="form-control" Enabled="false" />
                        </div>
                    </div>
                
                </div>
                      <div class="row">
               
                              <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtPaidAmount" class="form-label">Paid Amount:</label>
                            <asp:TextBox ID="txtPaidAmount" runat="server" CssClass="form-control" Enabled="false" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtRemainingAmount" class="form-label">Remaining Amount:</label>
                            <asp:TextBox ID="txtRemainingAmount" runat="server" CssClass="form-control" Enabled="false" />
                        </div>
                    </div>
                          
                              <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtRemarks" class="form-label">Remarks</label>
                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" />
                        </div>
                    </div>
               
                </div>

                                                      <div class="row">
               
                              <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtDiscountAmount" class="form-label">Discount</label>
                            <asp:TextBox ID="txtDisCountAmount" runat="server" CssClass="form-control" />
                        </div>
                    </div>
       
               
                </div>
                <div class="row">
                 <div class="col">
    <div class="form-group">
        
    </div>
</div>

                </div>
        
                <div class="row mb-2">
                    <div class="col">
                        <asp:Button ID="btnAccept" runat="server" Text="Approved"  CssClass="btn btn-primary"  OnClick="btnAccept_Click"/>
                        <asp:Button ID="btnRejected" runat="server" Text="Reject" CssClass="btn btn-success"  OnClick="btnRejected_Click" />
                     
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" >
                            <Columns>
                                 <asp:BoundField DataField="Dispute_ID" HeaderText="Dispute ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="loan_id" HeaderText="loan ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Customer_id" HeaderText="Customer_id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Customer_First_name" HeaderText="Customer First Name" />
                                <asp:BoundField DataField="Customer_Middle_Name" HeaderText="Customer Middle Name" />
                                <asp:BoundField DataField="Customer_Last_Name" HeaderText="Customer Last Name" />
                                  <asp:BoundField DataField="Dispute_TotalAmount" HeaderText="Dispute TotalAmount" />

                                 <asp:BoundField DataField="Dispute_PayableAmount" HeaderText="Dispute PayableAmount" />
                                 <asp:BoundField DataField="Total_PaidAmount" HeaderText="Total PaidAmount" />
                                 
                               
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
                                      <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                   <%--<asp:BoundField DataField="SOI_id" HeaderText="SOI ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="SOI_Description" HeaderText="SOI Description" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Loan_id" HeaderText="Loan ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                  <asp:BoundField DataField="Loan_Amount" HeaderText="Loan Amount" />
                                  <asp:BoundField DataField="interest" HeaderText="Interest" />
                                <asp:BoundField DataField="start_date" HeaderText="Start Date" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="end_date" HeaderText="End Date" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField DataField="Customer_Mobile" HeaderText="Customer Mobile" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>--%>

                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
<%--                                        code editted toggle added in button to run the script--%>
                                     <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-primary btn-sm"  />
                                 <%--       <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRow" CommandArgument='<%# Container.DataItemIndex %>' CssClass="btn btn-danger btn-sm" />--%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
   <%--    button toggle script starts here--%>
<%--<script>
  
    var myHiddenDivClientId = '<%= myHiddenDiv.ClientID %>';

   
    function toggleVisibility() {
        var div = document.getElementById(myHiddenDivClientId);
        if (div.style.display === 'none') {
            div.style.display = 'block';

        } else {
            div.style.display = 'none';
        }
        return false; 
    }
</script>--%>


      

<%--    button toggle script ends here--%>     
    </form>




</body>
</html>
