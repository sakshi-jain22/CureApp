<%@ page language="java" contentType="text/html; charset=ISO-8859-1" errorPage="error.jsp" 
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*" %>
<%@ page language="java" import="javax.servlet.ServletContext" %>
<%@ page import="com.cureapp.Model.MedicineDao" %>
<%@ page import="com.cureapp.Controller.Medicine" %>
<%@ page import="com.cureapp.Model.PrescriptionDao" %>
<%@ page import="com.cureapp.Controller.Prescription" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%-- Control flow:: view_patients -> prescription --%>
<jsp:include page="header.jsp"/>
<br/><br/><br/>
<%
	session = request.getSession();
	String utype = (String)session.getAttribute("utype");
	String uname = (String)session.getAttribute("uname");
	
	ServletContext svrCxt=getServletContext();
	String imgPath=svrCxt.getInitParameter("ImageFileFetch");
	String ingrPath=svrCxt.getInitParameter("IngrImageFileFetch");
	
	MedicineDao med=MedicineDao.getInstance();
	ArrayList<Medicine> medList=med.countRows();
	Iterator<Medicine> itr;
	itr=medList.iterator();
	if(utype.equals("DOCTOR") == false)
	{
		out.write("<div class='valid'></div>");
	}
	
%>
	
<div class="container-fluid">
<div class="row">
<div class="col">
<div class="alert alert-secondary" role="alert">
  Click the Done button after completion. 
  <a href="view_patients?done=1"><button class="btn btn-sm btn-outline-primary" style="float:right;">Done
  </button></a>
</div>
</div>
</div>
<div class="row">
<div class="col-md-6" >
        <div class="card">
            <div class="card-body">
            	<div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <center>
                           <h2>Medicine</h2>
                           <img src="img/medicines.png" class="img-fluid" width="125" height="125"/>
                        </center>
                    </div>
                </div>
    			<div class="row">
                    <div class="col">
                        <center>
						<img src="img/hr.png" class="img-fluid" width="95%"/>
						</center>
                    </div>
                </div>
                <div class="row">
                <div class="col" ng-controller="medicineController">
 
<table class="table table-responsive-lg table-hover display"  id="dtExample" >
<thead>
<tr>
	<th scope="col">S.No.</th>
	<th>Medicine Details</th>
	<th>Images</th>
	<th>Operations</th>
<tr>
</thead>
<% 
	int i=0;
	while(itr.hasNext())
	{ Medicine medi=(Medicine)itr.next();%>	
<tr>
<form action='viewthismedicine.jsp' method="post">
	<th scope="row"> <%= ++i %> </th>
	<td>
		<input type="hidden" name="inputMedName" value="<%= medi.getMedicineName() %>">
		<h4><b><%=medi.getMedicineName()%></b></h4>
		<b>Manufacturer Name: </b><%=medi.getManufacturerName()%><br/>
		<b>Net weight: </b><%= String.format("%.2f", medi.getNetWeight()) %> grams<br/>
		<b>Cost: </b>&#x20b9; <%= String.format("%.2f", medi.getCostPrice()) %><br/>
		<b>Stock Availability:</b> <%= medi.getStockCount() %>
	</td>
	<td align="right" class="img-wrapper">
		<a href="<%= imgPath + medi.getMedImagePath() %>">
			<img  src="<%=imgPath+medi.getMedImagePath()%>" class="img-fluid img-thumbnail" width="150px" height="auto" title="Medicine" alt="imagename">
		</a>
		<a href="<%= ingrPath + medi.getIngrImagePath() %>">
			<img  src="<%=ingrPath+medi.getIngrImagePath() %>" class="img-fluid img-thumbnail" width="150px" height="auto" title="Medicine Components" alt="Composition">
		</a>
	</td>
	<th scope="row">
	<button type='submit' formaction='add_prescription' class='btn btn-sm btn-success btn-block'>Prescribe</button>
	
	</th>
	</form>
</tr>


<%} %>
</table>
	</div>
	</div>
 		</div>
 		</div>
  	 </div>
  </div>
<div class="col-md-6">
 <div class="card">
            <div class="card-body">
            	<div class="container-fluid">
                <div class="row">
                    <div class="col">
                        <center>
                           <h2>Prescription List</h2>
                           <img src="img/prescribelist.png" class="img-fluid" width="125" height="125"/>
                        </center>
                    </div>
                </div>
    			<div class="row">
                    <div class="col">
                        <center>
						<img src="img/hr.png" class="img-fluid" width="95%"/>
						</center>
                    </div>
                </div>
                <div class="row">
                <%
                	String patientID = (String) session.getAttribute("patientID");
                	Prescription prescriptionList = PrescriptionDao.getInstance().retrievePrescription(patientID, uname);
                	itr = prescriptionList.getMedicineList().iterator();
                %>
                <div class="col">
 			<table class="table table-responsive-lg table-hover display" id="dtMaterialDesignExample" >
 			<thead class="thead-dark">
 			<tr>
 			<th scope="col">#</th>
 			<th scope="col">Medicine Name</th>
 			<th scope="col">Net Wgt.</th>
 			<th scope="col">Power</th>
 			<th scope="col">Mfg. Date</th>
 			<th scope="col">Expiry Date</th>
 			</tr>
 			</thead>
 			<tbody>
 			<%
 				i=1;
 				while(itr.hasNext())
 				{
 					Medicine thisMedicine = itr.next();
 			%>
 				<tr>
 				<td scope="row"><%= i++ %></td>
 				<td><%= thisMedicine.getMedicineName() %></td>
 				<td><%= thisMedicine.getNetWeight() %></td>
 				<td><%= thisMedicine.getPower() %></td>
 				<td><%= thisMedicine.getManufacturingDate() %></td>
 				<td><%= thisMedicine.getExpiryDate() %></td>
 				
 				</tr>
 			<%
 				}
 			%>
 			</tbody>
 			</table>
	</div>
	</div>
 		</div>
 		</div>
  	 </div>
</div>  
</div>
 </div> <!-- container fluid -->
    

	<br/><br/>
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