package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.PatientDao;

public class SelectDoctorAssignment extends HttpServlet 
{

	private static final long serialVersionUID = -3437723478470641836L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{

		HttpSession hs_session = request.getSession();
		String utype = (String) hs_session.getAttribute("utype");
		if(utype == null)
		{
			System.out.println("Null Pointer Exception bachali");
		}
		else if(utype.equals("PATIENT"))
		{
			String doctorID = request.getParameter("DocID");
			String patientID = (String) hs_session.getAttribute("uname");
			PatientDao dao_assign = PatientDao.getInstance();
			if(dao_assign.assignDoctor(doctorID, patientID))
			{
				request.setAttribute("status", "success");
			}
			else
				request.setAttribute("status", "unsuccess");
		}
		
		request.getRequestDispatcher("redirection.jsp").forward(request, response);
	}
}
