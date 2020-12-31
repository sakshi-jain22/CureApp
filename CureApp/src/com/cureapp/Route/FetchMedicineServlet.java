package com.cureapp.Route;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.cureapp.Controller.Medicine;
import com.cureapp.Model.MedicineDao;
import com.google.gson.Gson;


public class FetchMedicineServlet extends HttpServlet
{
	private static final long serialVersionUID = -1058398708211236429L;
	
	/*
	* @param request   an {@link HttpServletRequest} object that
     *                  contains the request the client has made
     *                  of the servlet
     *
     * @param response  an {@link HttpServletResponse} object that
     *                  contains the response the servlet sends
     *                  to the client
     *
     * @exception IOException   if an input or output error is
     *                              detected when the servlet handles
     *                              the GET request
     *
     * @exception ServletException  if the request for the GET
     *                                  could not be handled
     *
     * @see javax.servlet.ServletResponse#setContentType
     */
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
    	response.addHeader("Access-Control-Allow-Origin","*");
    	StringBuilder sb = new StringBuilder();
        BufferedReader br = request.getReader();
        String str = null;
        while ((str = br.readLine()) != null) {
            sb.append(str);
        }
        JSONObject jObj = new JSONObject(sb.toString());
        String medicine = jObj.getString("medicine");
    	
    	response.setContentType("application/json");
    	
    	Medicine obj_medicine = MedicineDao.getInstance().getMedicine(medicine);
    	Gson gson = new Gson();
    	String jsonInString = gson.toJson(obj_medicine);
    	response.getWriter().write(jsonInString);
    	
    }
    
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
		response.setContentType("text/html; charset=ISO-8859-1");
		PrintWriter out = response.getWriter();
		Medicine fetchMedicine = new Medicine();
		fetchMedicine.setMedicineName(request.getParameter("medname"));
		fetchMedicine.setChemName(request.getParameter("cid"));
		fetchMedicine.setBarCodeNumber(request.getParameter("inputBarCode"));
		fetchMedicine.setBatchNo(request.getParameter("inputBatchNum"));
		fetchMedicine.setNetWeight(Double.parseDouble(request.getParameter("inputNetWgt")));
		fetchMedicine.setPower(Float.parseFloat(request.getParameter("inputPower")));
		fetchMedicine.setManufacturerName(request.getParameter("inputMftName"));
		fetchMedicine.setCostPrice(Float.parseFloat(request.getParameter("inputPrice")));
		fetchMedicine.setStockCount(Integer.parseInt(request.getParameter("inputStock")));
		fetchMedicine.setManufacturingDate(request.getParameter("inputMfgDate"));
		fetchMedicine.setExpiryDate(request.getParameter("inputExpDate"));
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("</head>");
		out.println("<body class='bgstyle'>");
		
		MedicineDao medicineDaoInstance = MedicineDao.getInstance();
		if(medicineDaoInstance.updateMedicineMethod(fetchMedicine))
		{
			System.out.println("Medicine Updated");
			out.println("<div class='updatedMedicine'>");
		}
		else
		{
			System.out.println("Medicine Not Updated");
			out.println("<div class='notUpdatedMedicine'>");
		}
		
		out.println("</div>");
		out.println("<br><br>");
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
