<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeshBoard.aspx.cs" Inherits="Proj_Loan_Management.DeshBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Form with Panels and Columns</title>
    <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />--%>
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

/* Navbar styles */
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
    z-index: 1; /* Set a higher z-index */
    margin-top:5px;
}

.dropdown li {
    display: block;
    width:190px;
}

/* Navigation links */
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

</head>
<body>
      <hr style="background-color: #084e98; height: 21px; border: 0; margin: 0;">
    <form id="FormWithColumns" runat="server" enctype="multipart/form-data">
       
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

         
         
               
      
      
     




<%--        new code--%>
         <div class="slider-container">
        <div class="slides">
            <!-- Add your images here -->
            <div class="slide"><img src="images/loan.jpg" alt="Image 1"></div>
            <div class="slide"><img src="images/education_loan.jpg" alt="Image 2"></div>
            <div class="slide"><img src="images/business_loan.jpg" alt="Image 3"></div>
        </div>

        <button class="prev" onclick="prevSlide()">&#10094;</button>
        <button class="next" onclick="nextSlide()">&#10095;</button>
    </div>

 <script>
     let slideIndex = 0;

     function showSlide(index) {
         const slides = document.querySelector('.slides');
         const totalSlides = document.querySelectorAll('.slide').length;

         if (index >= totalSlides) {
             slideIndex = 0;
         } else if (index < 0) {
             slideIndex = totalSlides - 1;
         } else {
             slideIndex = index;
         }

         const translation = -100 * slideIndex + '%';
         slides.style.transform = `translateX(${translation})`;
     }

     function nextSlide() {
         showSlide(slideIndex + 1);
     }

     function prevSlide() {
         showSlide(slideIndex - 1);
     }

     // Automatic slide change (optional)
     setInterval(nextSlide, 5000);  // Change slide every 5 seconds
 </script>
        
        <%--new code ends--%>
    </form>

</body>
</html>
