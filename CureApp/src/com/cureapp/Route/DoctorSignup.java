package com.cureapp.Route;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Doctor;
import com.cureapp.Model.DoctorDao;

/** 
 * Servlet to handle signup module for doctor
 * 
 */
public class DoctorSignup extends HttpServlet
{
	private static final long serialVersionUID = 1616733448080330269L;
	
	/**
	 * @param request   an {@link HttpServletRequest} object that
     *                  contains the request the client has made
     *                  of the servlet
     *
     * @param response  an {@link HttpServletResponse} object that
     *                  contains the response the servlet sends
     *                  to the client
     *
     * @exception IOException   	if an input or output error is
     *                              detected when the servlet handles
     *                              the request
     *
     * @exception ServletException  	if the request for the POST
     *                                  could not be handled
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		PrintWriter out = response.getWriter();
		Doctor doc_signup = new Doctor();
		String str_passwd = (String) request.getParameter("pswd");
		doc_signup.setDoctorID((String) request.getParameter("docID"));
		doc_signup.setName((String) request.getParameter("name"));
		doc_signup.setPassword(str_passwd.toCharArray()); 
		doc_signup.setSpecialization((String) request.getParameter("specialization"));
		doc_signup.setQualifications((String) request.getParameter("qualifications"));
		doc_signup.setContactNo((String) request.getParameter("contact"));
		doc_signup.setHospitalName((String) request.getParameter("hname"));
		doc_signup.setDocAddress(new Address((String) request.getParameter("hloc"), 
					(String) request.getParameter("hcity"), 
					(String)( request.getParameter("hstate") + "-" + request.getParameter("hpin"))));
		doc_signup.setConsultationFees(Double.parseDouble(request.getParameter("cfees")));
		
		DoctorDao dao_doctorData = DoctorDao.getInstance();
		
		out.println("<html>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("<body class='bgstyle'>");
		out.println("<div class='container'>");
		out.println("<div class='row'>");
		out.println("<div class='col-sm-7' align='right'>");
		out.println("<div class='loader'>"
					+ "<div class='dot d1'></div>"
					+ "<div class='dot d2'></div>"
					+ "<div class='dot d3'></div>"
					+ "<div class='dot d4'></div>"
					+ "<div class='dot d5'></div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
		out.println("</div>");
		out.println("<br><br><br><br>");
		
		if(dao_doctorData.register(doc_signup))
		{
			System.out.println("Signup Successful");
			out.println("<div class='create'>");
		}
		else
		{
			System.out.println("Signup not created");
			out.println("<div class='noCreate'></div>");
		}
		
		out.println("<br><br>");
		out.println("<script src='https://code.jquery.com/jquery-3.5.1.js'></script>");
		out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>");
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>");
		out.println("<script src='fontawesome/js/all.js' ></script>");
		out.println("<script src='js/jqueryCode.js'></script>");
		out.println("</body>");
		out.println("</html");
		out.close();
	}
}
