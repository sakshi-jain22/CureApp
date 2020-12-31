<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CureApp</title>
	<!-- Custom CSS 
	<link rel='stylesheet' href='css/stylesheet.css'>
	<!-- Icon Link 
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">

<link rel="stylesheet" href=https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css>
<style>
	a:hover
	{
		background-color: #C0C0C0;
	}
</style>
</head>
<body class="bgstyle">
	<div>
         <nav class="navbar navbar-expand-lg fixed-top navbar-light bg-warning">
                <a class="navbar-brand" href="#">
                    <img src="img/bgCUREAPP.jpg" width="70" height="50" />
                    CureApp
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav nav-pills navbar-nav mr-auto" id="pills-tab-1" role="tablist">
                        <li class="nav-item active" role="presentation">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item active" role="presentation">
                            <a class="nav-link" href="AboutUs.jsp">About Us</a>
                        </li>
                        <li class="nav-item active" role="presentation">
                            <a class="nav-link" href="#">Terms</a>
                        </li>

                    </ul>
                    <ul class="nav nav-pills navbar-nav" id="pills-tab-2" role="tablist">
                        <li class="nav-item active" role="presentation">
                        	<a class="nav-link" href="ViewMedicine.jsp">View Medicine</a>
                        </li>
                        
                        <%	if(session.getAttribute("uname")==null) 
							{
						%>
                        <li class="nav-item active" role="presentation">
                        	<a class="nav-link" href="Login.jsp">Log In</a>
                        </li>
                        <%	}
							else 
							{ 
						%>
                        <li class="nav-item active" role="presentation">
                        	<a class="nav-link" href="setprofile.jsp">Hello ${uname}</a>
                        </li>
                        <li class="nav-item active" role="presentation">
                        	<a class="nav-link" href="logout.jsp">Log Out</a>
                        </li>
                        <%	} %>
                      </ul>
                 </div>

            </nav>
        </div>
        <br/>
</body>
</html>