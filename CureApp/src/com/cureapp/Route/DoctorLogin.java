package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Model.DoctorDao;

public class DoctorLogin extends HttpServlet 
{
	private static final long serialVersionUID = 391386600201854419L;

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
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String str_uname = (String) request.getAttribute("username");
		String str_password = (String) request.getAttribute("password");
		request.removeAttribute("username");
		request.removeAttribute("password");
		
		HttpSession hs_session = request.getSession();
		DoctorDao dao_doctorData = DoctorDao.getInstance();
		
		if(dao_doctorData.validateLogin(str_uname, str_password))
		{
			hs_session.setAttribute("utype", "DOCTOR");
			hs_session.setAttribute("uname", str_uname);
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("Login.jsp");
		}
	}
}
