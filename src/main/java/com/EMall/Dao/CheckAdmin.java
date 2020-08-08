package com.EMall.Dao;

import java.sql.*;  

public class CheckAdmin {

	public String checkAdmin(double id,String Password)
	{
		int f=0;
		try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from AdminInfo");  
		
		while(rs.next()){
		if(rs.getDouble("UName")==id && rs.getString("Password").equals(Password))
		{	
			f=1;
			break;
		}
		}
		con.close();  
		}
		
		catch(Exception e){ 
			return e+"";
			} 
		
		if(f==1)
			return "success";
		
		return "Failure";
	}    
	public String checkCustomer(String Uname,String Password)
	{
		
		int f=0;
		try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from Customer");  
		
		while(rs.next()){
		if(rs.getString("username").equals(Uname) && rs.getString("password").equals(Password))
		{	
			f=1;
			break;
		}
		}
		con.close();  
		}
		
		catch(Exception e){ 
			return e+"";
			} 
		
		if(f==1)
			return "success";
		
		return "Failure";
	}    
}
