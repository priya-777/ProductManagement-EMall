package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EMall.Dao.UpdateCustomers;

/**
 * Servlet implementation class SignUp
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String FullName=request.getParameter("FullName");
		String UserName=request.getParameter("UserName");
		String Email=request.getParameter("Email");
		String PhoneNumber=request.getParameter("PhoneNumber");
		String Password=request.getParameter("Password");
		
		UpdateCustomers update=new UpdateCustomers();
		if(update.updateCDetails(FullName,UserName,Email,PhoneNumber,Password).contains("Duplicate entry"))
		{
			out.println("<script>alert('UserName is Already Taken'); location='SignUp.jsp';</script>");
		}
		else{
		
		request.setAttribute("LoginMsg", "Login with your registered ID");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		}
	}

}
