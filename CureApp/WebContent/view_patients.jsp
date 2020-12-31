<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cureapp.Model.PatientDao" %>
<%@ page import="com.cureapp.Controller.Patient" %>
<%@ page import="com.cureapp.Controller.Methods" %>

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
	<!-- Magnific CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
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
	
	if(utype != "DOCTOR")
		out.write("<div class='valid'></div>");
	else
	{
		PatientDao patientData = PatientDao.getInstance();
		ArrayList<Patient> patientList = patientData.getPatientsList(uname);
%>
	<div class="container">
	<div class="row">
	<div class="col-12">
	<div class="card">
	<div class="card-body">
	<center>
	<h2>Patients</h2>
	<img src="img/fever.png" class="img-fluid" width="125" height="125">
	<hr/>
	</center>
	<div class="container-fluid">
	<div class="row">
	<div class="col-12">
	<%
		if(patientList.size() > 0)
		{
	%>
	<table class="table table-hover table-striped table-bordered table-light" border="2" id="dtMaterialDesignExample">
			<thead class="thead-dark">
				<tr>
					<th scope="col">S.No.</th>
					<th scope="col">Name</th>
					<th scope="col">D.O.B.</th>
					<th scope="col">Contact No.</th>
					<th scope="col">Address</th>
					<th scope="col">Select</th>
				</tr>
			</thead>
			<tfoot>
				<tr class="table-secondary">
					<th scope="col">S.No.</th>
					<th scope="col">Name</th>
					<th scope="col">D.O.B.</th>
					<th scope="col">Contact No.</th>
					<th scope="col">Address</th>
					<th scope="col"></th>
				</tr>
			</tfoot>
			<tbody>
			<%
				int i=0;
				for(Patient patient : patientList)
				{
			%>
			
			
				<tr>
				<form action="assignAppointment" method="post">
					<input type="hidden" name="PatID" value="<%= patient.getPatientid() %>">
					<th scope="row"><%= ++i %></th>
					<td> <%= patient.getName() %> </td>
					<td> <%= Methods.convertDatePattern(patient.getDOB()) %> </td>
					<td> <%= patient.getContact() %> </td>
					<td> <%= patient.getAddress().getLocality() %>,
					 <br><%= patient.getAddress().getCity() %>,
					 <br><%= patient.getAddress().getState() %>
					 <%
					 {
					 	if(patient.getAddress().getPinCode() != null)
					 		out.print("-<br>" + patient.getAddress().getPinCode());
					 }
					 %>
					 </td>
					<td> 
					<%
						if(patient.getIsAppointed() == 0)
						{
					%>	
						<button type="submit" class="btn btn-block btn-info btn-sm">Go</button> 
					<%
						}
						else if(patient.getIsAppointed() == 1)
						{
					%>	
						<button type="submit" formaction="assignAppointment" class="btn btn-block btn-success btn-sm">Chat Panel</button> 
					<%
						}
						else if(patient.getIsAppointed() == -1)
						{
							
					%>
						  <button type="submit" formaction="view_prescription" class="btn btn-block btn-brown btn-sm">Prescription</button>
					<%
						}
					%>
						<button type="submit" formaction="bookappointment.jsp" class="btn btn-block btn-primary btn-sm">Appointment</button> 
					</td>
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
			out.write("No Patients available currently");
	%>
	</div>
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
	<script src="js/script.js"></script>
</body>
</html>