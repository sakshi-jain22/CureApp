package com.cureapp.Route;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cureapp.Controller.Address;
import com.cureapp.Controller.Doctor;
import com.cureapp.Model.DoctorDao;
import com.google.gson.Gson;

public class FetchDoctorServlet extends HttpServlet 
{
	private static final long serialVersionUID = 495242452249543317L;
	
	@Override
	public void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		StringBuilder sb = new StringBuilder();
        BufferedReader br = request.getReader();
        String str = null;
        while ((str = br.readLine()) != null) {
            sb.append(str);
        }
        JSONObject jsonObj = new JSONObject(sb.toString());
        String doctor = jsonObj.getString("doctor");
        
        response.setContentType("application/json");
        
        Doctor obj_doctorInstance = DoctorDao.getInstance().retrieveMyData(doctor);
        Gson gson = new Gson();
    	String jsonInString = gson.toJson(obj_doctorInstance);
    	response.getWriter().write(jsonInString);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		response.setContentType("text/html; charset=ISO-8859-1");
		PrintWriter out = response.getWriter();
		
		Doctor doctorInstance = new Doctor();
		String str_passwd = (String) request.getParameter("pswd");
		doctorInstance.setDoctorID((String) request.getParameter("dID"));
		doctorInstance.setName((String) request.getParameter("name"));
		doctorInstance.setPassword(str_passwd.toCharArray()); 
		doctorInstance.setSpecialization((String) request.getParameter("specialization"));
		doctorInstance.setQualifications((String) request.getParameter("qualifications"));
		doctorInstance.setContactNo((String) request.getParameter("contact"));
		doctorInstance.setHospitalName((String) request.getParameter("hname"));
		doctorInstance.setDocAddress(new Address((String) request.getParameter("hloc"), 
					(String) request.getParameter("hcity"), 
					(String)(request.getParameter("hstate") + "-" + request.getParameter("hpin"))));
		doctorInstance.setConsultationFees(Double.parseDouble(request.getParameter("cfees")));
		
		DoctorDao dao_doctorData = DoctorDao.getInstance();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("</head>");
		out.println("<body class='bgstyle'>");
		
		if(dao_doctorData.update(doctorInstance))
		{
			System.out.println("Updated Successfully");
			out.println("<div class='updatedDoctor'>");
		}
		else
		{
			System.out.println("Update Doctor Failed");
			out.println("<div class='updatedDoctorFailed'></div>");
		}
		
		out.println("<script src='https://code.jquery.com/jquery-3.5.1.js'></script>");
		out.println("<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>");
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js'></script>");
		out.println("<script src='fontawesome/js/all.js' ></script>");
		out.println("<script src='js/jqueryCode.js'></script>");
		out.println("</body>");
		out.println("</html>");
		out.close();	
	}
}
