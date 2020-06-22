package pl.coderslab.agreementgenerator.pdf;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;

import javax.swing.text.Document;

public class Document_Creation {
    
   public static void createPDF() throws IOException {
      //Creating PDF document object 
      PDDocument document = new PDDocument();
      for (int i=0; i<10; i++) {
         //Creating a blank page
         PDPage blankPage = new PDPage();
         //Adding the blank page to the document
         document.addPage( blankPage );
         System.out.println("dodano stronę " + i);
      }
      //Saving the document
      document.save("PDF/my_doc.pdf");
      System.out.println("PDF created");
      //Closing the document  
      document.close();
   }




}