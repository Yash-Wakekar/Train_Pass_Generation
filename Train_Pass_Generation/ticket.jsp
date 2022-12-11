<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import=" java.io.*"%>




<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Maha-ticket eportal</title>
<link rel="stylesheet" href="http://localhost:8080/hellllo/ticket.css">
</head>
<body>
<div class="ht">
<h1>Travel Details</h1>
</div>
<div class="for">
<div class="tex">
<% 
Object Stuname=session.getAttribute("name");
Object emailid=session.getAttribute("mailid");
Object first=session.getAttribute("dose1");
Object second=session.getAttribute("dose2");
out.println("<h1>Welcome,\t </h1>"+Stuname) ;
out.println("<p>Email id \t : </p>"+emailid) ;
out.println("<p>First Dose Batch No: \t  </p>\b"+first) ;
out.println("<p>Second Dose Batch No:\t </p>\b"+second) ;

%>

<form action="storingdata.jsp" method="post">

 <h3>From:</h3>
    <label for="from"></label>
    <select name="from" id="from">
        <option value="None">None</option>
        <option value="Airoli">Airoli</option>
        <option value="Belapur">Belapur</option>
        <option value="Ghansoli">Ghansoli</option>
        <option value="juinagar">juinagar</option>
        <option value="Khandeshwar">Khandeshwar</option>
        <option value="Kharghar">Kharghar</option>
        <option value="Koparkhairne">Koparkhairne</option>
         <option value="Manasarovar">Manasarovar</option>
        <option value="Nerul">Nerul</option>
        <option value="Panvel">Panvel</option>
        <option value="Rabale">Rabale</option>
        <option value="Sanpada">Sanpada</option>
        <option value="Seawood">Seawood</option>
        <option value="Thane">Thane</option>
        <option value="Turbhe">Turbhe</option>
        <option value="Vashi">Vashi</option>
          </select>
     <h3>To:</h3>
    <label for="To"></label>
    <select name="To" id="To">
        <option value="None">None</option>
        <option value="Airoli">Airoli</option>
        <option value="Belapur">Belapur</option>
        <option value="Ghansoli">Ghansoli</option>
        <option value="juinagar">juinagar</option>
        <option value="Khandeshwar">Khandeshwar</option>
        <option value="Kharghar">Kharghar</option>
        <option value="Koparkhairne">Koparkhairne</option>
         <option value="Manasarovar">Manasarovar</option>
        <option value="Nerul">Nerul</option>
        <option value="Panvel">Panvel</option>
        <option value="Rabale">Rabale</option>
        <option value="Sanpada">Sanpada</option>
        <option value="Seawood">Seawood</option>
        <option value="Thane">Thane</option>
        <option value="Turbhe">Turbhe</option>
        <option value="Vashi">Vashi</option>
          </select>
          <br>
          <br>
          <input type="Submit" id="search" value="submit">
          </div>
          </form>
        
</div>
          

</body>
</html>