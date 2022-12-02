<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("first name");
String lastname=request.getParameter("Last name");
String email=request.getParameter("email");
String Admission=request.getParameter("Admissionno");
try{
String url = "jdbc:mysql://localhost:3306/studentdata";
String uname ="root";
String pass = "Yashw@123";
String Namee;
//String database = "studentdata";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pass);
Statement st = con.createStatement();
String query = "select emailid,name from trains where admissionno='"+Admission+"'" ;
ResultSet rs = st.executeQuery(query);
if(rs.next())
{
 //if(email == rs.getString("emailid"))
// {
	// PrinterWriter writer = response.getWriter();
	 
	 Namee = rs.getString("name");
	 session.setAttribute("sname",Namee);
	 session.setAttribute("Admissionnos",Admission);
	 
	 response.sendRedirect("page2.jsp");
	 //System.out.print("Hello\n");
	 //response.sendRedirect("save.html");
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
 
 
	// PrintWriter writer = new PrintWriter(System.out);
	//String htmlResponse="<html>";
	//htmlResponse +="<h2>Your Name is: "+ Name +"<br/>";
	//htmlResponse +="<h2>Your Admission No is: "+ Admission +"</h2>";
	//htmlResponse +="</html>";	
	//writer.println(htmlResponse);
	
	
 
//System.out.println(name);
//System.out.println("Your mail id is "+email);
//}
//else {
	////System.out.print("Sorry You are not PCE Student");
	 //response.sendRedirect("Error.html");
	
	
//}
//st.close();
//con.close();

%>