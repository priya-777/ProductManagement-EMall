package com.EMall.Controllers;

import java.io.*;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.EMall.Dao.UpdateBookingJDBC;

public class UpdateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      PrintWriter out=response.getWriter();
	      response.setContentType("text/html");
	      try{
	      HttpSession session = request.getSession(true);
	      String space[]=(String[])session.getAttribute("space");
	      String Dates[]=(String[])session.getAttribute("Dates");
	      String Uname=(String)session.getAttribute("Uname");
	      String STime=(String)session.getAttribute("STime");
	      String ETime=(String)session.getAttribute("ETime");
	      Double Rate=(Double)session.getAttribute("Rate");
	      UpdateBookingJDBC update=new UpdateBookingJDBC();
	      if(STime!=null)
	      {
	      out.println(update.updateBooking(Uname, space, Dates, Rate, STime, ETime));
	      }
	      else
	      {
	    	  String count=update.updateBooking(Uname, space, Dates,Rate);
	    	  out.println(count);
	      }
			out.close();
	      }
	      catch(Exception e){
	      out.println(e+"");
	      }
	}

}
