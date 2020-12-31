package com.cureapp.Route;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import com.cureapp.Controller.Chemist;
import com.cureapp.Controller.Methods;

/**
 * Servlet Filter implementation class ChemistLoginFilter
 */
@WebFilter("/chemlogin")
public class ChemistLoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public ChemistLoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		Chemist chemistFilterData = new Chemist((String) request.getParameter("username"), (String) request.getParameter("password"));
		if(chemistFilterData.getUsername().equals("chemist@cureApp") && Methods.charToString(chemistFilterData.getPasswd()).equals("Pswd12345") )
			chain.doFilter(request, response);
		else
		{
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<link rel='stylesheet'	href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>");
			out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css'>");
			out.println("<link rel='stylesheet' href='fontawesome/css/all.css'>");
			out.println("<link rel='stylesheet' href='css/stylesheet.css'>");
			out.println("<body class='bgstyle'>");
			out.println("<br><br><br>");
			
			out.println("<div class='chemist'></div>");
			out.println("<br><br>");
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

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
