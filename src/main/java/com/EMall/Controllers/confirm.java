package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class confirm
 */
public class confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		{
	      response.setContentType("text/html");
	      try{
	      String Dates[]=request.getParameter("that").split("&");
	      HttpSession session = request.getSession(true);
	      String Spaces[]=(String[])session.getAttribute("space");
	      session.setAttribute("Dates", Dates);
	      double Rate=0;
	      if(Spaces[3].equals("Hour Wise"))
	      {
	      double time=(Double.parseDouble(request.getParameter("etime").substring(0,2))-Double.parseDouble(request.getParameter("stime").substring(0,2)));
	      double min=(Double.parseDouble(request.getParameter("etime").substring(3,5))-Double.parseDouble(request.getParameter("stime").substring(3,5)));
	      session.setAttribute("STime", request.getParameter("stime"));
	      session.setAttribute("ETime", request.getParameter("etime"));
	      Rate=(time+(min*0.01))*Double.parseDouble(Spaces[4]);
    	  session.setAttribute("Rate",Rate);
	      }
	      else if(Spaces[3].equals("Week Wise"))
	      {
	    	  float unit=Dates.length;
	    	  out.println(unit);
	    	  
	    	  Rate=Math.ceil((unit/7)*Float.parseFloat(Spaces[4]));
	    	  session.setAttribute("Rate",Rate);
	      }
	      else
	      {
	    	  Rate=Dates.length*Double.parseDouble(Spaces[4]);
	    	  session.setAttribute("Rate",Rate);
	      }
	      
//	      session.setMaxInactiveInterval(30);
	      RequestDispatcher rd1=request.getRequestDispatcher("confirm.jsp");
			rd1.include(request, response);
	      
			out.close();
	      }
	      catch(Exception e)
	      {
	      out.println(e+"");
	      }
	    }
		
	}

}
