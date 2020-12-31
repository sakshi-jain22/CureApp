package com.cureapp.Route;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cureapp.Model.MedicineDao;

public class DeleteMedicine extends HttpServlet 
{
	private static final long serialVersionUID = 7781368561828359800L;

	/**
	 * @param request   an {@link HttpServletRequest} object that
     *                  contains the request the client has made
     *                  of the servlet
     *
     * @param response  an {@link HttpServletResponse} object that
     *                  contains the response the servlet sends
     *                  to the client
     *
     * @exception IOException   	if an input or output error is
     *                              detected when the servlet handles
     *                              the request
     *
     * @exception ServletException  	if the request for the POST
     *                                  could not be handled
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		String medicine = request.getParameter("inputMedName");
		MedicineDao daoElementMedicine = MedicineDao.getInstance();
		
		if(daoElementMedicine.deleteMedicine(medicine))
		{
			System.out.println("deleted");
		}
		
		response.sendRedirect("ViewMedicine.jsp");
	}
}
