<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CureApp</title>

	<!-- Stylesheets -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
	<!-- Datatables CSS  -->
	<link rel="stylesheet" href=https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css>
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
    <!-- Icon Link -->
	<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
	 	  
	  <jsp:include page="header.jsp"/> 
	  <br>
	  <br>
	  <br><br><br>
<div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                     <img width="125px" height="125px" src="img/adminIcon.png">
                                 </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                     <h3>Patient SignUp</h3>
                                 </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
		<form action="signupAsPatient" method="post">
		<div class=row>
		<div class=col>
			<label for="FullName">Full Name:</label>
			<div class="form-group">
				<input type="text" class="form-control form-control-sm" id="FullName" name="FullName" placeholder="Enter your full name" required>
			</div>
		
		
			<label for="userID">UserID:</label>
			<div class="form-group">
				<input type="text" class="form-control form-control-sm" id="userID" name="userID" placeholder="Enter the username" required>
			</div>
			
			
			<label for="passwrd">Password:</label>
			<div class="form-group">
				<input type="password" class="form-control form-control-sm" id="passwrd" name="passwrd" placeholder="Enter the password" required>
			</div>
			
			<label for="dob">Date Of Birth:</label>
			<div class="form-group">
				<input type="date" class="form-control form-control-sm" id="dob" name="dob" required>
			</div>
			
			<div class="row">
				<div class="col-4">
					<label for="locality">Locality:</label>
					<div class="form-group">
						<textarea class="form-control form-control-sm" name="locality" rows="1"></textarea>
					</div>
				</div>
				
				<div class="col-4">
					<label for=city>City:</label>
					<div class=form-group>
						<input type="text" class="form-control form-control-sm" name="city" id="city" placeholder="city" required>
					</div>
				</div>
				
				<div class="col-4">
					<label for=city>State:</label>
					<div class=form-group>
						<input type="text" class="form-control form-control-sm" name="state" id="state" placeholder="state" required>
					</div>
				</div>
			</div>	
			
			<label for="phonenumber">Phone Number:</label>
			<div class="form-group">
				<input type="text" class="form-control form-control-sm" id="phonenumber" name="phonenumber" placeholder="Enter the phone number" required>
			</div>

			<div class=row>
			<div class=col-md-6>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-block">Register</button>
				</div>
			</div>
			<div class=col-md-6>
				<div class="form-group">
					<button type="reset" class="btn btn-danger btn-block">Cancel</button>
				</div>
			</div>
			</div>
			
		</div>
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<br>
	<jsp:include page="footer.jsp"/> 
	<!-- Scripts -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
	<!-- Fontawesome JS -->
	<script src="fontawesome/js/all.js" ></script>
	<!-- Jquery-confirm JS -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>
	<!-- Datatables JS -->
	<script src="http://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
	<!-- Select Datatables JS -->
	<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<!-- Custom Jquery -->
	<script src='js/jqueryCode.js'></script>
	<!-- Custom JS -->
	<script src="js/script.js"></script>
</body>
</html>