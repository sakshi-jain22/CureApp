<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cureapp.Model.PatientDao" %>
    <%@ page import="com.cureapp.Model.PrescriptionDao" %>
    <%@ page import="com.cureapp.Controller.Doctor" %>
    <%@ page import="com.cureapp.Controller.Methods" %>
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
	<!-- Datatables CSS -->
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
	<!-- Select Datatables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css">
	<!-- Custom CSS -->
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="header.jsp"/>
<br/><br/><br/>
<%
	session = request.getSession();
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
	
	if(utype != "PATIENT")
		out.write("<div class='valid'></div>");
	else
	{
		PatientDao dao_patientFetchAppointment = PatientDao.getInstance();
		PrescriptionDao daoMyDoctor = PrescriptionDao.getInstance();
		Doctor myDoctor = daoMyDoctor.getPatientwiseDoctor(uname);
		int status = dao_patientFetchAppointment.appointmentStatus(uname);
		
		if(status == -2)
			out.write("<div id='unsuccess'></div>");
	
%>

	<div class="container">
	<div class="row">
	<div class="col-1"></div>
	<div class="col-10">
		<div class="card">
		<div class="card-body">
		<center><h2 class="heading">Consult Doctor</h2></center>
	<%
		if(status == 0)
		{
	%>
		<center><img src="img/waiting.png" width="125" height="125" class="img-fluid"></center>
	<%
		}
		else if(status == 1)
		{
	%>
		<center><img src="img/ready.png" width="125" height="125" class="img-fluid"></center>
	<%
		}
		else if(status == -1)
		{
	%>
		<center><img src="img/chat-done.png" width="125" height="125" class="img-fluid"></center>
	<%
		}
	%>
		<hr/>
		<br/>
		<div class="container-fluid">
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Name : </label>
			<div class="col-sm-8 text-muted">
			<%= myDoctor.getDoctorID() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-user-md fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Specialization : </label>
			<div class="col-sm-8 text-muted">
			<%= myDoctor.getSpecialization() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-procedures fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Qualifications : </label>
			<div class="col-sm-8 text-muted">
			<%= myDoctor.getQualifications() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-graduation-cap fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Contact No. : </label>
			<div class="col-sm-8 text-muted">
			+91 - <%= myDoctor.getContactNo() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fab fa-whatsapp fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Hospital/Clinic Name : </label>
			<div class="col-sm-8 text-muted">
			<%= myDoctor.getHospitalName() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-hospital-symbol fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Official Address : </label>
			<div class="col-sm-8 text-muted">
			<%= Methods.formattedAddress(myDoctor.getDocAddress()) %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-address-card fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
			<label class="col-sm-3 col-form-label col-form-label-sm">Prescription Fees : </label>
			<div class="col-sm-8 text-muted">
			<%= myDoctor.getConsultationFees() %>
			</div>	
			<div class="col-sm-1 text-css">
				<i class="fas fa-money-bill-wave fa-lg" aria-hidden="true"></i>
			</div>
		</div>
		<div class="row">
		<%
			if(status == 1)
			{
		%>
			<div class="col">
				<a href="ChatWindow.jsp" class="btn btn-sm btn-block btn-success">Open Chat Window</a>
			</div>
		<%
			}
			else if(status == -1)
			{
		%>
				<div class="col">
					<a href="" class="btn btn-sm btn-block btn-primary">Open Prescription List</a>
				</div>
				<div class="col">
					<a href="" class="btn btn-sm btn-block btn-secondary" target="_blank">Payment Link</a>
				</div>
			<%		
			}
			else if(status == 0)
			{
		%>
			<div class="col">
				<a href="index.jsp" class="btn btn-sm btn-block btn-warning">Come Back Later</a>
			</div>
		<%
			}
		%>
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
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
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
</body>
</html>