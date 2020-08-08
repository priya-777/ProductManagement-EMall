package com.EMall.Dao;

import java.sql.*;
import java.util.*;

public class getTablesJDBC {
	    static Set<Integer> Key=new HashSet<Integer>();
	    static String[][] avail=new String[100][5];
	    static String id[]=new String[20];
	    public String[][] getEntry()
	    {
	        try{
	        	Class.forName("com.mysql.jdbc.Driver");  
	    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");
	            String query="select * from BusinessSpaces";
	            Statement stmt=con.createStatement();
	            ResultSet availability=stmt.executeQuery(query);
	            int i=0,j=0;
	            
	            while(availability.next())
	            {
	            	avail[i][j]=availability.getString("space_id");
	            	j++;
	            	avail[i][j]=availability.getString("BusinessSpace");
	            	j++;
	            	avail[i][j]=availability.getString("Duration");
	            	j++;
	            	avail[i][j]=availability.getString("Renttype");
	            	j++;
	            	avail[i][j]=availability.getString("Costperunit");
	            	
//	              if(!Key.contains(id))
//	              {
//	            	  avail[i].add(id);
//	            	  
//	            	  
//	            	  
//	            	  avail[i].add(availability.getDouble("Costperunit"));
//	            	  i++;
//	            	  Key.add(availability.getInt("space_id"));
//	              }
	            	j=0;
	            	i++;
	            }
	            con.setAutoCommit(true);
	            con.close();
	            return avail;
	        }
	        catch(Exception e){
	           return avail;
	        }
	    }
	    ArrayList<ArrayList<String>> com= new ArrayList<ArrayList<String>>();
		public ArrayList<ArrayList<String>> getComplaints() {
			try{
	        	Class.forName("com.mysql.jdbc.Driver");  
	    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");
	            String query="select * from complaints";
	            Statement stmt=con.createStatement();
	            ResultSet complaints=stmt.executeQuery(query);
	            while(complaints.next())
	            {
	            	ArrayList<String> temp=new ArrayList<String>();
	            	temp.add(complaints.getString("Uname"));
	            	temp.add(complaints.getString("type"));
	            	temp.add(complaints.getString("Complaint"));
	            	com.add(temp);
	            }
	           
			}
			catch(Exception e){
		           return com;
		        }
			return com;
		}

}
