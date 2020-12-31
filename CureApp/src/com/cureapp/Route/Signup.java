package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Signup extends HttpServlet 
{
	private static final long serialVersionUID = 3507260611332803322L;
	
	/**
	 * @param request   an {@link HttpServletRequest} object that
     *                  contains the request the client has made
     *                  of the servlet
     *
     * @param response  an {@link HttpServletResponse} object that
     *                  contains the response the servlet sends
     *                  to the client
     *
     * @exception IOException   if an input or output error is
     *                              detected when the servlet handles
     *                              the GET request
     *
     * @exception ServletException  if the request for the GET
     *                                  could not be handled
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String str_userType = request.getParameter("usertype");
		String page = "Login.jsp";
		
		if(str_userType.equals("Doctor"))
			page = "doctorSignup.jsp";
		else if(str_userType.equals("Patient"))
			page = "patientSignupPage.jsp";
		else
			System.out.println("Line no 44 reached");
		
		response.sendRedirect(page);
	}
}
