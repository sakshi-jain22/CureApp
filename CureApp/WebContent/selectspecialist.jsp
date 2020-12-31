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
		<div class="col-2"></div>
		<div class="col-8">
		<div class="card">
  			<div class="card-body">
  				
	<center>
	<h2>Select Specialist</h2>
	<img src="img/stethoscope.png" width="125" height="125">
	<hr/>
	</center>
	<div class="container-fluid">
	<form action="selectdoctor.jsp" method="get" name="myForm" data-ng-controller="specialistList" class="my-form" novalidate>
	<div class="form-group row">
	<div class="col-sm-11">
		<label for="specialist">Specialization </label>
		<select id="specialist" name="specialist" class="custom-select custom-select-sm" required data-ng-model="specialist"
		ng-class="{ 'is-invalid' : myForm.specialist.$invalid && myForm.specialist.$touched }">
			<option value="" selected>Select Specialist...</option>
			<option ng-repeat="spec in specialization" value="{{spec}}">{{spec}} </option>
		</select>
		<small class="text-danger" ng-show="myForm.specialist.$invalid && myForm.specialist.$touched">Please choose a valid specialist.</small>
		</div>
		<div class="col-sm-1 icon-small">
						<div ng-if="myForm.specialist.$invalid && myForm.specialist.$touched" class="text-danger">
                              <i class="fas fa-laptop-medical" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(myForm.specialist.$invalid && myForm.specialist.$touched)" class="text-css">
                              <i class="fas fa-laptop-medical" aria-hidden="true"></i>
                        </div>
					</div>
		</div>
		<div class="row">
		<div class="col-12">
		<button type="submit" class="btn btn-sm btn-block btn-info" ng-disabled="myForm.$invalid">Proceed</button>
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