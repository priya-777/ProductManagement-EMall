package com.EMall.Controllers;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.EMall.Dao.CheckDayJDBC;

/**
 * Servlet implementation class CheckDay
 */
public class CheckDay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		try{
			response.setContentType("text/html");
			HttpSession session = request.getSession(true);
			String a[]=(String[])session.getAttribute("space");
			String EDate=request.getParameter("updatednow");
			CheckDayJDBC check=new CheckDayJDBC();
			out.println(check.checkEnteredDay(a,EDate));
		}
		catch(Exception e)
		{
			out.println(e+"");
		}
	}
}
