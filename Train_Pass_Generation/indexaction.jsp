<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("first name");
String lastname=request.getParameter("Last name");
String email=request.getParameter("email");
String Admission=request.getParameter("Admissionno");
try{
String url = "jdbc:mysql://localhost:3306/studentdata";
String uname ="root";
String pass = "****"; //password
String Namee;
//String database = "studentdata";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pass);
Statement st = con.createStatement();
String query = "select emailid,name from trains where admissionno='"+Admission+"'" ;
ResultSet rs = st.executeQuery(query);
if(rs.next())
{

	 
	 Namee = rs.getString("name");
	 session.setAttribute("sname",Namee);
	 session.setAttribute("Admissionnos",Admission);
	 
	 response.sendRedirect("vaccinationdetails.jsp");
	 
 }
 else{
	//System.out.print("Sorry You are not PCE Student");
	//System.out.print(Admission);
			response.sendRedirect("error.html");
 }
 
 
 } 
 catch(Exception e)
 {
	System.out.println(e);
	//response.sendRedirect("error.html");
 }
 
 


%>