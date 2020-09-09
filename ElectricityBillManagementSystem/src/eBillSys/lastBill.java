package eBillSys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lastBill
 */
@WebServlet("/lastBill")
public class lastBill extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String m= request.getParameter("meterno");
		String c = request.getParameter("cycle");
		
		String sql = "select con from Consumption where meterNo="+m+" and cycle="+c;
		String sql2 = "select * from Customers where meterNo="+m;
		String url = "jdbc:mysql://localhost:3306/anshu";
		String username = "root";
		String password = "1234";
		Statement st = null;
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			

			 con = DriverManager.getConnection(url,username,password);
			//con;
			st=con.createStatement();
		  //  PreparedStatement st = con.prepareStatement(sql);
		   // st.setString(1,m);
		  //  st.setNString(2, c);
		    
		    ResultSet rs = st.executeQuery(sql);
		    
		    PrintWriter out = response.getWriter();
		    //out.print(rs.getString("con"));
		    rs.next();
		    int i = Integer.parseInt(rs.getString("con"));
		    double j = i*5 + 100 +190;
		    j=j + 0.18*j;
		    
		    
		    
		    
		    rs =  st.executeQuery(sql2);
		    rs.next();
		    out.print(" DEFCON POWER LIMITED \n Meter Number: "+m+"\n Meter Location: "+rs.getString("location")+"\n Customer Name: "+rs.getString("name")+"\n Customer Address: "+rs.getString("addr")+"\n state: "+rs.getString("st")+"\n City: "+rs.getString("ct")+"\n Customer Email: "+rs.getString("email")+"\n Customer Contact: "+rs.getString("mob")+"\n");
		    //out.print("customers name: "+rs.getString("name"));
		    out.print(" Number of Units Consumed :"+i +"\n Bill Amount for Cycle: "+c+" is Rs. "+j+"\n Amount Payable after Due Date: "+ (j+j*.10));
		   // System.out.print(rs.getString("con"));
			
		    st.close();
		    con.close();
		}catch(Exception e) {
			PrintWriter out = response.getWriter();
		    
		    out.print("No Record Found !!!");
			e.printStackTrace();
		
			
				
		}
		/*PrintWriter out = response.getWriter();
		 
		out.print(m+"       "+c);*/
	}

}
