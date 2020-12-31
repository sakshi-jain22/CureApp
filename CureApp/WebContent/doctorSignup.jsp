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
<body ng-controller="docSignup">
<jsp:include page="header.jsp"/>
<br/><br/><br/>
	
	<div class="container">
		<div class="card">
  			<div class="card-body">
  				
	<center>
		<h2>Doctor Signup</h2>
		<img src="img/addDoc.png" width="125" height="125">
		<hr/>
	</center>
	
	<div class="container-fluid">
	<form method="post" action="register_doctor" name="docForm" novalidate>
		<div class="form-group row">
			<div class="col-sm-5">
		<label for="docID">Username : </label>
		<input type="text" class="form-control form-control-sm" ng-model="docID" name="docID" placeholder="Create a username" required 
		ng-class="{'is-invalid': docForm.docID.$invalid && docForm.docID.$touched }" />
		<small class="text-danger" ng-show="docForm.docID.$error.required && docForm.docID.$dirty">Username is required.</small>
			</div>
			<div class="form-group col-sm-1 icon">
				<div ng-if="docForm.docID.$invalid && docForm.docID.$touched" class="text-danger">
                              <i class="fas fa-user-nurse" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.docID.$invalid && docForm.docID.$touched)" class="text-css">
                              <i class="fas fa-user-nurse" aria-hidden="true"></i>
			</div>
			</div>
				<div class="col-sm-5">
			<label for="name">Name :</label> 
			<input type="text" class="form-control form-control-sm" ng-model="name" name="name" placeholder="Enter the name" required
			ng-class="{'is-invalid': docForm.name.$invalid && docForm.name.$touched}" />
			<small class="text-danger" ng-show="docForm.name.$error.required && docForm.name.$dirty">Name is required.</small>
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="docForm.name.$invalid && docForm.name.$touched" class="text-danger">
                              <i class="fas fa-pen-fancy" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.name.$invalid && docForm.name.$touched)" class="text-css">
                              <i class="fas fa-pen-fancy" aria-hidden="true"></i>
			</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-5">
			<label for="pswd">Password : </label> 
			<input type="password" class="form-control form-control-sm" ng-model="pswd" name="pswd" placeholder="Enter the password" required 
			ng-init="pswd_error_show = 0" ng-focus="pswd_error_show = 1" ng-change="pswd_error_show = pswd_error_show + 1;changepassword()" 
			ng-class="{'is-invalid': docForm.pswd.$error.required && docForm.pswd.$dirty}" />
						<small class="text-danger help-block" 
						ng-show="docForm.pswd.$error.required && docForm.pswd.$dirty">Password is required.</small>
						<small class="text-danger help-block"
						 ng-show="!passValidation && pswd_error_show > 0 && !docForm.pswd.$error.required && docForm.pswd.$dirty">
							Password must be alphanumeric, one lower &amp; uppercase letter, and one non-alpha character (a number or a symbol) of length 6 to 20 characters.
						</small>
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="docForm.pswd.$error.required && docForm.pswd.$dirty" class="text-danger">
                        <i class="fas fa-lock" aria-hidden="true"></i>
                </div>
                <div ng-if="!(docForm.pswd.$error.required && docForm.pswd.$dirty)" class="text-css">
                       <i class="fas fa-lock" aria-hidden="true"></i>
				</div>
			</div>
			
			<div class="col-sm-5">
			<label for="cpswd">Confirm Password : </label> 
			<input type="password" class="form-control form-control-sm" ng-class="{ 'is-valid': cpswd_error_show > 0 && pswd === cpswd && passValidation }" 
			ng-model="cpswd" name="cpswd" placeholder="Re-enter the password" ng-init="cpswd_error_show = 0" ng-focus="cpswd_error_show = 1" 
			ng-change="cpswd_error_show = cpswd_error_show + 1;changepassword()" required/>
			<small class="text-danger help-block" ng-show="docForm.cpswd.$error.required && docForm.cpswd.$dirty">
				Please confirm your password.
			</small>
			<small class="text-danger help-block" ng-show="cpswd_error_show > 0 && pswd !== cpswd && docForm.cpswd.$error.required">
				Passwords do not match.
			</small>
			<small class="text-success help-block" ng-show="cpswd_error_show > 0 && pswd === cpswd && passValidation"> 
                Password matched.
            </small> 
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="!(cpswd_error_show > 0 && pswd === cpswd && passValidation)" class="text-danger">
                        <i class="fas fa-lock-open" aria-hidden="true"></i>
                </div>
                <div ng-if="cpswd_error_show > 0 && pswd === cpswd && passValidation" class="text-css">
                       <i class="fas fa-lock" aria-hidden="true"></i>
				</div>
			</div>
			</div>
		
		<div class="form-group row">
			<div class="col-sm-11">
			<label for="specialization">Specialization : </label>
				<select name="specialization" class="custom-select custom-select-sm" ng-model="specialization" required>
						<option value="" selected>--SELECT--</option>
						<option ng-repeat="spec in Doctor.specialization" value="{{spec}}">{{spec}}</option>
					</select>
					<small class="text-danger" ng-class="{'d-none':docForm.specialization.$valid || docForm.specialization.$untouched}">Please choose a specialization.</small>
				</div>
				<div class="col-sm-1 icon">
				<div ng-if="docForm.specialization.$invalid && docForm.specialization.$touched" class="text-danger">
                        <i class="fas fa-award" aria-hidden="true"></i>
                </div>
                <div ng-if="!(docForm.specialization.$invalid && docForm.specialization.$touched)" class="text-css">
                       <i class="fas fa-award" aria-hidden="true"></i>
				</div>
				</div>
			</div>	
				
				<div class="row">
				<div class="col-sm-11">
				<label for="qualifications">Qualifications : </label>
				<div class="form-group">
				<div class="form-check form-check-inline" ng-repeat="qual in Doctor.qualifications">
					 <input class="form-check-input" type="radio" name="qualifications" ng-model="qualifications"  value="{{qual}}"> 
					 <label class="form-check-label" for="{{qual}}">{{qual}} </label>
				</div>
				</div>
				<small class="text-warning">Select the highest qualification.</small>
				</div>
				<div class="col-sm-1 icon">
					<div ng-if="docForm.qualifications.$error.required" class="text-danger">
                              <i class="fas fa-graduation-cap" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!docForm.qualifications.$error.required" class="text-css">
                              <i class="fas fa-graduation-cap" aria-hidden="true"></i>
			</div>
				</div>
				</div>
				<div class="row">
				<div class="col-sm-11">
				<label for="contact">Contact No. : </label>
				<input type="text" class="form-control form-control-sm" name="contact" placeholder="Enter your contact number" required ng-model="contact"
				ng-class="{'is-invalid':docForm.contact.$invalid && docForm.contact.$touched}" />
				<small class="text-danger" ng-show="docForm.contact.$error.required && docForm.contact.$dirty">Contact No is required.</small> 
				</div>
				<div class="form-group col-sm-1 icon">
				<div ng-if="docForm.contact.$invalid && docForm.contact.$touched" class="text-danger">
                              <i class="fab fa-whatsapp" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.contact.$invalid && docForm.contact.$touched)" class="text-css">
                              <i class="fab fa-whatsapp" aria-hidden="true"></i>
				</div>
				</div>
				</div>
				<div class="form-group row">
			<div class="col-sm-5">
		<label for="hname">Hospital Name : </label>
		<input type="text" class="form-control form-control-sm" ng-model="hname" name="hname" placeholder="Enter your hospital or clinic name" required
		ng-class="{'is-invalid':docForm.hname.$invalid && docForm.hname.$touched}" />
		<small class="text-danger" ng-show="docForm.hname.$error.required && docForm.hname.$dirty">Hospital Name is required.</small>
			</div>
			<div class="form-group col-sm-1 icon">
				<div ng-if="docForm.hname.$invalid && docForm.hname.$touched" class="text-danger">
                              <i class="far fa-hospital" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.hname.$invalid && docForm.hname.$touched)" class="text-css">
                              <i class="far fa-hospital" aria-hidden="true"></i>
			</div>
			</div>
				<div class="col-sm-5">
			<label for="hloc">Locality :</label> 
			<textarea class="form-control form-control-sm" ng-model="hloc" name="hloc" placeholder="Enter the hospital locality" rows="1" required
			ng-class="{'is-invalid':docForm.hloc.$invalid && docForm.hloc.$touched}"></textarea>
			<small class="text-danger" ng-show="docForm.hloc.$error.required && docForm.hloc.$dirty">Locality is required.</small>
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="docForm.hloc.$invalid && docForm.hloc.$touched" class="text-danger">
                              <i class="fas fa-door-open" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.hloc.$invalid && docForm.hloc.$touched)" class="text-css">
                              <i class="fas fa-door-open" aria-hidden="true"></i>
			</div>
			</div>
		</div>
				
				<div class="form-group row">
			<div class="col-sm-5">
		<label for="hcity">City : </label>
		<input type="text" class="form-control form-control-sm" ng-model="hcity" name="hcity" placeholder="Enter the city" required
		ng-class="{'is-invalid':docForm.hcity.$invalid && docForm.hcity.$touched}" />
		<small class="text-danger help-block" ng-show="docForm.hcity.$error.required && docForm.hcity.$dirty">City is required.</small>
			</div>
			<div class="form-group col-sm-1 icon">
				<div ng-if="docForm.hcity.$invalid && docForm.hcity.$touched" class="text-danger">
                              <i class="fas fa-city" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.hcity.$invalid && docForm.hcity.$touched)" class="text-css">
                              <i class="fas fa-city" aria-hidden="true"></i>
			</div>
			</div>
				<div class="col-sm-5">
			<label for="hstate">State :</label> 
			<input type="text" class="form-control form-control-sm" ng-model="hstate" name="hstate" placeholder="Enter the state" required
			ng-class="{'is-invalid':docForm.hstate.$invalid && docForm.hstate.$touched}" />
			<small class="text-danger help-block" ng-show="docForm.hstate.$error.required && docForm.hstate.$dirty">State is required.</small>
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="docForm.hstate.$invalid && docForm.hstate.$touched" class="text-danger">
                              <i class="fas fa-map-marked-alt" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.hstate.$invalid && docForm.hstate.$touched)" class="text-css">
                              <i class="fas fa-map-marked-alt" aria-hidden="true"></i>
			</div>
			</div>
		</div>
				
				<div class="form-group row">
			<div class="col-sm-5">
		<label for="hpin">Pin Code : </label>
		<input type="text" class="form-control form-control-sm" ng-model="hpin" name="hpin" placeholder="Enter the pin code" required
		ng-class="{'is-invalid':docForm.hpin.$invalid && docForm.hpin.$touched}" />
			<small class="text-danger help-block" ng-show="docForm.hpin.$error.required && docForm.hpin.$dirty">Pin Code is required.</small>
			</div>
			<div class="form-group col-sm-1 icon">
				<div ng-if="docForm.hpin.$invalid && docForm.hpin.$touched" class="text-danger">
                              <i class="fas fa-street-view" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.hpin.$invalid && docForm.hpin.$touched)" class="text-css">
                              <i class="fas fa-street-view" aria-hidden="true"></i>
			</div>
			</div>
				<div class="col-sm-5">
			<label for="cfees">Consultation Fees :</label> 
			<input type="text" class="form-control form-control-sm" ng-model="cfees" name="cfees" placeholder="Enter your consultation fees" required
			ng-class="{'is-invalid':docForm.cfees.$invalid && docForm.cfees.$touched}" />
			<small class="text-danger help-block" ng-show="docForm.cfees.$error.required && docForm.cfees.$dirty">Consultation Fees is required.</small>
			</div>
			<div class="col-sm-1 icon">
				<div ng-if="docForm.cfees.$invalid && docForm.cfees.$touched" class="text-danger">
                              <i class="fas fa-wallet" aria-hidden="true"></i>
                        </div>
                        <div ng-if="!(docForm.cfees.$invalid && docForm.cfees.$touched)" class="text-css">
                              <i class="fas fa-wallet" aria-hidden="true"></i>
			</div>
			</div>
		</div>
				
				<div class="row">
					<div class="col-sm-6">
				<button type="submit" ng-disabled="docForm.$invalid" class="btn btn-block btn-sm btn-primary"> Register </button>
				</div>
				<div class="col-sm-6">
				<button type="reset" class="btn btn-block btn-sm btn-danger"> Cancel </button>
				</div>
				</div>				
				</form>
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