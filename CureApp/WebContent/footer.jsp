<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cureapp.Model.PatientDao" %>
    <%@ page import="com.cureapp.Controller.Patient" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CureApp</title>
	<!-- Stylesheets -->
	<!-- Bootstrap CSS -->
	<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
<style>

</style>
</head>
<body>
<br/>
<!-- Footer -->
        <footer>
            <div id="footer1" class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                       <p>
                       <%	String utype = (String)session.getAttribute("utype");
                       		String uname = (String)session.getAttribute("uname");
                       		if(utype==null)
	                        {
	                    %>
	                    		<a href="chemistLogin.jsp" class="footerlinks">Chemist Login</a>
	                    <%
	                        }
                       		else if(utype.equals("CHEMIST"))
                       		{
                       	%>
                       
                        	<a href="AddMedicine.jsp" class="footerlinks">Add Medicine</a>
                        <%
                        	}
                        	else if(utype.equals("PATIENT"))
                        	{
                        		PatientDao fetchData = PatientDao.getInstance();
                        		Patient myData = fetchData.retrieveMyData(uname);
                        		
                        %>
                        	<a href="ViewMedicine.jsp" class="footerlinks">Buy Medicine</a>
                        	<a href="" class="footerlinks">Hi! <%= myData.getName() %> </a>
                        	<a href="selectspecialist.jsp" class="footerlinks">Select Doctor</a>
                        <%	
		                        if(myData.getDocId() != null)
		                			out.write("<a href='waitAppointment.jsp' class='footerlinks'>Consult Doctor</a>");
                        	}
                        	else if(utype.equals("DOCTOR"))
                        	{
                       %>
                       			<a href="view_patients.jsp" class="footerlinks">View Patients</a>
                       			<a href="viewdoctorprofile.jsp" class="footerlinks">Hello!! Doctor</a>
                       			<a href="updatedoctor.jsp" class="footerlinks">Update Profile</a>
                       <%
                        	}
                       %>
                        </p>
                    </div>

                </div>
            </div>
            <div id="footer2" class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                        <p style="color: #FFD901" title="All right Reserved">&copy All right Reserved.</p>
                    </div>
                </div>
            </div>

        </footer>
        <!-- ./Footer -->
        
        <!-- Scripts -->
	<!-- Jquery -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>