<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CureApp</title>
	<!-- Stylesheets -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- JQuery-Confirm CSS -->
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>
	<!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl-carousel/owl.theme.default.min.css">
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="/fontawesome/css/all.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<br/><br/>
	<section id="slider">
		<div id="slider-content-box">
            <div id="slider-banners" class="owl-carousel owl-theme">
            	<div class="slider-banner">
            		<img src="img/carousel/banner-01.jpg" class="sliderimage" title="banner" alt="slider_banner_01" />
            	</div>
            	<div class="slider-banner">
            		<img src="img/carousel/banner-07.jpg" class="sliderimage" title="banner" alt="slider_banner_02" />
            	</div>
            	<div class="slider-banner">
            		<img src="img/carousel/banner-04.jpg" class="sliderimage" title="banner" alt="slider_banner_03" />
            	</div>
            	<div class="slider-banner">
            		<img src="img/carousel/banner-08.jpg" class="sliderimage" title="banner" alt="slider_banner_04" />
            	</div>
            	<div class="slider-banner">
            		<img src="img/carousel/banner-06.jpg" class="sliderimage" title="banner" alt="slider_banner_05" />
            	</div>
            	<div class="slider-banner">
            		<img src="img/carousel/banner-09.jpg" class="sliderimage" title="banner" alt="slider_banner_06" />
            	</div>
            </div>
        </div>
	</section>
	
	<jsp:include page="footer.jsp"/>
	
	<!-- Scripts -->
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
	<!-- Owl Carousel Js -->
    <script src="js/owl-carousel/owl.carousel.min.js"></script>
	<!-- Fontawesome JS -->
	<script src="fontawesome/js/all.js" ></script>
	<!-- Jquery-confirm JS -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>
	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<!-- Custom Jquery -->
	<script src='js/jqueryCode.js'></script>
	<!-- Custom JS -->
	<script src="js/script.js"></script>
</body>
</html>