<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%
Document doc = new Document();  
try  
{  
//generate a PDF at the specified location  
PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream("C:/Users/Yash/OneDrive/Desktop/Javaopppractical/Doc5.pdf"));  
//System.out.println("PDF created.");  
//opens the PDF  
doc.open();  
//adds paragraph to the PDF file  
doc.add(new Paragraph("If you're offered a seat on a rocket ship, don't ask what seat! Just get on."));   
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
