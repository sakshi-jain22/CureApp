<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cureapp.Model.DoctorDao" %>
<%@ page import="com.cureapp.Controller.Doctor" %>

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
	<br/><br/><br/><br/>
	<div class="container">
		<div class="row">
			<div class="card">
  				<div class="card-body">
<%
	String specialist = request.getParameter("specialist");
	
	DoctorDao doc_data = DoctorDao.getInstance();
	ArrayList<Doctor> doctorList = doc_data.selectDoctor(specialist);
%>
	<center><h1 class="heading"><%= specialist %></h1></center>
	<center><img src="img/docIcon.png" width="125" height="125" class="img-fluid"></center>
	<hr/>
	<br/>
	<div class="container-fluid">
		<div class="row">
	<%
	if(doctorList.size() > 0 )
	{
	%>
		<table class="table table-bordered table-striped table-hover display" border="2" id="dtMaterialDesignExample">
			<thead>
				<tr>
					<th scope="col">S.No.</th>
					<th scope="col">Name</th>
					<th scope="col">Qualifications</th>
					<th scope="col">Contact No.</th>
					<th scope="col">Hospital / Clinic Name</th>
					<th scope="col">Off. Address</th>
					<th scope="col">Consultation Fees</th>
					<th scope="col">Select</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th scope="col">S.No.</th>
					<th scope="col">Name</th>
					<th scope="col">Qualifications</th>
					<th scope="col">Contact No.</th>
					<th scope="col">Hospital / Clinic Name</th>
					<th scope="col">Off. Address</th>
					<th scope="col">Consultation Fees</th>
					<th scope="col"></th>
				</tr>
			</tfoot>
			<tbody>
			<%
				int i=0;
				for(Doctor doctor : doctorList)
				{
			%>
			
			
				<tr>
				<form action="assigndoctor" method="post">
					<input type="hidden" name="DocID" value="<%= doctor.getDoctorID() %>">
					<th scope="row"><%= ++i %></th>
					<td> <%= doctor.getName() %> </td>
					<td> <%= doctor.getQualifications() %> </td>
					<td> <%= doctor.getContactNo() %> </td>
					<td> <%= doctor.getHospitalName() %> </td>
					<td> <%= doctor.getDocAddress().getLocality()  %>,<br/>
						 <%= doctor.getDocAddress().getCity() %>, <br/>
						 <%= doctor.getDocAddress().getState() %> 
					</td>
					<td> <%= doctor.getConsultationFees() %> </td>
					<td> <button type="submit" class="btn btn-block btn-secondary btn-sm">Go</button> </td>
				</form>
				</tr>
			
			
			<%
				}
			%>
			</tbody>
		</table>
 	<%
	}
	else
		out.write("No Specialists available currently");
 	%>
	
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
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" crossorigin="anonymous"></script>
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