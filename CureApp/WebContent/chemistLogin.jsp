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
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="card">
					  <div class="card-body">
		<center>
			<h1>LOGIN</h1>
			<img src="img/chemist.png" height="125px" width="125px">
		</center>
		<hr/>
	<form method="post" action="chemlogin" name="myForm" data-ng-controller="FormController" class="my-form" novalidate>
	<div class="container-fluid">
			<div class="form-group row">
			<div class="col-sm-11">
				<!-- <span class="label label-danger" data-ng-show="myForm.input.$error.required">*</span> -->
					<label for="input" class="col-form-label col-form-label-sm">User Type </label>
				<input name="input" data-ng-model="userType" class="form-control form-control-sm" required data-ng-disabled="{{ !!1 }}">
			</div>
			<div class="col-sm-1 icon-small">
				<div ng-if="myForm.input.$invalid && myForm.input.$touched" class="text-danger">
                     <i class="fas fa-clinic-medical" aria-hidden="true"></i>
                </div>
                <div ng-if="!(myForm.input.$invalid && myForm.input.$touched)" class="text-success">
                     <i class="fas fa-clinic-medical" aria-hidden="true"></i>
                </div>
			</div>
			</div>
			<div class="form-group row">
			<div class="col-sm-11">
      			<label for="username" class="col-form-label col-form-label-sm">Username </label>
      			<input type="text" name="username" placeholder="Enter your username" data-ng-model="username" class="form-control form-control-sm" required
      			ng-class="{ 'is-invalid':myForm.username.$invalid && myForm.username.$touched }"/>
      			<small class="text-danger" ng-class="{ 'd-none':myForm.username.$valid || myForm.username.$untouched }">Username is required.</small>
      		</div>
      		<div class="col-sm-1 icon-small">
				<div ng-if="myForm.username.$invalid && myForm.username.$touched" class="text-danger">
                     <i class="fas fa-id-badge" aria-hidden="true"></i>
                </div>
                <div ng-if="!(myForm.username.$invalid && myForm.username.$touched)" class="text-success">
                     <i class="fas fa-id-badge" aria-hidden="true"></i>
                </div>
			</div>
			</div>
			<div class="form-group row">
			<div class="col-sm-11">
				<label for="password" class="col-form-label col-form-label-sm">Password </label>
				<input type="password" name="password" placeholder="Enter your password" data-ng-model="password" class="form-control form-control-sm" required
				ng-class="{ 'is-invalid':myForm.password.$error.required && myForm.password.$dirty }" 
				ng-minlength="6" ng-maxlength="20" ng-pattern="/(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/"/>
				<small class="text-danger" ng-show="myForm.password.$error.required && myForm.password.$dirty">
					Password is required.
				</small>
				<small class="text-danger help-block"
				 ng-show="!myForm.password.$error.required && (myForm.password.$error.minlength || myForm.password.$error.maxlength) && myForm.password.$dirty">
						Password must be of length between 6 to 20 characters.
				</small>
				<small class="text-danger help-block" 
				ng-show="!myForm.password.$error.required && !myForm.password.$error.minlength && !myForm.password.$error.maxlength && myForm.password.$error.pattern && myForm.password.$dirty">
						Password must contain one lower &amp; uppercase letter, and one non-alpha character (a number or a symbol.)
				</small>
			</div>
			<div class="col-sm-1 icon-small">
				<div ng-if="myForm.password.$error.required && myForm.password.$dirty" class="text-danger">
                     <i class="fas fa-fingerprint" aria-hidden="true"></i>
                </div>
                <div ng-if="!(myForm.password.$error.required && myForm.password.$dirty)" class="text-success">
                     <i class="fas fa-fingerprint" aria-hidden="true"></i>
                </div>
			</div>
			</div>
			<div class="form-row">
				<div class="col-12">
				<input type="submit" value="Login" class="btn btn-sm btn-block btn-primary" ng-disabled="myForm.$invalid">
				<button type="button" data-ng-click="reset()" class="btn btn-sm btn-block btn-secondary">Reset</button>
				</div>
			</div>
	</div>
	</form>
	<br>
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