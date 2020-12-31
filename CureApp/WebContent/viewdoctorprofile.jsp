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
	<!-- Magnific CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
	<!-- JQuery-Confirm CSS -->
	<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>
	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="fontawesome/css/all.css">
	<!-- Datatables CSS -->
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<!-- Select Datatables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body ng-controller="fetchDoctor">
<jsp:include page="header.jsp"/>
<br/><br/><br/>
<%
	session = request.getSession();
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
	
	if(utype.equals("DOCTOR") == false)
	{
		System.out.println(utype);
		out.write("<div class='valid'></div>");
	}
%>
	<div class="container">
		<div class="card">
  			<div class="card-body">
  				
	<center>
		<img src="img/viewuser.png" width="125" height="125">
		<h2>Doctor Profile</h2>
		<hr/>
	</center>
	
	<div class="container-fluid">
	<form method="post" action="" name="docForm" novalidate>
		<input type="hidden" name="dID" value="${ uname }">
		<div class="form-group row">
			<div class="col-sm-5">
		<label for="docID">Username : </label>
		<input type="text" class="form-control form-control-sm" ng-model="doctorData.doctorID" name="docID" placeholder="Create a username" required 
		ng-class="{'is-invalid': docForm.docID.$invalid && docForm.docID.$touched }" disabled />
		
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
			<input type="text" class="form-control form-control-sm" ng-model="doctorData.name" name="name" placeholder="Enter the name" required
			ng-class="{'is-invalid': docForm.name.$invalid && docForm.name.$touched}" disabled/>
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
			<div class="col-sm-11">
			<label for="specialization">Specialization : </label>
				<select name="specialization" class="custom-select custom-select-sm" ng-class="{'is-invalid':docForm.specialization.$invalid && docForm.specialization.$touched}"
				 ng-model="doctorData.specialization" required ng-disabled="true">
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
					 <input class="form-check-input" type="radio" name="qualifications" ng-model="doctorData.qualifications"  value="{{qual}}" ng-disabled="true"> 
					 <label class="form-check-label" for="{{qual}}">{{qual}} </label>
				</div>
				</div>
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
				<input type="text" class="form-control form-control-sm" name="contact" placeholder="Enter your contact number" required ng-model="doctorData.contactNo"
				ng-class="{'is-invalid':docForm.contact.$invalid && docForm.contact.$touched}" disabled/>
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
		<input type="text" class="form-control form-control-sm" ng-model="doctorData.hospitalName" name="hname" placeholder="Enter your hospital or clinic name" required
		ng-class="{'is-invalid':docForm.hname.$invalid && docForm.hname.$touched}" disabled/>
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
			<textarea class="form-control form-control-sm" ng-model="doctorData.docAddress.locality" name="hloc" placeholder="Enter the hospital locality" rows="1" required
			ng-class="{'is-invalid':docForm.hloc.$invalid && docForm.hloc.$touched}" readonly></textarea>
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
		<input type="text" class="form-control form-control-sm" ng-model="doctorData.docAddress.city" name="hcity" placeholder="Enter the city" required
		ng-class="{'is-invalid':docForm.hcity.$invalid && docForm.hcity.$touched}" disabled/>
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
			<input type="text" class="form-control form-control-sm" ng-model="doctorData.docAddress.state" name="hstate" placeholder="Enter the state" required
			ng-class="{'is-invalid':docForm.hstate.$invalid && docForm.hstate.$touched}" disabled/>
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
		<input type="text" class="form-control form-control-sm" ng-model="doctorData.docAddress.pinCode" name="hpin" placeholder="Enter the pin code" required
		ng-class="{'is-invalid':docForm.hpin.$invalid && docForm.hpin.$touched}" disabled/>
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
			<input type="text" class="form-control form-control-sm" ng-model="doctorData.consultationFees" name="cfees" placeholder="Enter your consultation fees" required
			ng-class="{'is-invalid':docForm.cfees.$invalid && docForm.cfees.$touched}" disabled/>
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
					<div class="col">
				<button type="button" class="btn btn-block btn-sm btn-primary" ng-click="doTheBack()"> Go Back </button>
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
	<!-- Magnific JS -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js'></script>
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
	<script>
	var myApp = angular.module("myModule");
	myApp.controller("fetchDoctor",function($scope, $http, $log) {
		$scope.Doctor = {
				specialization : ["Physician", "Pediatrician", "Gynecologist", "Psychiatrist", "Cardiologist", "Dermatologist", "Endocrinologist", "Gastroenterologist",
					"Nephrologist", "Ophthalmologist", "Otolaryngologist", "Pulmonologist", "Neurologist", "Radiologist", "Anesthesiologist", "Oncologist"],
				qualifications : ["MBBS", "BMBS", "MBChB", "MD", "Dr.MuD", "Dr.Med", "DO"]
		};
		$scope.passValidation = false;
		$scope.changepassword = function() {
			var regexp = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$/;
			if(regexp.test($scope.pswd) == false)
			{
				$scope.passValidation = false;
			}
			else
			{
				$scope.passValidation = true;
			}
		};
		
		$http({
			method: 'PUT',
			url: 'http://localhost:8080/CureApp/fetchDoctorServlet',
			contentType: 'application/json',
			data: "{'doctor':'<%= uname %>'}"
			}).then(function (response) {
				$scope.doctorData = response.data;
				$scope.pswd = $scope.doctorData.password.join('');
				$log.info(response);
		}, function (reason) {
			$scope.error = reason.data;
			$log.info(reason);
		});
		
		/*
		$scope.reset = function() {
			$scope.doctorData.name = angular.copy('');
			$scope.doctorData.qualifications = angular.copy('');
			$scope.doctorData.specialization = angular.copy('');
			$scope.doctorData.contactNo = angular.copy('');
			$scope.doctorData.hospitalName = angular.copy('');
			$scope.doctorData.consultationFees = angular.copy('');
			$scope.doctorData.docAddress.locality = angular.copy('');
			$scope.doctorData.docAddress.city = angular.copy('');
			$scope.doctorData.docAddress.state = angular.copy('');
			$scope.doctorData.docAddress.pinCode = angular.copy('');
			$scope.cpswd = angular.copy('');
			$scope.pswd = $scope.doctorData.password.join('');
		}
		*/
		
		$scope.doTheBack = function() {
			window.history.back();
		};
	});
	</script>	
</body>
</html>