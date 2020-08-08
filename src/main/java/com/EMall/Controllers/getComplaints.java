package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EMall.Dao.getTablesJDBC;
public class getComplaints extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		try{
	      response.setContentType("text/html");
	      
	      getTablesJDBC get=new getTablesJDBC();
	      ArrayList<ArrayList<String>> complaints=get.getComplaints();
	      for(ArrayList<String> a:complaints)
	      {
	    	  out.println("<div class='badge badge-light'>");
	    	  out.println("<div class='btn btn-primary'>"+a.get(0)+" <div class='badge badge-secondary'>"+a.get(1)+"</div></div><br><br>");
	    	  out.println("<textarea class='btn btn-light' style='width:80em; height:300px'>");
	    	  out.println(a.get(2));
	    	  out.println("</textarea>");
	    	  out.println("</div><br><br>");
	      }
	      
		}
		catch(Exception e){
		out.println(e+"");}
	}

}
