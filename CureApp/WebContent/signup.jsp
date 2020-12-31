<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myModule">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CureApp</title>
	<!-- Stylesheets -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<!-- JQuery-Confirm CSS -->
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="/fontawesome/css/all.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<br/><br/><br/>
	<div class="container">
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<div class="card">
  			<div class="card-body">
  				
	<center>
		<h2>SIGNUP</h2>
		<img src="img/newuser.png" width="125" height="125">
		<hr/>
	</center>
	<div class="container-fluid">
	<form method="get" action="signup" name="signupForm" novalidate>
	<div class="form-group row">
	<div class="col-sm-11">
		<label for="usertype"> User Type :  </label>
					<select name="usertype" ng-model="usertype" class="custom-select custom-select-sm"
					required ng-class="{ 'is-invalid' : signupForm.usertype.$invalid && signupForm.usertype.$touched }">
						<option value="" selected> --SELECT-- </option> 
						<option value="Patient"> Patient </option>
						<option value="Doctor"> Doctor </option>
					</select>
		<small id="userHelp" class="text-danger" ng-show="signupForm.usertype.$invalid && signupForm.usertype.$touched">User Type is required.</small>
	</div>
	<div class="col-sm-1 icon-small">
						<div ng-if="signupForm.usertype.$invalid && signupForm.usertype.$touched" class="text-danger">
                              <i class="fas fa-cogs" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(signupForm.usertype.$invalid && signupForm.usertype.$touched)" class="text-info">
                              <i class="fas fa-cogs" aria-hidden="true"></i>
                        </div>
					</div>
	</div>
	<div class="form-group row">
	<div class="col-12">
				<input type="submit" value="Proceed" class="btn btn-sm btn-block btn-success" ng-disabled="signupForm.$invalid">
	</div>
	</div>
	</form>
	</div>
	</div>
		</div>
		</div>
		</div>
	</div>
	<br/>
	<jsp:include page="footer.jsp"/>
	
	<!-- Scripts -->
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
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