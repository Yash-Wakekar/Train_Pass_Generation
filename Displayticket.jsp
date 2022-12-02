<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.util.Properties" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="com.sun.mail.util.MimeUtil" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.*"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="http://localhost:8080/hellllo/Displaytic.css">

<title>Maha-ticket eportal</title>

</head>
<body>
<div class="head">
<h1>LOCAL RAILWAY PASS</h1>
<h3>Pillai College of Engineering</h3>
<div class="ticket">
<div class="tex">
<br>
<%
Object pAdmission=session.getAttribute("Admissionnos");
String email=null;
try{
String url = "jdbc:mysql://localhost:3306/studentdata";
String uname ="root";
String pass = "Yashw@123";
String Name,Expirydate,pid;


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(url,uname,pass);
Statement st = con.createStatement();
String query = "select emailid,name,dateofexpire,passid from trains where admissionno='"+pAdmission+"'" ;
ResultSet rs = st.executeQuery(query);
if(rs.next())
{
	Name = rs.getString("name");
	Expirydate=rs.getString("dateofexpire");
	pid = rs.getString("passid");
	email=rs.getString("emailid");
	session.setAttribute("sname",Name);
	session.setAttribute("doe",Expirydate);
	session.setAttribute("id",pid);
	session.setAttribute("eid",email);
	
}
//else{
	//response.sendRedirect("error.html");
//}
} 
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("error.html");
}
Object Stuname=session.getAttribute("sname");
Object emailid=session.getAttribute("mailid");
Object first=session.getAttribute("dose1");
Object second=session.getAttribute("dose2");
Object station1=session.getAttribute("from");
Object station2=session.getAttribute("to");
Object passid=session.getAttribute("id");
Object date1=session.getAttribute("doi");
Object date2 =session.getAttribute("doe");
Object newpassid=session.getAttribute("id");
/* String strPath="D:/example.txt";
File strFile = new File(strPath);
boolean fileCreated = strFile.createNewFile();
Writer objWriter = new BufferedWriter(new FileWriter(strFile));
objWriter.write("Hello"+"   "+ Stuname+"                   ");
objWriter.write("Passid :"+"   "+ newpassid +"\n");
objWriter.write("Dose2(Batch No) : "+"   "+ second+"\n");
objWriter.write("origin :"+"   "+ station1+"\n");
objWriter.write("Destination :"+ station2+"\n");
objWriter.write("Date of Issue :"+"   "+ date1+"\n");
objWriter.write("Date of Expire :"+"   "+ date2+"\n");
objWriter.flush();
objWriter.close();
*/
out.println("<p>Name :\t </p>"+Stuname) ;
out.println("<p>Email id \t : </p>"+emailid) ;
out.println("<p>First Dose Batch No: \t  </p>\b"+first) ;
out.println("<p>Second Dose Batch No:\t </p>\b"+second) ;
out.println("<p>Pass-Id :"+ newpassid);
out.println("<p>From :"+ station1);
out.println("<p>Destination :"+ station2);
out.println("<p>Date of Issue :"+ date1);
out.println("<p>Date of Expire :"+ date2);

//BufferedReader reader = new BufferedReader(new FileReader(strPath));
//StringBuilder sb =new StringBuilder();
//String line;
//while((line=reader.readLine())!=null){
	//sb.append(line+"\n");
//}
//out.println(sb.toString());
String result;
final String to=(String)emailid;
final String subject="email";
final String messg="Hello "+Stuname + " Thank you for using mahaticket-eportal. Congratulations , your ticket has been generated successfully \n Please find your ticket in attachment below."+"\n We wish you HAPPY and SAFE JOURNEY! " ;
final String from = "yash20comp@student.mes.ac.in";
final String pass = "Yashw@7112";


// Defining the gmail host
String host = "smtp.gmail.com";

// Creating Properties object
Properties props = new Properties();

// Defining properties
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port", "465");

// Authorized the Session object.
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(from, pass);
    }
});

try {
    // Create a default MimeMessage object.
    MimeMessage message = new MimeMessage(mailSession);
    // Set From: header field of the header.
    message.setFrom(new InternetAddress(from));
    // Set To: header field of the header.
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
    // Set Subject: header field
    message.setSubject(subject);
    // Now set the actual message
    message.setText(messg);
    // Send message
    MimeBodyPart textBodyPart = new MimeBodyPart();
        textBodyPart.setText(messg);

    MimeBodyPart attachmentPart = new MimeBodyPart();
    attachmentPart.attachFile(new File("C:/Users/Yash/OneDrive/Desktop/Javaopppractical/localpass.pdf"));
    Multipart multipart = new MimeMultipart();
    message.setContent(multipart);
    multipart.addBodyPart(textBodyPart);
    multipart.addBodyPart(attachmentPart);
    Transport.send(message);
    result = "mail sent successfully ....";
    
} catch (MessagingException mex) {
    mex.printStackTrace();
    result = "Error: unable to send mail....";
}
//String message=("Hello hii");
//String subject="2nd year";
//String to="yashwakekar231@gmail.com";
//String from="yashwakekarek@gmail.com";
  
%>
</div>
</div>
</div>
<h5>Note : Congratulation!Your pass has been generated successfully and it mailed to your registered mail-id</h5>

</body>
</html>