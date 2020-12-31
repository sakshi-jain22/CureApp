<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %>
<%@page language="java" import="java.text.SimpleDateFormat" %>
<%@ page import="com.cureapp.Model.PatientDao" %>
<%@ page import="com.cureapp.Controller.Patient" %>
<%@ page import="com.cureapp.Controller.Methods" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CureApp</title>
<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>
<!-- font awesome CSS -->
<link rel='stylesheet' href="fontawesome/css/all.css">
<!-- Magnific CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
<!-- Fontawesome CSS -->
<link rel="stylesheet" href="fontawesome/css/all.css">
<!-- custom CSS file -->
<link rel="stylesheet" href="css/stylesheet.css">
<!-- Icon Link -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<style> .btn
{
margin-top: 50px
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/> 
<br>
	  <br>
	  <br><br><br>
<% 	session = request.getSession();
	String username = (String) session.getAttribute("uname");
	//out.println(username);
	PatientDao pdao=PatientDao.getInstance();
	Patient p=pdao.retrieveMyData(username); 
	String pass=Methods.charToString(p.getPassword());
	SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");
    SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
%>
	
	<div class="container">
	<form class="row g-3">
		<div class="col-md-12">
				<h3>Patient Data</h3>
				<hr><hr>
		</div>
  <div class="col-md-6">
    <label for="inputName" class="form-label">Patient Name:</label>
    <input type="text" class="form-control" id="name" value="<%=p.getName()%>" readonly >
  </div>
  <div class="col-md-6">
    <label for="inputContact" class="form-label">Contact Number:</label>
    <input type="text" class="form-control" id="inputContact" value="<%= p.getContact()%>" readonly>
  </div>
  
  <div class="col-md-6">
    <label for="inputEmail" class="form-label">Email:</label>
    <input type="text" class="form-control" id="inputEmail" value="<%=p.getPatientid() %>" readonly>
  </div>
  <div class="col-md-6">
    <label for="inputPassword" class="form-label">Password:</label>
    <input type="text" class="form-control" id="inputPassword" value="<%=pass%>" readonly>
  </div>
  
  <div class="col-md-12">
    <label for="dateofbirth" class="form-label">Date of Birth:</label>
    <input type="text" class="form-control" id="dob" value="<%=format1.format(format2.parse(p.getDOB()))%>" readonly>
  </div>
  
  <div class="col-md-12">
  	<label for="tellUSProblem">Problem Statement:: </label>
  	<input type="text" class="form-control" id="tellUSProblem">
  </div>
  
  <div class="col-md-4">
    <label for="inputLocality" class="form-label">Locality</label>
    <input type="text" class="form-control" id="inputCity" value="<%=p.getAddress().getLocality() %>" readonly>
  </div>
  <div class="col-md-4">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity" value="<%=p.getAddress().getCity() %>" readonly>
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <input type="text" class="form-control" id="inputState" value="<%=p.getAddress().getState() %>" readonly>
  </div>
  
  
  <br><br>
  <div class="col-md-6">
    <button type="submit" class="btn btn-success btn-lg btn-block">Submit changes</button>
  </div>
  <div class="col-md-6">
    <button type="reset" class="btn btn-secondary btn-lg btn-block">Discard changes</button>
  </div>
</form>
</div>
<br>
	<jsp:include page="footer.jsp"/> 
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
	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<!-- Custom Jquery -->
	<script src='js/jqueryCode.js'></script>
	<!-- Custom JS -->
	<script src="js/script.js"></script>
</body>
</html>