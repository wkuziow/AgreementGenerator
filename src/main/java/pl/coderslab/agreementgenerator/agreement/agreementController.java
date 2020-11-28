package pl.coderslab.agreementgenerator.agreement;


import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.agreementgenerator.client.Client;
import pl.coderslab.agreementgenerator.client.ClientRepository;
import pl.coderslab.agreementgenerator.transaction.Transaction;
import pl.coderslab.agreementgenerator.transaction.TransactionRepository;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;


@Controller
public class agreementController {

    @Autowired
    private ClientRepository clientRepository;
    private TransactionRepository transactionRepository;

    public agreementController(TransactionRepository transactionRepository, ClientRepository clientRepository) {
        this.transactionRepository = transactionRepository;
        this.clientRepository = clientRepository;
    }

    @RequestMapping(value = "/client/{id}/showAgreement/{transactionId}", method = RequestMethod.GET)
    public String show(
            @PathVariable Long id,
            @PathVariable Long transactionId,
            ModelMap model,
            AgreementWording agreementWording) {
        Client client = clientRepository.findClientById(id);
        List<Transaction> listOfTransactions = transactionRepository.findTransactionByClientId(id);
        Transaction transaction = listOfTransactions.stream().
                filter(t -> t.getId().equals(transactionId)).collect(Collectors.toList()).get(0);

        model.addAttribute("agreementWording", agreementWording);
        model.addAttribute("client", client);
        model.addAttribute("transaction", transaction);

        return "agreement/showAgreement";
    }

    @RequestMapping(value = "/client/{id}/showAgreement/{transactionId}/pdf", method = RequestMethod.GET)
    public String generatePdf(
            @PathVariable Long id,
            @PathVariable Long transactionId,
            ModelMap model,
            AgreementWording agreementWording) {

        OutputStream file = null;

        try {
            file = new FileOutputStream(new File("Contacts.pdf"));
            Document document = new Document();

            PdfWriter.getInstance(document, file);
            document.open();

            // Writing content
            document.add(new Paragraph("Hello World, Creating PDF document in Java is easy"));
            document.add(new Paragraph("You are customer # 2345433"));
            document.add(new Paragraph(new Date(new java.util.Date().getTime()).toString()));

            // Add meta data information to PDF file
            document.addCreationDate();
            document.addAuthor("Javarevisited");
            document.addTitle("How to create PDF document in Java");
            document.addCreator("Thanks to iText, writing into PDF is easy");


            // close the document
            document.close();

            System.out.println("Your PDF File is succesfully created");

        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            // closing FileOutputStream
            try {
                if (file != null) {
                    file.close();
                }
            } catch (IOException io) {/*Failed to close*/

            }

            return "/client/transactionList";

        }
    }
}
