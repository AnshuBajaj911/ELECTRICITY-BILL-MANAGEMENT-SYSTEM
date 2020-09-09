package eBillSys;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eBillSys.LoginDao;

/**
 * Servlet implementation class Llogin
 */
@WebServlet("/Llogin")
public class Llogin extends HttpServlet {
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		
		LoginDao dao = new LoginDao();
		
		if(dao.check(uname, pass)) {
			
			HttpSession session =  request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("welcomePage.jsp");
		}
		else {
			response.sendRedirect("index.jsp");
		}
	}

}
