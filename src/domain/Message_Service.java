package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class Message_Service {
		//his id,my message
		public void set(String id,String message)
		{
			try{
			  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
			  Statement stmt=con.createStatement();  
			  ResultSet rs=null;
			  rs=stmt.executeQuery("select * from messagecenter where id='"+"'");
			  String before=null;
			  if(rs.next())
			  {
				  before=rs.getString("message");
			  }
			  before=before+message+"##";
			  stmt.executeUpdate("update messagecenter set message='"+before+"' where id='"+id+"'");
			  con.close();
			}catch (SQLException e) {
			    // TODO Auto-generated catch block
			    e.printStackTrace();
			}
		}
		
		public String get(String id)
		{
			String message=null;
			try{
				  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fpdb","fp_user","123456");
				  Statement stmt=con.createStatement();  
				  ResultSet rs=null;
				  rs=stmt.executeQuery("select * from messagecenter where id='"+id+"'");
				  if(rs.next())
				  {
					  message=rs.getString("message");
					  System.out.println(message);
				  }
				  con.close();
				}catch (SQLException e) {
				    // TODO Auto-generated catch block
				    e.printStackTrace();
				}
			return message;
		}
}
