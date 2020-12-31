<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
	<%@ page language="java" import="javax.servlet.ServletContext" %>
	<%@ page import="com.cureapp.Model.MedicineDao" %>
    <%@ page import="com.cureapp.Controller.Medicine" %>
    <%@ page import="com.cureapp.Controller.Methods" %>
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
<body ng-controller="medicineController">
<jsp:include page="header.jsp"/>
<br/><br/><br/><br/>
<%
	String medicine = request.getParameter("inputMedName");

	ServletContext svrCxt=getServletContext();
	String imgPath=svrCxt.getInitParameter("ImageFileFetch");
	String ingrPath=svrCxt.getInitParameter("IngrImageFileFetch");
	
	Medicine medicineDetails = MedicineDao.getInstance().getMedicine(medicine);
	if(medicineDetails != null)
	{
%>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="card">
				  <div class="card-header">
				  	<div class="container-fluid">
				  	<div class="row">
				  	<div class="col-sm-4">
				  		<h2>CureApp Medicines <img src="img/test-tube.png" class="img-fluid"></h2>
				  	</div>
				  	<div class="col-sm-4"></div>
				  	<div class="col-sm-4">
				  		<img src="img/refund-logo.png" class="img-fluid img-align" width="100px" height="100px">
				  	</div>
				  	</div>
				  	</div>
				  </div>
				  <div class="card-body">
				  	<div class="container-fluid">
				  		<div class="row">
				  			<div class="col-sm-1">
				  			<ul class="list-group list-group-flush">
				  				<li class="list-group-item removeCssPadding">
				  				<span>
				  				<button type="button" class="btn btn-light btn-block removeCssPadding MedicineImg">
				  				<img src="<%= imgPath + medicineDetails.getMedImagePath() %>" class="img-fluid img-thumbnail" title="Medicine" alt="Medicine"
				  				 width="90%" height="auto">
				  				</button>
				  				</span>
				  				</li>
				  				<li class="list-group-item removeCssPadding">
				  				<span>
				  				<button type="button" class="btn btn-block btn-light removeCssPadding IngrImg">
				  				<img src="<%= ingrPath + medicineDetails.getIngrImagePath() %>" class="img-fluid img-thumbnail" title="Ingredients" 
				  				alt="Ingrdients Info" width="90%" height="auto">
				  				</button>
				  				</span>
				  				</li>
				  			</ul>
				  			</div>
				  			<div class="col-sm-5 img-gallery">
				  			<a href="<%= imgPath + medicineDetails.getMedImagePath() %>">
				  				<img src="<%= imgPath + medicineDetails.getMedImagePath() %>" class="img-fluid" title="Medicine" alt="Medicine"
				  				 width="100%" height="auto" id="changeImage">
				  			</a>
				  			<a href="<%= ingrPath + medicineDetails.getIngrImagePath() %>"></a>
				  			</div>
				  			<div class="col-sm-4">
				  				<h5 class="card-title"><%= medicine %><img src="img/guarantee.png" class="img-fluid" width="40px" height="40px"></h5>
				  				<hr/>
				  				<div class="badge badge-pill badge-info">
									<span class="icon-manage"><i class="fas fa-prescription"></i></span> Required
								</div>
							    <p class="card-text">
							    <div class="wrapper">
							    	<small class="text-secondary">
							    	Strength: <b> <%= medicineDetails.getPower() %> </b><br/>
							    	Manufacturer Name: <b> <%= medicineDetails.getManufacturerName() %> </b> <br>
							    	Net Weight: <b> <%= String.format("%.2f", medicineDetails.getNetWeight()) %> grams</b> <br>
									M.R.P.: <b>&#x20B9; <%= String.format("%.2f", medicineDetails.getCostPrice()) %></b>
									</small>
									 <span class="help-text2">Inclusive of all taxes.</span> <br><br>
									<div class="container">
									<div class="row">
									<div class="col-sm-3">
									<button class="btn btn-light rounded-circle border" data-toggle="popover" data-placement="bottom" title="No-Contact Delivery" data-trigger="focus" 
									 data-content="Delivery Associate will place the order on your doorstep and step back to maintain a 2-meter distance.">
									 <img src="img/door-sensor.png" class="img-fluid">
									 </button> <span class="text-info help-text2">No-Contact Delivery</span>
									 </div>
									 <div class="col-sm-3">
									 <button class="btn btn-light rounded-circle border" data-toggle="popover" data-placement="bottom" title="Return Policy" data-trigger="focus" 
									 data-content="7-Day Free Return and Exchange.This item is eligible for return within 7 days of delivery.">
									 <img src="img/return.png" class="img-fluid">
									 </button> <span class="text-info help-text2">Return Policy</span>
									 </div>
									 <div class="col-sm-3">
									 <button class="btn btn-light rounded-circle border" data-toggle="popover" data-trigger="focus" data-placement="bottom"
									  title="Delivery Policy" data-content="CureApp directly manages deilvery of this product.">
									 <img src="img/delivered.png" class="img-fluid">
									 </button> <span class="text-info help-text2">Delivery Policy</span>
									 </div>
									 </div>
									 </div>
								</div>
								<hr/>
									 <div class="wrapper">
									 <div class="description">
									 	<%
									 		if(medicineDetails.getStockCount() > 10)
									 			out.write("<span class='text-success'>In stock.</span>");
									 		else if(medicineDetails.getStockCount() <= 10 && medicineDetails.getStockCount() > 0)
									 			out.write("<span class='text-success'>Only " + medicineDetails.getStockCount() + " left in stock.</span>");
									 		else
									 			out.write("<span class='text-danger'>Out Of stock.</span>");
									 	%> <br/>
									 	<small class="text-dark">
									 	<p class="text-justify">
									 	Delivery By: <strong>  <%= Methods.formattedDateTenDaysLater() %> </strong> <br/>
									 	Fastest Delivery: <strong> <%= Methods.formattedDateFiveDaysLater() %> </strong> <br/>
									 	<b><i><u>Additional Stock Information</u>:</i></b><br/>
									 	Bar Code: <b><%= medicineDetails.getBarCodeNumber() %></b> <br/>
									 	Manufacturing Date: <b><%= Methods.convertDatePattern(medicineDetails.getManufacturingDate()) %></b> <br/>
									 	Expiry Date: <b><%= Methods.convertDatePattern(medicineDetails.getExpiryDate()) %></b>
									 	</p>
									 	Sold by <i><%= medicineDetails.getManufacturerName() %></i> and Fulfilled by <i>CureApp</i>.
									 	</small>
									 	<br/><br/><br/>
									 </div>
									 </div>
								</p>
				  			</div>
				  			<div class="col-sm-2">
				  				<a href="ViewMedicine.jsp" class="btn btn-sm btn-block btn-primary">Go Back</a>
				  			</div>
				  		</div>
				  		<div class="row">
				  		<div class="col-md-10">
				  		<div class="alert alert-warning" role="alert">
						  <h6 class="alert-heading">Disclaimer:</h6>
						  <span class="help-text1">The contents of this website are for informational purposes only and not intended to be a substitute for professional medical advice, diagnosis, or treatment. Please seek the advice of a physician or other qualified health provider with any questions you may have regarding a medical condition. Do not disregard professional medical advice or delay in seeking it because of something you have read on this website.
						</span>
						</div>
				  		</div>
				  		<div class="col-md-2"></div>
				  		</div>
				  	</div>
				    
				  </div>
				</div>
			</div>
		</div>
	</div>
<%
	}
%>
	<br/><br/>
	<jsp:include page="footer.jsp" />
	
	<!-- Scripts -->
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
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
	$(function() {
		$('.MedicineImg').on({
			'click': function() {
				$('#changeImage').attr('src','http://localhost:8080<%= imgPath + medicineDetails.getMedImagePath() %>');
			}
		});
		
		$('.IngrImg').on({
			'click': function() {
				$('#changeImage').attr('src','http://localhost:8080<%= ingrPath + medicineDetails.getIngrImagePath() %>');
			}
		});
	});
	</script>
</body>
</html>