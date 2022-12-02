<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
 <link rel="stylesheet" href="http://localhost:8080/hellllo/secondpage.css">
 <body>
<div class="head">
<br>
<% 
   Object Stuname=session.getAttribute("sname");
if(Stuname!=null) 
{
  out.println("<h3>Welcome,</h1><br>"+Stuname) ;
  }

 else{
 out.println("Some error occured");  
 }

 %>
 </div>
 <br>
 <br>
 <div class="head2">
 <div class="vacci">
 <br>
  <h2>Vaccination Verification</h2>
  <br><br>
  </div>
  
 <form  action="page2.jsp"method="post">
 <div class="head3">
    
    <label for="batchnoo">Batch no* :  </label>
    <br>
    <input type="text" name="batchnoo" placeholder="First Dose" required >
    <br>
    <br>
    <label for="date">Date of 1st dose :  </label>
    <br>
    <input type="date" name="date" >
    <br>
    <br>
    <label for="batchno">Batch no* :  </label>
    <br>
    <input type="text" name="batchno" placeholder="Second Dose" required>
    <br>
    <br>
    <label for="datee">Date of 2nd dose :  </label>
    <br>
    <input type="date" name="datee" >
    <br>
    <br>
     <input type="Submit" id="search" value="submit">
   </div>
    </form>
     </div>
   
  <span class="status">


 <%
 String batchno_1=request.getParameter("batchnoo");
 String batchno_2=request.getParameter("batchno");
 Object Admission=session.getAttribute("Admissionnos");
 String firstno = null;
 String secondno = null;
 String url = "jdbc:mysql://localhost:3306/studentdata";
String uname ="root";
String pass = "Yashw@123";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pass);
Statement st = con.createStatement();
String query = "select name,emailid,first,second from trains where admissionno='"+Admission+"'" ;
ResultSet rs = st.executeQuery(query);
if(rs.next())
{	

  firstno = rs.getString("first");
  secondno = rs.getString("second");
  String stuname = rs.getString("name");
  String emailid = rs.getString("emailid");
 
  if(firstno.equals(batchno_1) && secondno.equals(batchno_2))
{
 out.println("Congratulation!You is Fully Vaccinated") ;
 session.setAttribute("name",stuname);
 session.setAttribute("mailid",emailid);
 session.setAttribute("dose1",firstno);
 session.setAttribute("dose2",secondno);
 
  response.sendRedirect("ticket.jsp");
  
 }
  else if(firstno.equals(batchno_1))
	{
   out.println("You are Partially Vaccinated");
	}
  else if(batchno_1==null)
 	{
    out.println(" ");
 	}
 else
 {
 out.println("Invalid data");	 
 }
}
 %>
 </span>
 </head>
</body>
</html>