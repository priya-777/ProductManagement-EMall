package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SpaceChoose
 */
public class SpaceChoose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
    {
	PrintWriter out=response.getWriter();
	{
      response.setContentType("text/html");
      
      String a[]=request.getParameter("optradio").split("/");
      HttpSession session = request.getSession(true);
      session.setAttribute("space", a);
      RequestDispatcher rd1=request.getRequestDispatcher("BookAvailableSpace.jsp");
		rd1.include(request, response);

out.close();
    }
	
    }

}
