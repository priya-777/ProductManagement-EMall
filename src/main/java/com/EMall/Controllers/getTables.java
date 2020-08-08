package com.EMall.Controllers;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EMall.Dao.getTablesJDBC;

import java.util.*;
/**
 * Servlet implementation class getTables
 */
public class getTables extends HttpServlet {
		   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
		    {
			PrintWriter out=response.getWriter();
			{
		      response.setContentType("text/html");
		      
		      getTablesJDBC get=new getTablesJDBC();
		      String[][] entries=get.getEntry();
		      int temp=0;
		      for(int i=0;i<entries.length;i++)
		      {
		    	  
		    	  out.println("<tr scope='row'>");
		    	  for(int j=0;j<entries[i].length;j++)
		    	  {
		    		  if(entries[i][j]!=null)
		    		  {
		    			  temp=1;
		    			  out.println("<td scope='col'>"+entries[i][j]+"</td>");
		    		  }
		    	  }
		    	  if(temp==1)
		    	  {
		    		  if(i==0)
				    	  out.println("<td><input type='radio' scope='col' name='optradio' value='"+entries[i][0]+"/"+entries[i][1]+"/"+entries[i][2]+"/"+entries[i][3]+"/"+entries[i][4]+"' checked />click</td>");
		    		  else
			    	  out.println("<td><input type='radio' scope='col' name='optradio' value='"+entries[i][0]+"/"+entries[i][1]+"/"+entries[i][2]+"/"+entries[i][3]+"/"+entries[i][4]+"' />click</td>");
		    	 
		    	  }
		    	  out.println("</tr>");
		    	  temp=0;
		      }
		out.close();
		    }
			
		    }

}
