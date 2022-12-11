<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import=" java.io.*"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.net.MalformedURLException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="com.itextpdf.text.Element"%>
<%@ page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@ page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import="com.itextpdf.text.FontFactory"%>
<%@ page import="com.itextpdf.text.Font"%>
<%@ page import="com.itextpdf.text.pdf.BarcodeQRCode"%>
<%@ page import="com.itextpdf.text.pdf.PdfContentByte"%>









<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maha-ticket eportal</title>
<link rel="stylesheet" href="http://localhost:8080/hellllo/storingdata.css">
</head>
<body>
<div class="for">
<% 
String Name=null;
String Expirydate=null,trainpid=null,email=null,dose1=null,dose2=null ;
String station1=request.getParameter("from");
String station2=request.getParameter("To");
Object pAdmission=session.getAttribute("Admissionnos");
String Addmission=(String)pAdmission;
String path = "";//put the path of folder with file name (localpass.pdf)
    
    		 String url = "jdbc:mysql://localhost:3306/studentdata";
    		 String uname ="root";
    		 String pass = "******";//password
    		 Class.forName("com.mysql.cj.jdbc.Driver");
    		 Connection con = DriverManager.getConnection(url,uname,pass);
    		 Statement st = con.createStatement();
    		 SimpleDateFormat dateformat =new SimpleDateFormat("dd-MM-yyyy");
    		 Date datee= new Date();
    		 String pdate =dateformat.format(datee);
    		 Calendar cal =Calendar.getInstance();
    		 cal.add(Calendar.MONTH,1);
    		
    		//generating passid by combination of date and admission no 
    		String dateee=dateformat.format(cal.getTime());
    		String pid= dateee.substring(0,2) + dateee.substring(3,5)+ Addmission.substring(0,6);
    		
    		 String query = "update trains set origin='"+station1+"',destination='"+station2+"',dateofissue='"+pdate+"',dateofexpire='"+dateee+"',passid='"+pid+"' where admissionno='"+pAdmission+"'";
    		int rowsAffected =st.executeUpdate(query);
    		String query1 = "select emailid,name,dateofexpire,passid,first,second from trains where admissionno='"+pAdmission+"'" ;
    		ResultSet rs = st.executeQuery(query1);
    		if(rs.next())
    		{
    			Name = rs.getString("name");
    			Expirydate=rs.getString("dateofexpire");
    			trainpid = rs.getString("passid");
    			email=rs.getString("emailid");
    			dose1=rs.getString("first");
    			dose2=rs.getString("second");
    			session.setAttribute("sname",Name);
    			session.setAttribute("doe",Expirydate);
    			
    		}    
    
    		out.println("Your Pass Has Been Generated Sucessfully");
    		session.setAttribute("from",station1);
    		session.setAttribute("to",station2);
    		session.setAttribute("id",pid);
    		session.setAttribute("doi",pdate);
    		
    		//pdf creation
    		Document doc = new Document();  
try  
{  
//generate a PDF at the specified location  
PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(path));//here 
  
//opens the PDF  
doc.open();  
doc.setMargins(0,0,0,0);
Image img = Image.getInstance("./images/IR.png");//if doesnt work put static path
img.scaleAbsolute(95f, 95f);
doc.add(img);
Font fontSize_16 =  FontFactory.getFont(FontFactory.TIMES, 16f);

Font fontfactor_black =  FontFactory.getFont(FontFactory.TIMES, 32f, Font.BOLD);
doc.add(new Paragraph("                         Train Pass                                           ", fontfactor_black));
PdfPTable table = new PdfPTable(2);
PdfPCell cell1 = new PdfPCell(new Paragraph("Name",fontSize_16));
PdfPCell cell2 = new PdfPCell(new Paragraph(Name,fontSize_16));

PdfPCell cell3 = new PdfPCell(new Paragraph("From",fontSize_16));
PdfPCell cell4 = new PdfPCell(new Paragraph(station1,fontSize_16));

PdfPCell cell5 = new PdfPCell(new Paragraph("Destination",fontSize_16));
PdfPCell cell6 = new PdfPCell(new Paragraph(station2,fontSize_16));

PdfPCell cell7 = new PdfPCell(new Paragraph("Pass-Id",fontSize_16));
PdfPCell cell8 = new PdfPCell(new Paragraph(trainpid,fontSize_16));

PdfPCell cell9 = new PdfPCell(new Paragraph("Date of Issue",fontSize_16));
PdfPCell cell10 = new PdfPCell(new Paragraph(pdate,fontSize_16));

PdfPCell cell11 = new PdfPCell(new Paragraph("Date of Expiry",fontSize_16));
PdfPCell cell12 = new PdfPCell(new Paragraph(dateee,fontSize_16));

PdfPCell cell13 = new PdfPCell(new Paragraph("Email-Id",fontSize_16));
PdfPCell cell14 = new PdfPCell(new Paragraph(email,fontSize_16));

PdfPCell cell15 = new PdfPCell(new Paragraph("Batch No (1st Dose)",fontSize_16));
PdfPCell cell16 = new PdfPCell(new Paragraph(dose1,fontSize_16));

PdfPCell cell17 = new PdfPCell(new Paragraph("Batch No (2nd Dose)",fontSize_16));
PdfPCell cell18 = new PdfPCell(new Paragraph(dose2,fontSize_16));





table.addCell(cell1);
table.addCell(cell2);
table.addCell(cell3);
table.addCell(cell4);
table.addCell(cell5);
table.addCell(cell6);
table.addCell(cell7);
table.addCell(cell8);
table.addCell(cell9);
table.addCell(cell10);
table.addCell(cell11);
table.addCell(cell12);
table.addCell(cell13);
table.addCell(cell14);
table.addCell(cell15);
table.addCell(cell16);
table.addCell(cell17);
table.addCell(cell18);

doc.add(table);
 
Font fontfactor_black1 =  FontFactory.getFont(FontFactory.TIMES,16,Font.BOLD);
Font fontfactor_black3 =  FontFactory.getFont(FontFactory.TIMES,16);
Font fontfactor_black2 =  FontFactory.getFont(FontFactory.TIMES,20,Font.BOLD);


doc.add(new Paragraph("Travel Advisory :",fontfactor_black2 ));
//doc.add(new Paragraph(" We seek your kind assistance to safeguard your well-being, as well as that of your fellow passengers on the journey by following the guidelines set out  below:",fontfactor_black3 ));
doc.add(new Paragraph(" \t 1. All passengers should wear a mask covering their nose and mouth throughout the journey. :",fontfactor_black3 ));
doc.add(new Paragraph(" \t 2. Sanitise your hands before and after getting down from the train.",fontfactor_black3 ));
doc.add(new Paragraph(" \t 3. Please maintain appropriate physical distancing while getting in and out of the train.",fontfactor_black3));
doc.add(new Paragraph(" \t 4. Keep the pass ready for checking during the journey to avoid any kind of inconvenience. ",fontfactor_black3 ));
doc.add(new Paragraph("\nTravelling ticket-less is a punishable offence under the Railways Act. ",fontfactor_black1)); 
doc.add(new Paragraph("Thank you for using mahaticket-eportal. ",fontfactor_black1 ));
doc.add(new Paragraph("Maharashtra Railway wishes you a happy and safe journey! ",fontfactor_black1 ));
		

BarcodeQRCode barcodeQrcode = new BarcodeQRCode(" Name : "+Name+"\n From : "+station1+"\n Destination : "+station2+"\n Pass-Id : "+trainpid+"\n Date of Issue :"+pdate+"\n Date of Expiry : "+dateee+"\n Email-Id : "+email+"\nBatch No(1st Dose) : "+dose1+"\n Batch No (2nd Dose) : "+dose2, 1, 1, null);
Image qrcodeImage = barcodeQrcode.getImage();
qrcodeImage.setAbsolutePosition(429, 5);
qrcodeImage.scalePercent(199);
doc.add(qrcodeImage);

//close the PDF file  
doc.close();  
//closes the writer  
writer.close();  
}   
catch (DocumentException e)  
{  
e.printStackTrace();  
}   
catch (FileNotFoundException e)  
{  
e.printStackTrace();  
}  
    		
%>
</div>
<form action="Displayticket.jsp" method="post">

  <input type="Submit" id="search" value="Proceed" class="search">
  </form>
</body>
</html>