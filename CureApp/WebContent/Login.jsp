<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="fontawesome/css/all.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body ng-app="myModule">
	<jsp:include page="header.jsp"/>
	<br/><br/><br/>
	<div class="container" ng-controller="myController">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<div class="card">
  			<div class="card-body">
  				<center>
  					<h1>LOGIN</h1>
  					<img src="img/login.png" height="125px" width="125px">
  				</center>
  				<hr/>
  				<div class="container-fluid">
				<form method="post" action="processlogin" name="LoginForm" novalidate>
				<div class="form-group row">
				<div class="col-sm-11">
					<lable for="user" class="col-form-label"> User Type </lable>
					<select class="custom-select custom-select-sm" id="user" name="user" ng-model="user" 
					  required ng-class="{ 'is-invalid' : LoginForm.user.$invalid && LoginForm.user.$touched }">
						<option value="" selected>SELECT USER TYPE</option>
						<option ng-repeat="users in usertypeArr" value="{{ users }}"> {{ users }} </option>
					</select>
					<small id="userHelp" class="text-danger" ng-show="LoginForm.user.$invalid && LoginForm.user.$touched">User Type is required.</small>
					</div>
					<div class="col-sm-1 icon-small">
						<div ng-if="LoginForm.user.$invalid && LoginForm.user.$touched" class="text-danger">
                              <i class="fas fa-user-cog" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(LoginForm.user.$invalid && LoginForm.user.$touched)" class="text-success">
                              <i class="fas fa-user-cog" aria-hidden="true"></i>
                        </div>
					</div>
				</div>
				<div class="form-group row">
				<div class="col-sm-11">
					<label for="username" class="col-form-label"> Username </label>
					<input type="text" class="form-control  form-control-sm" id="username" name="username" ng-model="username" placeholder="Enter your username"
					 required ng-class="{ 'is-invalid' : LoginForm.username.$invalid && LoginForm.username.$touched }">
					<small id="usernameHelp" class="text-danger help-block" ng-show="LoginForm.username.$invalid && LoginForm.username.$touched">Username is required.</small>
				</div>
					<div class="col-sm-1 icon-small">
						<div ng-if="LoginForm.username.$invalid && LoginForm.username.$touched" class="text-danger">
                              <i class="fas fa-user-slash" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(LoginForm.username.$invalid && LoginForm.username.$touched)" class="text-success">
                              <i class="fas fa-user-shield" aria-hidden="true"></i>
                        </div>
					</div>
				</div>
				<div class="form-group row">
				<div class="col-sm-11">
				<label for="password" class="col-form-label"> Password </label>
					<input type="password" class="form-control form-control-sm" id="password" ng-model="password" name="password" placeholder="Enter your password" required 
					ng-minlength="6" ng-maxlength="20" ng-pattern="/(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/"
					ng-class="{ 'is-invalid' : LoginForm.password.$error.required && LoginForm.password.$dirty }"/>
						<small class="text-danger help-block" 
						ng-show="LoginForm.password.$error.required && LoginForm.password.$dirty">Password is required.</small>
						<small class="text-danger help-block"
						 ng-show="!LoginForm.password.$error.required && (LoginForm.password.$error.minlength || LoginForm.password.$error.maxlength) && LoginForm.password.$dirty">
							Password must be of length between 6 to 20 characters.
						</small>
						<small class="text-danger help-block" ng-show="!LoginForm.password.$error.required && !LoginForm.password.$error.minlength && !LoginForm.password.$error.maxlength && LoginForm.password.$error.pattern && LoginForm.password.$dirty">
							Password must contain one lower &amp; uppercase letter, and one non-alpha character (a number or a symbol.)
						</small>
					</div>
					<div class="col-sm-1 icon-small">
						<div ng-if="LoginForm.password.$error.required && LoginForm.password.$dirty" class="text-danger">
                                <i class="fas fa-key 3x" aria-hidden="true"></i>
                            </div>
                            <div ng-if="!(LoginForm.password.$error.required && LoginForm.password.$dirty)" class="text-success">
                                <i class="fas fa-key 3x" aria-hidden="true"></i>
                            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<input type="submit" ng-disabled="LoginForm.$invalid" class="btn btn-sm btn-success btn-block" value="Login">
					</div>
					<div class="col-sm-6">
						<input type="reset" class="btn btn-sm btn-danger btn-block">
					</div>
				</div>
				
	</form>
	<br>
				</div>
				<center>
				<span class="badge badge-light">
				New User? <a href="signup.jsp" class="badge badge-pill badge-info"><b>Signup</b></a> here
				</span>
				</center>
				</div>
			</div>
		</div>
	</div>
	</div>
	<br>
	<jsp:include page="footer.jsp" />
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