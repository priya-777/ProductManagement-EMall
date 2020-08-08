package com.EMall.Controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.EMall.Dao.getTablesJDBC;

/**
 * Servlet implementation class getDashBoard
 */
public class getDashBoard extends HttpServlet {
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
    	  out.println("</tr>");
    	  temp=0;
      }
out.close();
    }
	
    }

}
