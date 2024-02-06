<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRptSchedule.aspx.cs" Inherits="Proj_Loan_Management.Reports.frmRptSchedule" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />--%>

        <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    /* Slider container */
    .slider-container {
        position: relative;
        max-width: 100%;
        margin: auto;
        overflow: hidden;
    }

    /* Slider wrapper */
    .slides {
        display: flex;
        transition: transform 0.5s ease-in-out;
    }

    /* Individual slide */
    .slide {
        min-width: 100%;
        box-sizing: border-box;
    }

    /* Make images responsive */
    .slide img {
        width: 100%;
        height: auto;
    }

    /* Navigation buttons */
    .prev,
    .next {
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

    .prev:hover,
    .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Navbar styles */
    .navbar {
        list-style-type: none;
        margin: 0;
        padding: 0;
        margin-top: 10px;
        margin-bottom: 15px;
        text-align: center;
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
        z-index: 1; /* Set a higher z-index */
        margin-top: 5px;
    }

    .dropdown li {
        display: block;
        width: 190px;
    }

    /* Navigation links */
    .nav-link,
    ul li a {
        margin-left: 15px;
        margin-right: 15px;
        color: #66707f;
        font-weight: 600;
        font-size: 20px;
        text-decoration: none;
    }

    .nav-link:hover,
    ul li a:hover {
        color: #f51f8a;
        text-decoration: none;
        transition: all 0.3s ease-in-out;
    }

    /* Adjustments for responsive design */
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
      
<style>
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
        .pnlMenu {
            background-color: #f0f0f0;
            padding: 20px;
            width: 90%;
              margin: 10px auto;
            border: 1px solid #ccc;
            padding: 10px;
             height: 6vh;
        }
        .PanelDetails {
            background-color: #f8f8f8;
            padding: 20px;
             width: 90%;
              margin: 10px auto;
            border: 1px solid #ccc;
            padding: 10px;
        }
    </style>

<!-- Missing closing style tag -->
<style type="text/css">
    .hiddencol {
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
        <!-- Other controls may be here -->
                
        <asp:Label ID="lblNavbar" runat="server"></asp:Label>
    </div>
           
            </nav>
        <%--nav bar ends here--%>

            <div class="PanelDetails">
                <h2>Report Of Active Customer</h2>
                <div class="row">
       
                </div>
                        
  

                 
                <div class="row">
                 <div class="col">
    <div class="form-group">
        
    </div>
</div>

                </div>
        
                <div class="row">
                    <div class="col">
                        <asp:Button ID="btnAccept" runat="server" Text="View"  CssClass="btn btn-primary" OnClick="btnAccept_Click" Visible="false" />
                                   <asp:ImageButton ID="btnPDF" runat="server" Height="36px" ImageUrl="~/images/PDF-icon.png"
                    Width="43px" onclick="btnAccept_Click"  Visible="false" />
                                  <asp:ImageButton ID="btnView" runat="server" Height="36px" ImageUrl="~/images/view_button.png"
                    Width="70px" Visible="true" onclick="btnAccept_Click" />
                     
                    </div>
                </div>
                <div class="row">
                   <%-- <div class="col">
                        <CR:CrystalReportViewer ID="crv" runat="server" AutoDataBind="true" />
                          
                    </div>--%>

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
        
    </form>
</body>
</html>
