package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewPrescriptionRoute extends HttpServlet 
{
	private static final long serialVersionUID = 5301125484508103502L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		String patID = request.getParameter("PatID");
		session.setAttribute("patientID", patID);
		response.sendRedirect("prescription.jsp");
	}
}
