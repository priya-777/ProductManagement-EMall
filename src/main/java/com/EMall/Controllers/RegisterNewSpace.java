package com.EMall.Controllers;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EMall.Dao.AddNewSpace;

/**
 * Servlet implementation class RegisterNewSpace
 */
public class RegisterNewSpace extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
	      try{
		String SpaceName=request.getParameter("SpaceName");
		String Duration=request.getParameter("Duration");
		String RentType=request.getParameter("RentType");
		String CostPerUnit=request.getParameter("CostPerUnit");
		AddNewSpace add=new AddNewSpace();
		out.println(add.addNewSpace(SpaceName, Duration, RentType, CostPerUnit));
	      }
	      catch(Exception e)
	      {
	    	  out.println(e+"");
	      }
	}

}
