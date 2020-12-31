<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cureapp.Controller.Doctor" %>
    <%@ page import="com.cureapp.Controller.Patient" %>
    <%@ page import="com.cureapp.Controller.Methods" %>
    <%@ page import="com.cureapp.Model.DoctorDao" %>
    <%@ page import="com.cureapp.Model.PatientDao" %>
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
<body class="panel" ng-controller="chatController">

<%
	session = request.getSession();
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
	String username = "";
	
	if(utype != null && uname!=null)
	{
		if(utype.equals("DOCTOR"))
		{
			Doctor myData = DoctorDao.getInstance().retrieveMyData(uname);
			username = myData.getName();
		}
		else if(utype.equals("PATIENT"))
		{
			Patient myData = PatientDao.getInstance().retrieveMyData(uname);
			username = myData.getName();
		}
		
		session.setAttribute("username", username);
%>
<nav class="navbar navbar-dark" style="background-color: #220C10;">
  <div class="navbar-brand">
    <img src="img/write.png" width="40" height="40" class="d-inline-block align-top" alt="" loading="lazy">
    <%= username %>
  </div>
</nav>
<br/><br/>
		<div class="container">
		<form name="chatForm" novalidate>
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
		<textarea id="messageTextArea" class="form-control form-control-sm" readonly="readonly" rows="20"></textarea><br/>
		</div>
		</div>
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-7">
		<input type="text" class="form-control form-control-sm rounded-pill" onchange="toggleBtn();" placeholder="     Type a message" id="messageText"
		 ng-model="messageText" name="messageText" required/>
		</div>
		<div class="col-sm-1">
			<button type="button" class="btn btn-success rounded rounded-circle rounded-lg" id="btn-send"
			 ng-disabled="chatForm.messageText.$error.required || chatForm.messageText.$invalid" onclick="sendMessage();"> 
				<i class="fab fa-telegram-plane fa-lg"></i>
			</button>
		</div>
		</div>
		</form>
		</div>
<%
	}
	if(utype.equals("PATIENT"))
	{
		session.setAttribute("utype", "PATIENT");
		session.setAttribute("uname", uname);
%>
	
		<a style="float:right; margin-right:50px;" id="jumper" class="btn btn-lg btn-outline-danger rounded-pill" href="waitAppointment.jsp">
			<i class="fas fa-power-off"></i>
		</a>
<%
	}
	if(utype.equals("DOCTOR"))
	{
		session.setAttribute("utype", "DOCTOR");
		session.setAttribute("uname", uname);
%>
	
		<a style="float:right; margin-right:50px;" id="jumper" class="btn btn-lg btn-outline-danger rounded-pill" href="dismissappointment.jsp">
			<i class="fas fa-power-off"></i>
		</a>
<%
	}
%>	
	<br/>
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
		var websocket = new WebSocket("ws:/localhost:8080/CureApp/ChatroomServerEndpoint");
		websocket.onmessage = function processMessage(message) {
			var jsonData = JSON.parse(message.data);
			if(jsonData.message != null) 
				messageTextArea.value += jsonData.message + "\n";
		}
		function sendMessage() {
			websocket.send(messageText.value);
			messageText.value="";
			var element = document.getElementById("messageText");
			element.classList.remove("ng-valid");
			element.classList.remove("ng-valid-required");
			element.classList.remove("ng-not-empty");
			element.classList.add("ng-invalid");
			element.classList.add("ng-invalid-required");
			element.classList.add("ng-empty");
			document.getElementById("btn-send").disabled=true;
		}
		function toggleBtn()
		{
			var value = document.getElementById("btn-send").disabled;
			document.getElementById("btn-send").disabled = !value;
		}
	</script>
</body>
</html>