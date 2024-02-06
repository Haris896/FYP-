<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLoan.aspx.cs" Inherits="Proj_Loan_Management.frmLoan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
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
       
            <%--<div class="container-fluid d-flex justify-content-center ">
            <asp:PlaceHolder ID="menuContainer" runat="server"></asp:PlaceHolder>
                </div>--%>

         <div class="container-fluid d-flex justify-content-center mt-2 mb-2">
    <!-- Other controls may be here -->
            
    <asp:Label ID="lblNavbar" runat="server"></asp:Label>
</div>
       
        </nav>
    <%--nav bar ends here--%>

            <div class="PanelDetails">
                <h2>Customers</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtFirstName" class="form-label">First Name:</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtMiddleName" class="form-label">Middle Name:</label>
                            <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtLastName" class="form-label">Last Name:</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>
                         <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="txtPhoneNumber" class="form-label">Phone Number:</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                                      <label for="txtContactName" class="form-label">Contact Name:</label>
                            <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                             <label for="txtEmailAddress" class="form-label">Email Address:</label>
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                </div>
  

                 <div class="row">
           
                      <div class="col-md-4">
                        <div class="form-group">
                            <label for="ddlSourceOfIncome" class="form-label">Source Of Income:</label>
                            <asp:DropDownList ID="ddlSourceOfIncome" runat="server" CssClass="form-control">
                         <%--       <asp:ListItem Text="City 1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="City 2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="City 3" Value="3"></asp:ListItem>--%>
                           
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                       <label for="txtPhysicalAddress" class="form-label">Physical Address:</label>
                            <asp:TextBox ID="txtPhysicalAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
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
                        <asp:Button ID="btnAdd" runat="server" Text="Add"  CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete"  CssClass="btn btn-danger" />
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

