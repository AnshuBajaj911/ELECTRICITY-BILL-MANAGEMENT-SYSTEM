package eBillSys;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	public boolean check(String uname, String pass) {
		
		String sql = "select * from users where username=? and pass=?";
		String url = "jdbc:mysql://localhost:3306/anshu";
		String username = "root";
		String password = "1234";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		 
			Connection con = DriverManager.getConnection(url,username,password);
		    PreparedStatement st = con.prepareStatement(sql);
		    st.setString(1,uname);
		    st.setNString(2, pass);
		    
		    ResultSet rs = st.executeQuery();
		    if(rs.next()) {
		    	return true;
		    }
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return false;
	}

}
