package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.DoctorDao;

public class AssignAppointment extends HttpServlet 
{
	private static final long serialVersionUID = 6042914511859039159L;
	
	/**
	 * @param request   the {@link HttpServletRequest} object that
     *                  contains the request the client made of
     *                  the servlet
     *
     * @param response  the {@link HttpServletResponse} object that
     *                  contains the response the servlet returns
     *                  to the client
     *
     * @exception IOException   if an input or output error occurs
     *                              while the servlet is handling the
     *                              HTTP request
     *
     * @exception ServletException  if the HTTP request
     *                                  cannot be handled
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String patientID = (String)request.getParameter("PatID");
		HttpSession session = request.getSession();
		String utype = (String)session.getAttribute("utype");
		String uname = (String)session.getAttribute("uname");
		
		
		
		if(utype.equals("DOCTOR"))
		{
			DoctorDao doctorDaoInstance = DoctorDao.getInstance();
			
			if(doctorDaoInstance.assignAppointment(patientID, uname))
			{
				session.setAttribute("patientID", patientID);
				RequestDispatcher rd = request.getRequestDispatcher("ChatWindow.jsp");
				rd.forward(request, response);
			}
			else
				response.sendRedirect("view_patients.jsp");
		}
		else
			response.sendRedirect("logout.jsp");
	}
}
