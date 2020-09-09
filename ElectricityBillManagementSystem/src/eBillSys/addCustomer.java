package eBillSys;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addCustomer
 */
@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
	public static int i = 0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{String meterNo = request.getParameter("meterno");
		String name = request.getParameter("cname");
		String add = request.getParameter("caddress");
		String sta = request.getParameter("state");
		String ct = request.getParameter("city");
		String email = request.getParameter("cemail");
		String mob= request.getParameter("cphno");
		String location = request.getParameter("loc");
		//PrintWriter out = response.getWriter();
		
		
		
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/anshu", "root", "1234");
		Statement st=conn.createStatement();
		
		st.executeUpdate("insert into Customers values('"+meterNo+"','"+name+"','"+add+"','"+sta+"','"+ct+"','"+email+"','"+mob+"','"+location+"')"); 
		st.close();
		conn.close();
		i=1;
		response.sendRedirect("welcomePage.jsp");
		
    //System.out.println("meterno = "+meterNo+" name= "+name+" add= "+add+" st= "+sta+" ct= "+ct+" email= "+email+" mob= "+mob+"loc= "+location);
		
		
	}catch(Exception e) {
		System.out.println("******************ERROR****************** "+e);
		i=2;
		response.sendRedirect("welcomePage.jsp");
	} 
		
		
		
		}

}
