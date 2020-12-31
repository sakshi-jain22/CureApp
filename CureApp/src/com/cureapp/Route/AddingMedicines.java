package com.cureapp.Route;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cureapp.Controller.Medicine;
import com.cureapp.Controller.Methods;
import com.cureapp.Model.MedicineDao;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,		// 2 MB
maxFileSize = 1024 * 1024 * 50,		// 50 MB
maxRequestSize = 1024 * 1024 * 200)		// 200 MB

public class AddingMedicines extends HttpServlet 
{
	private static final long serialVersionUID = 5369491002436617876L;

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
		
		ServletContext servCtx = getServletContext();
		String imgPath = servCtx.getInitParameter("ImageFile");
		String ingrPath = servCtx.getInitParameter("IngrImageFile");
		
		Part partImg = request.getPart("inputImg");
		Part partImgIngr = request.getPart("inputIngr");
		String imgFile = Methods.extractFileName(partImg);
		String savePathImg = imgPath + File.separator + imgFile;
		String ingrFile = Methods.extractFileName(partImgIngr);
		String savePathIngr = ingrPath + File.separator + ingrFile;
		/*File fileSaveDir =*/ new File(savePathImg);
		partImg.write(savePathImg + File.separator);
		/*fileSaveDir =*/ new File(savePathIngr);
		partImgIngr.write(savePathIngr + File.separator);
		
		Medicine newMedicine = new Medicine();
		newMedicine.setChemName(request.getParameter("cid"));
		newMedicine.setMedicineName(request.getParameter("inputMedName"));
		newMedicine.setBarCodeNumber(request.getParameter("inputBarCode"));
		newMedicine.setBatchNo(request.getParameter("inputBatchNum"));
		newMedicine.setNetWeight(Double.parseDouble(request.getParameter("inputNetWgt")));
		newMedicine.setPower(Float.parseFloat(request.getParameter("inputPower")));
		newMedicine.setManufacturerName(request.getParameter("inputMftName"));
		newMedicine.setManufacturingDate(request.getParameter("inputMfgDate"));
		newMedicine.setExpiryDate(request.getParameter("inputExpDate"));
		newMedicine.setCostPrice(Float.parseFloat(request.getParameter("inputPrice")));
		newMedicine.setMedImagePath(imgFile);
		newMedicine.setIngrImagePath(ingrFile);
		newMedicine.setStockCount(Integer.parseInt(request.getParameter("inputStock")));
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
		out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
		out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
		out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
		out.println("<body class='bgstyle'>");
		if(Methods.checkDates(newMedicine.getManufacturingDate(), newMedicine.getExpiryDate()))
		{
			MedicineDao dao_medicineData = MedicineDao.getInstance();			
			if(dao_medicineData.addMedicine(newMedicine))
				out.println("<div class='added'>");
			else
				out.println("<div class='notadded'>");
			//System.out.println(newMedicine.toString());
		}
		else
		{
			throw new IOException("Error!!!...Expiry Date Entered is before that of Manufacturing Date");
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
