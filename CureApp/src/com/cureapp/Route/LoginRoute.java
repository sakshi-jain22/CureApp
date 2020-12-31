package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginRoute extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	/**
	 * @param request   the {@link HttpServletRequest} object that
     *                  contains the request the client made of
     *                  the servlet
     *
     * @param response  the {@link HttpServletResponse} object that
     *                  contains the response the servlet returns
     *                  to the client
   	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		String str_userType = request.getParameter("user");
		String str_userName = request.getParameter("username");
		String str_pswd = request.getParameter("password");
		
		try
		{
			if(str_userType.equals("") || str_userName.equals("") || str_pswd.equals(""))
			{
				System.err.println("Login details empty!");
				response.sendRedirect("Login.jsp");
			}
			else
			{
				request.setAttribute("username", str_userName);
				request.setAttribute("password", str_pswd);
				
				if(str_userType.equals("Doctor"))
				{
					RequestDispatcher obj_rd = request.getRequestDispatcher("loginAsDoctor");
					obj_rd.forward(request, response);	
				}
				else if(str_userType.equals("Patient"))
				{
					RequestDispatcher obj_rd = request.getRequestDispatcher("loginAsPatient");
					obj_rd.forward(request, response);	
				}
			}
		} 
		catch (ServletException | IOException obj_e) 
		{
			obj_e.printStackTrace();
		}
	}
}
