package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cureapp.Controller.Chemist;
import com.cureapp.Model.ChemistDao;

public class ChemistAuthentication extends HttpServlet
{
	private static final long serialVersionUID = 8023825252625780242L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession hs_session = request.getSession();
		Chemist chem_log = new Chemist((String) request.getParameter("username"), (String) request.getParameter("password"));
		ChemistDao dao_chemistData = ChemistDao.getInstance();
		
		if(dao_chemistData.authentication(chem_log))
		{
			hs_session.setAttribute("utype", "CHEMIST");
			hs_session.setAttribute("uname", chem_log.getUsername());
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("chemistLogin.jsp");
		}
	}
}
