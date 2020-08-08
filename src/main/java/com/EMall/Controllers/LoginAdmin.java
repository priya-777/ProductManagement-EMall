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


public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		int Id=Integer.parseInt(request.getParameter("Id"));
		String Password=request.getParameter("Password");
		HttpSession session = request.getSession(true);
		
		CheckAdmin c=new CheckAdmin();
		if(c.checkAdmin(Id, Password).charAt(0)=='s')
		{
		session.setAttribute("str", "&*^");
		RequestDispatcher rd=request.getRequestDispatcher("Frames.jsp");
		rd.include(request, response);
		}
		else
		{
			request.setAttribute("info", "Invalid Admin Id or Password");
			RequestDispatcher rd=request.getRequestDispatcher("LoginAdmin.jsp");
			rd.forward(request, response);
		}
	}
}
