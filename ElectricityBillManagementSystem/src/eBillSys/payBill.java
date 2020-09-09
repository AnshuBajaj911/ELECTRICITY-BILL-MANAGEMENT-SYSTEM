package eBillSys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class payBill
 */
@WebServlet("/payBill")
public class payBill extends HttpServlet {
	 public static int ccc=0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("mnumber");
		String cc = request.getParameter("cycle");
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/anshu";
		//String database = "anshu";
		String userid = "root";
		String password = "1234";
		PrintWriter out = response.getWriter();
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		
	
		try
		{
		Class.forName(driver);
		connection = DriverManager.getConnection(connectionUrl,userid,password);
		String sql="Update Consumption set status='Paid' where meterNo="+id+" and cycle="+cc;
		statement = connection.prepareStatement(sql);
				
		int i = statement.executeUpdate(sql);
		
		
		if(i > 0)
		{
		//out.print("Record Updated Successfully");
			ccc=1;
		response.sendRedirect("welcomePage.jsp");
		}
		else
		{ ccc=0;
		out.print("There is a problem in updating Record.");
		}
		}
		catch(Exception sql)
		{
		request.setAttribute("error", sql);
		out.println(sql);
		}
		
		
	}

}
