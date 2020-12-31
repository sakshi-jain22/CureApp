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
<body ng-controller="medicineController">
	<jsp:include page="header.jsp"/>
	<br><br><br><br>	
<% 
	session = request.getSession();	
	String uname = (String) session.getAttribute("uname");
	String utype = (String) session.getAttribute("utype");
	
	if(utype != "CHEMIST")
	{
		out.write("<div class='valid'></div>");
	}
%>
	
	<form method="post" action="adding_medicine" enctype="multipart/form-data" name="medicineForm">
		<input type="hidden" name="cid" value=" ${ uname } ">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="card">
					  <div class="card-body">
					  <center>
						<h1 class="heading">ADD MEDICINE</h1>
						<img src="img/pills.png" height="125px" width="125px">
					  </center>
					  <hr/>
					    <div class="form-group row">
					    	<div class=" col-md-5">
					    		<label for="inputMedName" class="col-form-label col-form-label-sm">Medicine Name</label>
								<input type="text" class="form-control form-control-sm" name="inputMedName" ng-model="inputMedName" placeholder="Enter the Medicine Name" 
								required ng-class="{ 'is-invalid':medicineForm.inputMedName.$invalid && medicineForm.inputMedName.$touched }">
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
						      ng-model="inputBarCode" ng-class="{ 'is-invalid':medicineForm.inputBarCode.$invalid && medicineForm.inputBarCode.$touched }">
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
						    <input type="text" class="form-control form-control-sm" name="inputBatchNum" ng-model="inputBatchNum" placeholder="Enter the Batch Number" 
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
								<input type="text" class="form-control form-control-sm" name="inputNetWgt" ng-model="inputNetWgt" placeholder="Enter the Net Weight" 
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
						      <input type="text" class="form-control form-control-sm" name="inputPower" ng-model="inputPower" placeholder="Enter the Power in 'mg'" 
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
						    <input type="text" class="form-control form-control-sm" name="inputMftName" ng-model="inputMftName" placeholder="Enter the Manufacturer Name" 
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
						      <input type="text" class="form-control form-control-sm" name="inputPrice" ng-model="inputPrice" placeholder="Enter the Price" 
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
						      <input type="number" class="form-control form-control-sm" name="inputStock" ng-model="inputStock" placeholder="Enter the Stock Count" 
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
							    <input type="file" class="form-control form-control-sm custom-file-input" size="50" name="inputImg" aria-describedby="inputGroupFileAddon04" required>
							    <label class="form-control form-control-sm custom-file-label" for="inputGroupFile04">Choose file</label>
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
							    <input type="file" class="form-control form-control-sm custom-file-input" size="50" name="inputIngr" aria-describedby="inputGroupFileAddon04" required>
							    <label class="form-control form-control-sm custom-file-label" for="inputGroupFile04">Choose file</label>
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
						      <input type="date" class="form-control form-control-sm" name="inputExpDate" ng-model="inputExpDate" required
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
							<button type="submit" ng-disabled="medicineForm.$invalid" class="btn btn-sm btn-block btn-primary">Add Stock</button>
							</div>
							<div class="form-group col-sm-6">
								<button type="reset" class="btn btn-sm btn-block btn-secondary"> Reset </button>
							</div>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<br>
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