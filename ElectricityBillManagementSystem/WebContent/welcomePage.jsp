<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<style>
body {
  background-image: url('https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Raichur_Thermal_Power_Station.jpg/1920px-Raichur_Thermal_Power_Station.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
    </style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!--  for calculate bill  -->

  <script>
    function f(){
        var t = document.getElementById("uc").value;
      var tt = 5*1*t;
       var meter_rent = 100;
        var fixed_charges = 190;
        var total = 1*tt + 1*meter_rent + 1*fixed_charges;
        total = total + 0.18*total;
        <% 
        System.out.println("Checking*************************************");
        %>
      document.getElementById("op").innerHTML=total;
       // alert(t + "  " + s + "  " +  pp+ "  "+ out);
    }
    
   
    </script>




</head>

<body>
<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); //http1.1
response.setHeader("Pragma","no-cache");//http1.0
response.setHeader("Expires","0"); //proxy
if(session.getAttribute("username")==null)response.sendRedirect("index.jsp");

%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page import="eBillSys.payBill"%>
<%@page import="eBillSys.addCustomer"%>
<% addCustomer d = new addCustomer();
     if(d.i==1){
    	 %> <script>alert("NEW CUSTOMER CREATED SUCCESSFULLY !!!");</Script>
    	 <% d.i=0;
     }
     if(d.i==2){
    	 %> <script>alert("FAILED PLEASE TRY AGAIN");</Script>
     <% d.i=0;}
%>


<% payBill cz = new payBill();
     if(cz.ccc==1){
    	 %> <script>alert("BILL PAID SUCCESSFULLY !!!");</Script>
    	 <% cz.ccc=0;
     }
     
%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="font-color:white;">Electricity Bill Management System</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
     <!-- <li class="active"><a href="#">Home</a></li> -->
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Master<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" data-toggle="modal" data-target="#myModal1">New Customer</a></li>
          <li><a href="#" data-toggle="modal" data-target="#myModal2">Customer Details</a></li>
           <li><a href="#" data-toggle="modal" data-target="#myModal7">Deposit Details</a></li>
            </ul>  
                 
        
        </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">User<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" data-toggle="modal" data-target="#myModal6">Pay Bill</a></li>
          <li><a href="#" data-toggle="modal" data-target="#myModal3">Calculate Bill</a></li>
          <li><a href="#" data-toggle="modal" data-target="#myModal4">Last Bill</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Report <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#" data-toggle="modal" data-target="#myModal5">Generate Bill</a></li>
        
        </ul>
      </li>
       
       <li ><a href="#">About Us</a></li>
      <li ><a href="#" data-toggle="modal" data-target="#myModal8">Logout</a></li>
        
      </ul>
     <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content NEW CUSTOMER-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">NEW CUSTOMER DETAILS</h4>
        </div>
        <div class="modal-body">
        
        
        
        <!-- Calling servlet addCustomer from form and insertinf data into customers table -->
        
        
        
        
         <form action="addCustomer" method="post">
    <table align='center'>
    <tr><td>Enter Customer Name</td><td><input type="text" name="cname" required></td></tr>
        <tr><td>Enter Customer Address&nbsp&nbsp&nbsp&nbsp&nbsp</td><td><input type="text" name="caddress"  required></td></tr>
        <tr><td>Enter State</td><td><input type="text" name="state" ></td></tr>
        <tr><td>Enter City</td><td><input type="text" name="city" ></td></tr>
        <tr><td>Enter Customer Email</td><td><input type="email" name="cemail" ></td></tr>
        <tr><td>Enter Customer Phone</td><td><input type="text" name="cphno" ></td></tr>
       <tr><td>Enter METER NO.</td><td><input type="text" name="meterno" required></td></tr>
        <tr><td>Enter METER Location</td><td><input type="text" name="loc" ></td></tr>
        <tr><td></td><td><input type="submit" class="btn btn-default" value="Add Customer" >
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></td></tr> </table></form>
          
        
      </div>
      
        </div> </div></div>
    
    <!-- Modal Content Finish -->   
        
        <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog" style="width:950px;">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">CUSTOMER DETAILS</h4>
        </div>
        <div class="modal-body">
        
        
        
        
        
        
        
        <%
String id = request.getParameter("meterNo");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "anshu";
String userId = "root";
String password = "1234";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<table align="center" cellpadding="5" cellspacing="5" border="1"  >
<tr>

</tr>
<tr >
<td><b>Meter Number</b></td>
<td><b>Name</b></td>
<td><b>Address</b></td>
<td><b>State</b></td>
<td><b>City</b></td>
<td><b>Email</b></td>
<td><b>Contact No.</b></td>
<td><b>Meter Location</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM Customers order by meterNo";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">


<td><%=resultSet.getString("meterNo") %></td>

<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("addr") %></td>
<td><%=resultSet.getString("st") %></td>
<td><%=resultSet.getString("ct") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("mob") %></td>
<td><%=resultSet.getString("location") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
finally{
	statement.close();
	connection.close();
}
%>
</table>
        
      
         <form action="#">
    <table align='center'>
   
        <tr><td></td><td>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></td></tr> </table></form>
          
        
      </div>
      
    </div></div> </div>
    
    
    
    
    
    
    <div class="modal fade" id="myModal7" role="dialog">
    <div class="modal-dialog" style="width:450px;">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">DEPOSIT DETAILS</h4>
        </div>
        <div class="modal-body">
        
        
        
        
        
        
        
        <%/*
String id = request.getParameter("meterNo");
String d = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "anshu";
String userId = "root";
String password = "1234";
*/
try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

 connection = null;
 statement = null;
 resultSet = null;
%>

<table align="center" cellpadding="5" cellspacing="5" border="1"  >
<tr>

</tr>
<tr >
<td><b>Meter Number</b></td>
<td><b>Cycle</b></td>
<td><b>Consumption</b></td>
<td><b> Payment Status</b></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM Consumption order by meterNo";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">


<td><%=resultSet.getString("meterNo") %></td>

<td><%=resultSet.getString("cycle") %></td>
<td><%=resultSet.getString("con") %></td>
<td><%=resultSet.getString("status") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
finally{
	statement.close();
	connection.close();
}
%>
</table>
        
      
         <form action="#">
    <table align='center'>
   
        <tr><td></td><td>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></td></tr> </table></form>
          
        
      </div>
      
    </div></div> </div>
    
    
    
    
    
    
    
    
    
    
     <div class="modal fade" id="myModal8" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LOGOUT</h4>
        </div>
        <div class="modal-body">
         <form action="Llogout" method="post">
    <table align='center'>
        
        
        <tr><td></td><td><button class="btn  btn-primary" type="submit">Logout</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <!-- Modal Content Finish --> 
        <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">CALCULATE BILL</h4>
        </div>
        <div class="modal-body">
         <form action="#">
    <table align='center'>
        <tr><td>ENTER METER NO.</td><td><input type="text" name="meterno"></td></tr>
    <tr><td>ENTER UNITS CONSUMED</td><td><input id="uc" type="number" name="units"></td></tr>
                
       
        <tr>
            <td>Total Bill Amount</td>
    
            <td id="op"> </td>
        </tr> <tr><td></td><td></td></tr>
        
        <tr><td></td><td><button class="btn  btn-primary" onclick="f()">Calculate</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
              <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LAST BILL</h4>
        </div>
        <div class="modal-body">
         <form action="lastBill" method="post">
    <table align='center'>
        <tr><td>ENTER METER NO.</td><td><input id="m" type="text" name="meterno"></td></tr>
    <tr><td>ENTER CYCLE</td><td><input id="cycle" type="number" name="cycle" min=1 max=6></td></tr>
                
       
        <tr>
            <td>Total Bill Amount</td>
    
            <td id="op2"> </td>
        </tr> <tr><td></td><td></td></tr>
        
        <tr><td></td><td><button class="btn  btn-primary" type="submit">GET LAST BILL</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
             
             
             
             
             
              <div class="modal fade" id="myModal5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">GENERATE BILL</h4>
        </div>
        <div class="modal-body">
         <form action="lastBill" method="post">
    <table align='center'>
        <tr><td>ENTER METER NO.</td><td><input id="m" type="text" name="meterno"></td></tr>
    <tr><td>ENTER CYCLE</td><td><input id="cycle" type="number" name="cycle" min=1 max=6></td></tr>
                
       
       
        
        <tr><td></td><td><button class="btn  btn-primary" type="submit">GENERATE BILL</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
             
             
             
             
             
             
             
             
              <div class="modal fade" id="myModal6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content CUSTOMER details-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">PAY BILL</h4>
        </div>
        <div class="modal-body">
         <form action="payBill" method="post" onsubmit="confirm('Do You Want to Pay the Bill ?? ')">
    <table align='center'>
        <tr><td>ENTER METER NO. &nbsp &nbsp &nbsp</td><td><input id="me" type="text" name="mnumber"></td></tr>
    <tr><td>ENTER CYCLE</td><td><input id="cyc" type="number" name="cycle" min=1 max=6></td></tr>
               <tr><td> <input type="radio" id="cash" name="cash" value="cash">
<label for="cash">Cash</label> </td><td>
       <input type="radio" id="cheque" name="cheque" value="cheque">
<label for="cheque">Cheque</label></td> </tr>
       
        <tr><td>Enter Cheque Number</td><td><input type="text"></td></tr>
        <tr><td></td><td><button class="btn  btn-primary" type="submit">Pay</button>
            <button class="btn btn-primary" data-dismiss="modal">Close</button></td></tr> 
        </table>
            </form>
          
        
      </div>
      
    </div>
    
    <!-- Modal Content Finish --> 
        
             </div> </div>
             
             
        
             </div> </div>
      
      
      <!-- END OF CALCULATE BILL-->
             </div> </div>
      </nav></nav>
  
<div class="container">
  </div>


</body>
</html>