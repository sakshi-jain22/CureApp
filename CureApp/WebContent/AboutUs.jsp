<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<link rel="stylesheet" href="fontawesome/css/all.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:include page="header.jsp" />
	<br><br><br>
		<div class="wrapper">
			<div class="aboutus-carousel section owl-carousel owl-theme">
			
			<div class="single-developer">
					<div class="img-area">
						<img class="img-img" src="img/carousel/atsj.jpeg" alt="A Team">
					</div> <!-- img-area -->
					
					<div class="img-text">
						<h2 class="name"><b>The Team</b></h2>
						<small>
						<b>printf("Hello World"); <br></b>
						<b>THIS IS US.</b>
						</small>
						<hr>
						<p>MCA students at BVICAM. <br>
						   (2018-2021) <br>
						<small>We are the coders ;)</small>
						</p>
					</div>
				</div> <!--single developer  -->
				
				<div class="single-developer">
					<div class="img-area">
						<img class="img-img" src="img/carousel/sj2.jpeg" alt="Sakshi Jain">
					</div> <!-- img-area -->
					
					<div class="img-text">
						<h2 class="name"><b>Sakshi Jain</b></h2>
						<h2>24</h2>
						<hr>
						<p>Employee at <b>VectoScaler Technologies</b><br>
						<b>Interest: </b>Java, AngularJS <br>
						<b>Contact: </b> 9968298212 <br>
						</p>
					</div>
				</div> <!--single developer  -->
				
				<div class="single-developer">
					<div class="img-area">
						<img class="img-img" src="img/carousel/atyagi.jpeg" alt="Akanksha Tyagi">
					</div> <!-- img-area -->
					
					<div class="img-text">
						<h2 class="name"><b>Akanksha Tyagi</b></h2>
						<h2>24</h2>
						<hr>
						<p>Employee at <b>To The New</b> <br>
							<b>Interest:</b>Java<br>
							<b>Contact:</b> 9999166247 <br>
						</p>
					</div>
				</div> <!--single developer  -->
				
				
			</div><!--aboutus-carousel  -->
		</div> <!--wrapper -->
		
		
	<br><br>
	<jsp:include page="footer.jsp" />
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