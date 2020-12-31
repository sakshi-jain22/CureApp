package com.cureapp.Route;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.DoctorDao;

public class RedirectToView extends HttpServlet 
{
	private static final long serialVersionUID = -170330860224609338L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		String usertype = (String) session.getAttribute("utype");
		String doctorID = (String) session.getAttribute("uname");
		String patientID = (String) session.getAttribute("patientID");
		String done = request.getParameter("done");
		
		if(usertype.equals("DOCTOR") == false)
			throw new ServletException("Unauthorized Access to Servlet");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("<body class='bgstyle'>");
		
		DoctorDao doctorInstance = DoctorDao.getInstance();
		/*
		if(done!=null && done.equals("1"))
		{
			out.println("HERE 1");
			doctorInstance.prescriptionDone(patientID, doctorID);
			session.removeAttribute("patientID");
		}
		else
		{*/
			out.println("HERE 2");
			doctorInstance.allottedPrescription(patientID, doctorID);
			session.removeAttribute("patientID");
		//}
		
		out.println("<script src='https://code.jquery.com/jquery-3.5.1.js'></script>");
		out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>");
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>");
		out.println("<script src='fontawesome/js/all.js' ></script>");
		out.println("<script src='js/jqueryCode.js'></script>");
		out.println("</body>");
		out.println("</html>");
		response.sendRedirect("view_patients.jsp");
		out.close();
	}
}
