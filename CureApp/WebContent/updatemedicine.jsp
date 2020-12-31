<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cureapp.Controller.Methods" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
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
<body data-ng-app="myModule" data-ng-controller="updateMedicineController">
 <jsp:include page="header.jsp" />
<br><br><br><br>
 {{error}}
<%
	String medicine = request.getParameter("inputMedName");
	
	session = request.getSession();	
	String uname = (String) session.getAttribute("uname");
	String utype = (String) session.getAttribute("utype");
	
	if(utype != "CHEMIST")
	{
		out.write("<div class='valid'></div>");
	}
	
%>
	<form method="post" action="fetchMedicineServlet" name="medicineForm">
		<input type="hidden" name="cid" value=" ${ uname } ">
		<input type="hidden" name="medname" value="{{medicine.medicineName}}">
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<div class="card">
					  <div class="card-body">
					  <center>
						<img src="img/pills.png" height="125px" width="125px">
						<h2 class="heading">UPDATE MEDICINE</h2>
					  </center>
					  <hr/>
					    <div class="form-group row">
					    	<div class=" col-md-5">
					    		<label for="inputMedName" class="col-form-label col-form-label-sm">Medicine Name</label>
								<input type="text" class="form-control form-control-sm" name="inputMedName" data-ng-model="medicine.medicineName" placeholder="Enter the Medicine Name" 
								required ng-class="{ 'is-invalid':medicineForm.inputMedName.$invalid && medicineForm.inputMedName.$touched }" disabled>
					    		<small class="text-danger" ng-class="{ 'd-none':medicineForm.inputMedName.$valid || medicineForm.inputMedName.$untouched }">
					    			What medicine is this?
					    		</small>
					    	</div>
					    	<div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputMedName.$invalid && medicineForm.inputMedName.$touched" class="text-danger">
			                              <i class="fas fa-pills" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputMedName.$invalid && medicineForm.inputMedName.$touched)" class="text-css">
			                              <i class="fas fa-pills" aria-hidden="true"></i>
							</div>
							</div>
					    	<div class="col-md-5">
						      <label for="inputBarCode" class="col-form-label col-form-label-sm">Bar Code Number</label>
						      <input type="text" class="form-control form-control-sm" name="inputBarCode" placeholder="Enter the Bar Code Number" required 
						      ng-model="medicine.barCodeNumber" ng-class="{ 'is-invalid':medicineForm.inputBarCode.$invalid && medicineForm.inputBarCode.$touched }">
						      <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputBarCode.$valid || medicineForm.inputBarCode.$untouched }">
						      	Doesn't it has a bar-code?
						      </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputBarCode.$invalid && medicineForm.inputBarCode.$touched" class="text-danger">
			                              <i class="fas fa-barcode" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputBarCode.$invalid && medicineForm.inputBarCode.$touched)" class="text-css">
			                              <i class="fas fa-barcode" aria-hidden="true"></i>
							</div>
							</div>
					    </div>
					    <div class="form-group row">
					    	<div class="col-md-11">
						    <label for="inputBatchNum" class="col-form-label col-form-label-sm">Batch Number</label>
						    <input type="text" class="form-control form-control-sm" name="inputBatchNum" ng-model="medicine.batchNo" placeholder="Enter the Batch Number" 
						    required ng-class="{ 'is-invalid':medicineForm.inputBatchNum.$invalid && medicineForm.inputBatchNum.$touched }">
						    <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputBatchNum.$valid || medicineForm.inputBatchNum.$untouched }">
						    	Please enter the Batch Number.
						    </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputBatchNum.$invalid && medicineForm.inputBatchNum.$touched" class="text-danger">
			                              <i class="fas fa-cannabis" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputBatchNum.$invalid && medicineForm.inputBatchNum.$touched)" class="text-css">
			                              <i class="fas fa-cannabis" aria-hidden="true"></i>
							</div>
							</div>
						</div>
					  
					  	<div class="form-group row">
					    	<div class="col-md-5">
					    		<label for="inputNetWgt" class="col-form-label col-form-label-sm">Net Weight</label>
								<input type="text" class="form-control form-control-sm" name="inputNetWgt" ng-model="medicine.netWeight" placeholder="Enter the Net Weight" 
								required ng-class="{ 'is-invalid':medicineForm.inputNetWgt.$invalid && medicineForm.inputNetWgt.$touched }">
								<small class="text-danger" ng-class="{ 'd-none':medicineForm.inputNetWgt.$valid || medicineForm.inputNetWgt.$untouched }">
									Is this a valid Net Weight?
								</small>
					    	</div>
					    	<div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputNetWgt.$invalid && medicineForm.inputNetWgt.$touched" class="text-danger">
			                              <i class="fas fa-balance-scale-right" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputNetWgt.$invalid && medicineForm.inputNetWgt.$touched)" class="text-css">
			                              <i class="fas fa-balance-scale" aria-hidden="true"></i>
							</div>
							</div>
					    	<div class="col-md-5">
						      <label for="inputPower" class="col-form-label col-form-label-sm">Power (in mg)</label>
						      <input type="text" class="form-control form-control-sm" name="inputPower" ng-model="medicine.power" placeholder="Enter the Power in 'mg'" 
						      required ng-class="{ 'is-invalid':medicineForm.inputPower.$invalid && medicineForm.inputPower.$touched }">
						      <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputPower.$valid || medicineForm.inputPower.$untouched }">
						      	Power (in mg) is required.
						      </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputPower.$invalid && medicineForm.inputPower.$touched" class="text-danger">
			                              <i class="fas fa-dumbbell" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputPower.$invalid && medicineForm.inputPower.$touched)" class="text-css">
			                              <i class="fas fa-dumbbell" aria-hidden="true"></i>
							</div>
							</div>
					    </div>
					    
					    					    
					    <div class="form-group row">
					    	<div class="col-md-11">
						    <label for="inputMftName" class="col-form-label col-form-label-sm">Manufacturer Name</label>
						    <input type="text" class="form-control form-control-sm" name="inputMftName" ng-model="medicine.manufacturerName" placeholder="Enter the Manufacturer Name" 
						    required ng-class="{ 'is-invalid':medicineForm.inputMftName.$invalid && medicineForm.inputMftName.$touched }">
						    <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputMftName.$valid || medicineForm.inputMftName.$untouched }">
						    	Which is the Manufacturer company?
						    </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputMftName.$invalid && medicineForm.inputMftName.$touched" class="text-danger">
			                              <i class="fas fa-industry" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputMftName.$invalid && medicineForm.inputMftName.$touched)" class="text-css">
			                              <i class="fas fa-industry" aria-hidden="true"></i>
							</div>
							</div>
						</div>		
					    
					    <div class="form-group row">
						    <div class="col-md-5">
						      <label for="inputPrice" class="col-form-label col-form-label-sm">Price</label>
						      <input type="text" class="form-control form-control-sm" name="inputPrice" ng-model="medicine.costPrice" placeholder="Enter the Price" 
						      required ng-class="{ 'is-invalid':medicineForm.inputPrice.$invalid && medicineForm.inputPrice.$touched }">
						      <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputPrice.$valid || medicineForm.inputPrice.$untouched }">
						      		What is the cost price?
						      </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputPrice.$invalid && medicineForm.inputPrice.$touched" class="text-danger">
			                              <i class="fas fa-rupee-sign" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputPrice.$invalid && medicineForm.inputPrice.$touched)" class="text-css">
			                              <i class="fas fa-rupee-sign" aria-hidden="true"></i>
							</div>
							</div>
							<div class="col-md-5">
						      <label for="inputPrice" class="col-form-label col-form-label-sm">Stock Count</label>
						      <input type="number" class="form-control form-control-sm" name="inputStock" ng-model="medicine.stockCount" placeholder="Enter the Stock Count" 
						      required ng-class="{ 'is-invalid':medicineForm.inputStock.$invalid && medicineForm.inputStock.$touched }" min="1">
						      <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputStock.$valid || medicineForm.inputStock.$untouched }">
						      		What is the total stock count?
						      </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputStock.$invalid && medicineForm.inputStock.$touched" class="text-danger">
			                              <i class="fas fa-sort-amount-up" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputStock.$invalid && medicineForm.inputStock.$touched)" class="text-css">
			                              <i class="fas fa-sort-amount-up" aria-hidden="true"></i>
							</div>
							</div>
							</div>
							<div class="form-group row">
						    <div class="col-md-5">
						      <label for="inputImg" class="col-form-label col-form-label-sm">Image</label>
						      <div class="input-group input-group-sm mb-3">
							  <div class="custom-file">
							    <input type="text" disabled class="form-control form-control-sm" name="inputImg" ng-model="medicine.medImagePath">
							  </div>
							  
							</div>
						    </div>
						    <div class="form-group col-sm-1 icon">
			                <div class="text-css">
			                     <i class="fas fa-file-medical-alt" aria-hidden="true"></i>
							</div>
							</div>
						    <div class="col-md-5">
						      <label for="inputIngr" class="col-form-label col-form-label-sm">Ingredient Image</label>
						    <div class="input-group input-group-sm mb-3">
							  <div class="custom-file">
							    <input type="text" class="form-control form-control-sm" name="inputIngr" ng-model="medicine.ingrImagePath" disabled>
							  </div>
							  
							</div>
							</div>
							<div class="form-group col-sm-1 icon">
			                     <div class="text-css">
			                         <i class="fas fa-mortar-pestle" aria-hidden="true"></i>
							</div>
							</div>
						</div>
						
						<div class="form-group row">
					    	<div class="col-md-5">
					    		<label for="inputMfgDate" class="col-form-label col-form-label-sm">Manufacturing Date</label>
								<input type="date" class="form-control form-control-sm" name="inputMfgDate" ng-model="inputMfgDate" required
								ng-class="{ 'is-invalid':medicineForm.inputMfgDate.$invalid && medicineForm.inputMfgDate.$touched }">
								<small class="text-danger" ng-class="{ 'd-none':medicineForm.inputMfgDate.$valid || medicineForm.inputMfgDate.$untouched }">
									Please select the mfg date.
								</small>
					    	</div>
					    	<div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputMfgDate.$invalid && medicineForm.inputMfgDate.$touched" class="text-danger">
			                              <i class="far fa-calendar-plus" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputMfgDate.$invalid && medicineForm.inputMfgDate.$touched)" class="text-css">
			                              <i class="far fa-calendar-plus" aria-hidden="true"></i>
							</div>
							</div>
					    	<div class="col-md-5">
						      <label for="inputExpDate" class="col-form-label col-form-label-sm">Expiring Date</label>
						      <input type="date" class="form-control form-control-sm" name="inputExpDate" data-ng-model="inputExpDate" required
						      ng-class="{ 'is-invalid':medicineForm.inputExpDate.$invalid && medicineForm.inputExpDate.$touched }">
						      <small class="text-danger" ng-class="{ 'd-none':medicineForm.inputExpDate.$valid || medicineForm.inputExpDate.$untouched }">
						      		Please select the expiry date.
						      </small>
						    </div>
						    <div class="form-group col-sm-1 icon">
							<div ng-if="medicineForm.inputExpDate.$invalid && medicineForm.inputExpDate.$touched" class="text-danger">
			                              <i class="far fa-calendar-minus" aria-hidden="true"></i>
			                        </div>
			                        <div ng-if="!(medicineForm.inputExpDate.$invalid && medicineForm.inputExpDate.$touched)" class="text-css">
			                              <i class="far fa-calendar-minus" aria-hidden="true"></i>
							</div>
							</div>
					    </div>
						
						
						<div class="form-row">
							<div class="form-group col-sm-6">
							<button type="submit" ng-disabled="medicineForm.$invalid" class="btn btn-sm btn-block btn-success">Update Stock</button>
							</div>
							<div class="form-group col-sm-6">
								<button type="button" class="btn btn-sm btn-block btn-secondary" data-ng-click="reset()"> Reset </button>
							</div>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</form>


 <br><br><br><br><br><br>
 <jsp:include page="footer.jsp" />
 
<!-- Scripts -->
	<!-- jQuery -->
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
	<script src='js/script.js'></script>
	<script>
		var myApp = angular.module("myModule",[]);
		myApp.controller("updateMedicineController",function($scope, $http, $log) {
			$http({
				method: 'PUT',
				url: 'http://localhost:8080/CureApp/fetchMedicineServlet',
				contentType: 'application/json',
				data: "{'medicine':'<%= medicine %>'}"
				}).then(function (response) {
					$scope.medicine = response.data;
					$log.info(response);
					$scope.inputMfgDate = new Date(response.data.manufacturingDate);
					$scope.inputExpDate = new Date(response.data.expiryDate);
			}, function (reason) {
				$scope.error = reason.data;
				$log.info(reason);
			});
			
			$scope.reset = function() {
				  $scope.medicine.medicineName = angular.copy('<%= medicine %>');
				  $scope.inputMfgDate = angular.copy('');
				  $scope.inputExpDate = angular.copy('');
				  $scope.medicine.barCodeNumber = angular.copy('');
				  $scope.medicine.batchNo = angular.copy('');
				  $scope.medicine.manufacturerName = angular.copy('');
				  $scope.medicine.netWeight = angular.copy('');
				  $scope.medicine.power = angular.copy('');
				  $scope.medicine.stockCount = angular.copy('');
				  $scope.medicine.costPrice = angular.copy('');
			  }
		});
	</script>
</body>
</html>