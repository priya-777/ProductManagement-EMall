package com.EMall.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AddNewSpace {
		public String addNewSpace(String SpaceName,String Duration,String RentType,String CostPerUnit)
		{
	int count=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
		String query1="select count(*) from BusinessSpaces";
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery(query1);
		while(rs.next())
		{
		count=rs.getInt("count(*)");
		}
		count++;
		
		if(!checkExistingDetails(SpaceName,Duration,RentType,CostPerUnit))
		{
		String mainquery="insert into BusinessSpaces values(?,?,?,?,?)";
		PreparedStatement mainstmt=con.prepareStatement(mainquery);
		mainstmt.setInt(1,count);
		mainstmt.setString(2,SpaceName);
		mainstmt.setString(3,Duration);
		mainstmt.setString(4,RentType);
		mainstmt.setDouble(5, Double.parseDouble(CostPerUnit));
		mainstmt.executeUpdate();
		return "success";
		}
		con.close();  
		}
		
		catch(Exception e){ 
			return e+"";
			} 
		
			return "failure";
		}

		private Boolean checkExistingDetails(String SpaceName, String duration, String rentType, String costPerUnit) {
			try{
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Virtusa","root","jb@772000");  
				String mainquery="select count(*) from BusinessSpaces where Businessspace='"+SpaceName+"' and Duration='"+duration+"' and renttype='"+rentType+"' and costperunit="+costPerUnit;
				PreparedStatement mainstmt=con.prepareStatement(mainquery);
				ResultSet i=mainstmt.executeQuery();
				int count=0;
				if(i.next())
				count=i.getInt("count(*)");
				
				if(count>0)
					return true;
				con.close();  
				}
				
				catch(Exception e){ 
					return false;
				}
				
					return false;
		}
}
