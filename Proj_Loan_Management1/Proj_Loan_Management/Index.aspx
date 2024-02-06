<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Proj_Loan_Management.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="keywords" content=" ">
    <title>Welcome to our Company</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/fontello.css" rel="stylesheet">
   
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CMerriweather:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- owl Carousel Css -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .service-block {
            width: 300px; /* Set your desired width */
            height: 400px; /* Set your desired height */
            margin: 0 auto; /* Center the block horizontally */
            overflow: hidden; /* Ensure content doesn't overflow */
	
	
        }
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
        .btn-link-loan{
           margin-top:100px;
        }
    </style>
</head>

<body>
    <div class="collapse searchbar" id="searchbar">
        <div class="search-area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
            <button class="btn btn-default" type="button">Go!</button>
            </span> </div>
                        <!-- /input-group -->
                    </div>
                    <!-- /.col-lg-6 -->
                </div>
            </div>
        </div>
    </div>
    <div class="top-bar">
        <!-- top-bar -->
        <div class="container">
            <div class="row">
                
                <div class="col-xl-8 col-lg-7 col-md-12 col-sm-12 col-12 text-right">
                  
                </div>
            </div>
        </div>
    </div>
    <!-- /.top-bar -->
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-xl-2 col-lg-2 col-md-12 col-sm-6 col-6">
                    <!-- logo -->
                    
                </div>
            <!-- logo -->
   <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">

   </div>

                <div class="col-xl-l col-lg-1 col-md-1 col-sm-1 col-12 d-none d-xl-block d-lg-block">
                    <!-- search start-->
                   <%-- <div class="search-nav"> <a class="search-btn" role="button" data-toggle="collapse" href="#searchbar" aria-expanded="false"><i class="fa fa-search"></i></a> </div>--%>
                </div>
                <!-- /.search start-->
            </div>
        </div>
    </div>
    <div class="slider" id="slider">
        <!-- slider -->
        <div class="slider-img"><img src="images/slider-1.jpg" alt=" " class="auto-style1">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                        <div class="slider-captions">
                            <!-- slider-captions -->
                            <h1 class="slider-title">Personal Loan to Suit Your Needs </h1>
                            <p class="slider-text d-none d-xl-block d-lg-block d-sm-block">Secure the rates you need for the things you want!
                                <br>
                                <strong class="text-highlight">Contact us now.</strong></p>
                            <a href="team.html" class="btn btn-default" style="margin-top:50px;">Loan Products</a> </div>
                        <!-- /.slider-captions -->
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="slider-img"><img src="images/slider-2.jpg" alt=" " class="">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="slider-captions">
                                <!-- slider-captions -->
                                <h1 class="slider-title"> Lowest Car Loan Rate <strong class="text-highlight">9.60%</strong> </h1>
                                <p class="slider-text d-none d-xl-block d-lg-block d-sm-block"> We provide an excellent service Loan company. Lorem ipsum simple dummy content goes here.</p>
                                <a href="#" class="btn btn-default" style="margin-top:50px;">Check Eligiblity</a> </div>
                            <!-- /.slider-captions -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="slider-img"><img src="images/slider-3.jpg" alt=" " class="">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="slider-captions">
                                <!-- slider-captions -->
                                <h1 class="slider-title">Student Loan with Great Rates <strong class="text-highlight">11.10%</strong></h1>
                                <p class="slider-text d-none d-xl-block d-lg-block d-sm-block">We provide an excellent service for all types of loans in
                                    <br> ahmedabad and offer service, advice and direction.</p>
                                <a href="#" class="btn btn-default " style="margin-top:50px;">View Products</a> </div>
                            <!-- /.slider-captions -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="rate-table">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-6">
                    <div class="rate-counter-block">
                        <div class="icon rate-icon  "> <img src="images/mortgage.svg" alt=" " class="icon-svg-1x"></div>
                        <div class="rate-box">
                            <h1 class="loan-rate">3.74%</h1>
                            <small class="rate-title">Home Loans</small>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-6">
                    <div class="rate-counter-block">
                        <div class="icon rate-icon  "> <img src="images/loan.svg" alt=" " class="icon-svg-1x"></div>
                        <div class="rate-box">
                            <h1 class="loan-rate">8.96%</h1>
                            <small class="rate-title">Personal Loans</small>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-6">
                    <div class="rate-counter-block">
                        <div class="icon rate-icon  "> <img src="images/car.svg" alt=" " class="icon-svg-1x"></div>
                        <div class="rate-box">
                            <h1 class="loan-rate">6.70%</h1>
                            <small class="rate-title">Car Loans</small>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6 col-6">
                    <div class="rate-counter-block">
                        <div class="icon rate-icon  "> <img src="images/credit-card.svg" alt=" " class="icon-svg-1x"></div>
                        <div class="rate-box">
                            <h1 class="loan-rate">9.00%</h1>
                            <small class="rate-title">Credit card</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-space80">
        <div class="container">
            <div class="row">
                <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1>Find Loan Products We Offer</h1>
                        <p>We're dedicated to pairing you with a loan program that suits your financial needs, addressing short-term liquidity. Our aim is to make funds accessible <strong>within just 24 hours of your application.</strong></p>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="service" id="service">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="bg-white pinside40 service-block outline mb30">
                            <div class="icon mb40"> <img src="images/loan.svg" alt=" " class="icon-svg-2x"> </div>
                            <h2><a href="#" class="title">Personal Loan</a></h2>
                            <p>Empower your dreams with our hassle-free Personal Loans – the key to unlocking your path to financial freedom and turning aspirations into reality.</p>
                            <a href="#" class="btn-link" style="margin-top:100px;">Read More</a> </div>
                    </div>
                   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="bg-white pinside40 service-block outline mb30">
                            <div class="icon mb40"> <img src="images/mortgage.svg" alt=" " class="icon-svg-2x"></div>
                            <h2><a href="#" class="title">Home Loan</a></h2>
                            <p>Unlock the door to your dream home with our Home Loans, offering flexible financing solutions and competitive rates for a place to call your own.</p>
                            <a href="#" class="btn-link" style="margin-top:100px;">Read More</a> </div>
                    </div>
                   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="bg-white pinside40 service-block outline mb30">
                            <div class="icon mb40"> <img src="images/piggy-bank.svg" alt=" " class="icon-svg-2x"></div>
                            <h2><a href="#" class="title">Education Loan</a></h2>
                            <p>Empower your education journey with our tailored Education Loans, providing financial support and flexible terms for your academic aspirations.</p>
                            <a href="#" class="btn-link " style="margin-top:100px;">Read More</a> </div>
                    </div>
                   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="bg-white pinside40 service-block outline mb30">
                            <div class="icon mb40"> <img src="images/loan.svg" alt=" " class="icon-svg-2x"></div>
                            <h2><a href="#" class="title">Business Loan</a></h2>
                            <p>Fuel the growth of your enterprise with our Business Loans, tailored to provide financial solutions that empower your ambitions and drive success. </p>
                            <a href="#" class="btn-link" style="margin-top:100px;">Read More</a> </div>
                    </div>
                   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="bg-white pinside40 service-block outline mb30">
                            <div class="icon mb40"> <img src="images/car.svg" alt=" " class="icon-svg-2x"></div>
                            <h2><a href="#" class="title">Car Loan</a></h2>
                            <p>Drive your dreams into reality with our hassle-free Car Loans, offering competitive rates and flexible terms for the perfect journey ahead.</p>
                            <a href="#" class="btn-link" style="margin-top:100px;">Read More</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-white section-space80">
        <div class="container">
            <div class="row">
                 <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb100 text-center section-title">
                        <!-- section title start-->
                        <h1>Fast &amp; Easy Application Process.</h1>
                        <p>Elevate Your Journey with Our Speedy and Effortless Loan Application Process, Ensuring a Seamless Experience from Start to Approval.</p>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="bg-white pinside40 number-block outline mb60 bg-boxshadow">
                        <div class="circle"><span class="number">1</span></div>
                        <h3 class="number-title">Choose Loan Amount</h3>
                        <p>Empower your financial decisions by selecting the ideal loan amount tailored to meet your needs.</p>
                    </div>
                </div>
               <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="bg-white pinside40 number-block outline mb60 bg-boxshadow">
                        <div class="circle"><span class="number">2</span></div>
                        <h3 class="number-title">Confirmation of Loan</h3>
                        <p>Secure your financial path with the confirmation of loan approval, paving the way for your aspirations.</p>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="bg-white pinside40 number-block outline mb60 bg-boxshadow">
                        <div class="circle"><span class="number">3</span></div>
                        <h3 class="number-title">Get Your Cash</h3>
                        <p>Unlock your funds swiftly – it's time to get your cash and turn your financial goals into reality.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                 <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12 text-center"> <a href="Login.aspx" class="btn btn-default">View Our Loans</a> </div>
            </div>
        </div>
    </div>
    <div class="section-space80">
        <div class="container">
            <div class="row">
                <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1>Why People Choose Us</h1>
                        <p>We turn dreams into reality, making aspirations come to life with our dedicated support and reliable financial solutions.</p>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            
        </div>
    </div>
    <div class="bg-default section-space80">
        <div class="container">
            <div class="row">
                 <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1 class="title-white">Some of our Awesome Testimonials</h1>
                        <p> Explore the uplifting testimonials from those who have entrusted us with their financial journey, sharing their positive experiences and satisfaction.</p>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 clearfix ">
                    <div class="testimonial-block mb30">
                        <div class="bg-white pinside30 mb20">
                            <p class="testimonial-text"> “I loved the customer service you guys provided me. That was very nice and patient with questions I had. I would really like definitely come back here”</p>
                        </div>
                        <div class="testimonial-autor-box">
                            <div class="testimonial-img pull-left"> <img src="images/testimonial-img.jpg" alt=" "> </div>
                            <div class="testimonial-autor pull-left">
                                <h4 class="testimonial-name">Donny J. Griffin</h4>
                                <span class="testimonial-meta">Personal Loan</span> </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 clearfix ">
                    <div class="testimonial-block mb30">
                        <div class="bg-white pinside30 mb20">
                            <p class="testimonial-text"> “I had a good experience with Insight Loan Services. I am thankful to insight for the help you guys gave me. My loan was easy and fast. thank you Insigtht”</p>
                        </div>
                        <div class="testimonial-autor-box">
                            <div class="testimonial-img pull-left"> <img src="images/testimonial-img-1.jpg" alt=" "> </div>
                            <div class="testimonial-autor pull-left">
                                <h4 class="testimonial-name">Mary O. Randle</h4>
                                <span class="testimonial-meta">Education Loan</span> </div>
                        </div>
                    </div>
                </div>
               <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 clearfix ">
                    <div class="testimonial-block mb30">
                        <div class="bg-white pinside30 mb20">
                            <p class="testimonial-text"> “We came out of their offices very happy with their service. They treated us very kind. Definite will come back. The waiting time was very appropriate.”</p>
                        </div>
                        <div class="testimonial-autor-box">
                            <div class="testimonial-img pull-left"> <img src="images/testimonial-img-2.jpg" alt=" "> </div>
                            <div class="testimonial-autor pull-left">
                                <h4 class="testimonial-name">Lindo E. Olson</h4>
                                <span class="testimonial-meta">Car Loan</span> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-space40 bg-white">
        <div class="container">
            <!-- <div class="row">
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-1.jpg" alt=" "> </div>
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-2.jpg" alt=" "> </div>
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-3.jpg" alt=" "> </div>
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-4.jpg" alt=" "> </div>
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-5.jpg" alt=" "> </div>
                <div class="col-xl-2 col-lg-2 col-md-2 col-sm-4 col-6"> <img src="images/logo-1.jpg" alt=" "> </div>
            </div>-->
        </div>
    </div>
    <div class="section-space80">
        <div class="container">
            <div class="row">
                 <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title start-->
                        <h1>Latest News from Loan Company</h1>
                        <p> Our mission is to deliver reliable, latest news and opinions.</p>
                    </div>
                    <!-- /.section title start-->
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="post-block mb30">
                        <div class="post-img">
                            <a href="blog-single.html" class="imghover"><img src="images/blog-img.jpg" alt=" " class="img-fluid"></a>
                        </div>
                        <div class="bg-white pinside40 outline">
                            <h2><a href="blog-single.html" class="title">Couples Secure a Home with a Loan.</a></h2>
                            <p class="meta"><span class="meta-date">Aug 25, 2023</span><span class="meta-author">By<a href="#"> Admin</a></span></p>
                            <p>This line encapsulates the journey of couples achieving homeownership through the assistance of a loan.</p>
                            <a href="blog-single.html" class="btn-link">Read More</a> </div>
                    </div>
                </div>
                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="post-block mb30">
                        <div class="post-img">
                            <a href="blog-single.html" class="imghover"><img src="images/blog-img-1.jpg" alt=" " class="img-fluid"></a>
                        </div>
                        <div class="bg-white pinside40 outline">
                            <h2><a href="blog-single.html" class="title">Business Man Thinking for Loan</a></h2>
                            <p class="meta"><span class="meta-date">Aug 24, 2023</span><span class="meta-author">By<a href="#"> Admin</a></span></p>
                            <p>A visionary business leader meticulously considering diverse loan strategies to elevate the growth trajectory of their enterprise </p>
                            <a href="blog-single.html" class="btn-link">Read More</a> </div>
                    </div>
                </div>
                 <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="post-block mb30">
                        <div class="post-img">
                            <a href="blog-single.html" class="imghover"><img src="images/blog-img-2.jpg" alt=" " class="img-fluid"></a>
                        </div>
                        <div class="bg-white pinside40 outline">
                            <h2><a href="blog-single.html" class="title">Are you students looking for loan ?</a></h2>
                            <p class="meta"><span class="meta-date">Aug 23, 2023</span><span class="meta-author">By<a href="#"> Admin</a></span></p>
                            <p>Are you a student in search of financial assistance? Explore our tailored loan options to support your educational journey.</p>
                            <a href="blog-single.html" class="btn-link">Read More</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-space80 bg-white">
        <div class="container">
            <div class="row">
               <div class="offset-xl-2 col-xl-8 offset-md-2 col-md-8 offset-md-2 col-md-8 col-sm-12 col-12">
                    <div class="mb60 text-center section-title">
                        <!-- section title-->
                        <h1>We are Here to Help You</h1>
                        <p>Our mission is to deliver reliable, latest news and opinions.</p>
                    </div>
                    <!-- /.section title-->
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="bg-white bg-boxshadow pinside40 outline text-center mb30">
                        <div class="mb40"><i class="icon-calendar-3 icon-2x icon-default"></i></div>
                        <h2 class="capital-title">Apply For Loan</h2>
                        <p>Looking to buy a car or home loan? then apply for loan now.</p>
                        <a href="#" class="btn-link" style="margin-top: 23px">Get Appointment</a> </div>
                </div>
                 <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="bg-white bg-boxshadow pinside40 outline text-center mb30">
                        <div class="mb40"><i class="icon-phone-call icon-2x icon-default"></i></div>
                        <h2 class="capital-title">Call us at </h2>
                        <h1 class="text-big"></h1>
                        <p>lnfo@loanadvisor.com</p>
                        <a href="#" class="btn-link" style="margin-top: 45px">Contact us</a> </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
                    <div class="bg-white bg-boxshadow pinside40 outline text-center mb30">
                        <div class="mb40"> <i class="icon-users icon-2x icon-default"></i></div>
                        <h2 class="capital-title">Talk to Advisor</h2>
                        <p>Need to loan advise? Talk to our Loan advisors.</p>
                        <a href="#" class="btn-link" style="margin-top: 20px">Meet The Advisor</a> </div>
                </div>
            </div>
        </div>
    </div>
     <div class="footer section-space100">
        <!-- footer -->
        <div class="container">
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
                    <div class="footer-logo">
                        <!-- Footer Logo -->
                        <img src="" alt=" "> </div>
                    <!-- /.Footer Logo -->
                </div>
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12 col-12">
                    <div class="row">
                    <div class="col-xl-5 col-lg-5 col-md-5 col-sm-12 col-12">
                        <h3 class="newsletter-title">Signup Our Newsletter</h3>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-7 col-sm-12 col-12">
                        <div class="newsletter-form">
                            <!-- Newsletter Form -->
                            <form action="https://jituchauhan.com/borrow/bootstrap-4/newsletter.php" method="post">
                                <div class="input-group">
                                    <input type="email" class="form-control" id="newsletter" name="newsletter" placeholder="Write E-Mail Address" required>
                                    <span class="input-group-btn">
                <button class="btn btn-default" type="submit">Go!</button>
                </span> </div>
                                <!-- /input-group -->
                            </form>
                        </div>
                        <!-- /.Newsletter Form -->
                    </div>
                </div>
                    <!-- /.col-lg-6 -->
                </div>
            </div>
            <hr class="dark-line">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="widget-text mt40">
                        <!-- widget text -->
                        <p>Our goal at Borrow Loan Company is to provide access to personal loans and education loan, car loan, home loan at insight competitive interest rates lorem ipsums. We are the loan provider, you can use our loan product.</p>
                        <div class="row">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <p class="address-text"><span><i class="icon-placeholder-3 icon-1x"></i> </span>3895 Saddar Karachi </p>
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                <p class="call-text"><span><i class="icon-phone-call icon-1x"></i></span>800-123-456</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.widget text -->
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6 col-6">
                    <div class="widget-footer mt40">
                        <!-- widget footer -->
                        <ul class="listnone">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <!-- /.widget footer -->
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6 col-6">
                    <div class="widget-footer mt40">
                        <!-- widget footer -->
                        <ul class="listnone">
                            <li><a href="#">Car Loan</a></li>
                            <li><a href="#">Personal Loan</a></li>
                            <li><a href="#">Education Loan</a></li>
                            <li><a href="#">Business Loan</a></li>
                            <li><a href="#">Home Loan</a></li>
                            <li><a href="#">Debt Consolidation</a></li>
                        </ul>
                    </div>
                    <!-- /.widget footer -->
                </div>
                <div class="col-xl-2 col-lg-2 col-md-4 col-sm-6 col-6">
                    <div class="widget-social mt40">
                        <!-- widget footer -->
                        <ul class="listnone">
                            <li><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i>Google Plus</a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i>Linked In</a></li>
                        </ul>
                    </div>
                    <!-- /.widget footer -->
                </div>
            </div>
        </div>
    </div>
    <!-- /.footer -->
    <div class="tiny-footer">
        <!-- tiny footer -->
        <div class="container">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">

                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 text-right">
                    <p>Terms of use | Privacy Policy</p>

                </div>
            </div>
        </div>
    </div>
    <!-- back to top icon -->
    <a href="#0" class="cd-top" title="Go to top">Top</a>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/menumaker.js"></script>
  
    <!-- sticky header -->
    <script type="text/javascript" src="js/jquery.sticky.js"></script>
    <script type="text/javascript" src="js/sticky-header.js"></script>
    <!-- slider script -->
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="js/slider-carousel.js"></script>
    <script type="text/javascript" src="js/service-carousel.js"></script>
    <!-- Back to top script -->
    <script src="js/back-to-top.js" type="text/javascript"></script>
</body>


</html>
