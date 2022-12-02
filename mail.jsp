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
<%
String result;
String email="yashwakekarek@gmail.com";
final String to= email;
final String subject="email";
final String messg="Hello " + " Thank for using mahaticket-eportal. Congratulations !! your ticket has been generated sucessfully \n "+"Passid \t"+"\n From \t"+"\n Destination \t"+"\n Date of Issue \t"+"\n Date of Expire \t"+"\n Let's follow all the protocol to fight against thw covid .We hope for Your Bright Future and HAPPY JOURNEY " ;
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
    message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
    // Set Subject: header field
    message.setSubject(subject);
    // Now set the actual message
    message.setText(messg);
    // Send message
    MimeBodyPart attachmentPart = new MimeBodyPart();
    attachmentPart.attachFile(new File("C:/Users/Yash/OneDrive/Desktop/Javaopppractical/ticket2.pdf"));
    Multipart multipart = new MimeMultipart();
    message.setContent(multipart);
    multipart.addBodyPart(attachmentPart);
    Transport.send(message);
    result = "mail sent successfully from W3Adda.com....";
   
} catch (MessagingException mex) {
    mex.printStackTrace();
    result = "Error: unable to send mail....";
}
%>