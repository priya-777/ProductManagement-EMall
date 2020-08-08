package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.EMall.Dao.CheckAdmin;


public class LoginCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		String Uname=request.getParameter("Uname");
		String Password=request.getParameter("Password");
		HttpSession session = request.getSession(true);
		session.setAttribute("Uname", Uname);
		session.setAttribute("Password", Password);
		session.setAttribute("str", Password);
		if(!Uname.equals("")||!Password.equals(""))
		{
		CheckAdmin c=new CheckAdmin();
		if(c.checkCustomer(Uname, Password).equals("success"))
		{
		RequestDispatcher rd=request.getRequestDispatcher("CustomerFrames.jsp");
		rd.forward(request, response);
		}
		else
		{
			request.setAttribute("info", "Invalid UserName or Password");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		}
		else
			out.println("Please Login");
	}


}
