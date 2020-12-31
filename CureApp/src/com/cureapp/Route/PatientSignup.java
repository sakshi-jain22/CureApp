package com.cureapp.Route;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Patient;
import com.cureapp.Model.PatientDao;

public class PatientSignup extends HttpServlet 
{
	private static final long serialVersionUID = 18765432169894L;
	PatientDao patientDao;

	public void init()
	{
		patientDao=PatientDao.getInstance();
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out=response.getWriter();
		String name=request.getParameter("FullName");
		String username=request.getParameter("userID");
		String passwrd=request.getParameter("passwrd");
		String dob=request.getParameter("dob");
		String phone=request.getParameter("phonenumber");
		String locality=request.getParameter("locality");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		
		try 
		{
			if(name.equalsIgnoreCase("")||username.equals("")||passwrd.equals("")||dob.equals("")|| locality.equals("")||
					city.equals("")||state.equals("")||phone.equals(""))
			{
				System.err.println("form details empty!");
				response.sendRedirect("Signup.jsp");
			}
			else
			{
				Patient p=new Patient();
				Address addr=new Address();
				p.setName(name);
				p.setPatientid(username);
				p.setPassword(passwrd.toCharArray());
				p.setDOB(dob);
				
				addr.setLocality(locality);
				addr.setCity(city);
				addr.setState(state);
					
				p.setAddress(addr);
				p.setContact(phone);
				
				out.println("<html>");
				out.println("<head>");
				out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
				out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
				out.println("</head>");
				out.println("<body class='bgstyle'>");
				
				try 
				{
					if(patientDao.addPatient(p))
					{
						System.out.println("You have successfully registered");
						out.println("<div class='create'></div>");
					}
					else
					{
						System.out.println("NOT created");
						out.println("<div class='noCreate'></div>");
					}
					out.println("<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>");
					out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>");
					out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>");
					out.println("<script src='js/jqueryCode.js'></script>");
					out.println("</body>");
					out.println("</html>");
					out.close();
				}
				catch(SQLException ex)
				{
					ex.printStackTrace();
				}
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		//response.sendRedirect("Login.jsp");
	}
}
