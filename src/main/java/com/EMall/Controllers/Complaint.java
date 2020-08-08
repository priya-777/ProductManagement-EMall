package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.EMall.Dao.UpdateComplaint;

/**
 * Servlet implementation class Complaint
 */
public class Complaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		{
	      response.setContentType("text/html");
	      try{
	    	  String type=request.getParameter("type");
	    	  String Complaint=request.getParameter("complaint");
	    	  UpdateComplaint update=new UpdateComplaint();
	    	  HttpSession session = request.getSession(true);
	    	  String Uname=(String)session.getAttribute("Uname");
	    	  out.println(update.updateComplaint(Uname,type, Complaint));
	    	  
	    		out.close();
	      }
	      catch(Exception e)
	      {
	      out.println(e+"");
	      }

	      }
	}

}
