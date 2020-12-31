package com.cureapp.Route;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.PrescriptionDao;

public class AddPrescription extends HttpServlet 
{
	private static final long serialVersionUID = -1539328047047801819L;

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html; charset=ISO-8859-1");
		
		String medicineName = request.getParameter("inputMedName");
		HttpSession session = request.getSession();
		String usertype = (String) session.getAttribute("utype");
		String doctorID = (String) session.getAttribute("uname");
		String patientID = (String) session.getAttribute("patientID");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("<body class='bgstyle'>");
		if(usertype.equals("DOCTOR"))
		{
			PrescriptionDao prescribeMedicine = PrescriptionDao.getInstance();
			if(prescribeMedicine.addPrescription(patientID, doctorID, medicineName))
			{
				System.out.println("DONE");
				out.println("<div class='prescribed'></div>");
			}
			else
			{
				System.out.println("NOT DONE");
				out.println("<div class='notprescribed'></div>");
			}
		}
		
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
