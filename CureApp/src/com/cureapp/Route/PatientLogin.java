package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.PatientDao;

public class PatientLogin extends HttpServlet {

	private static final long serialVersionUID = 391386600201854419L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String username=(String)request.getParameter("username");
		String password=(String)request.getAttribute("password");
		request.removeAttribute("username");
		request.removeAttribute("password");
		
		HttpSession session = request.getSession();
		PatientDao patientData = PatientDao.getInstance();
		
		if(patientData.validateLogin(username, password))
		{
			session.setAttribute("utype", "PATIENT");
			session.setAttribute("uname", username);
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("Login.jsp");
		}
		
	}
}
