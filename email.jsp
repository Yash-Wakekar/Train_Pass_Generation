<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%
String result;
final String to="yashwakekarek@gmail.com";
final String subject="email";
final String messg="Hello YashWakekarS ";
final String from = "yashwakekar231@gmail.com";
final String pass = "Yashw@123";


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
    message.addRecipient(Message.RecipientType.TO,
            new InternetAddress(to));
    // Set Subject: header field
    message.setSubject(subject);
    // Now set the actual message
    message.setText(messg);
    // Send message
    Transport.send(message);
    result = "mail sent successfully from W3Adda.com....";
} catch (MessagingException mex) {
    mex.printStackTrace();
    result = "Error: unable to send mail....";
}
%>
<html>
   <head>
      <title>Send Email using JSP</title>
   </head>
   
   <body>
      <center>
         <h1>Send Email using JSP</h1>
      </center>
      
      <p align = "center">
         <% 
            out.println("Result: " + result + "\n");
         %>
      </p>
   </body>
</html>