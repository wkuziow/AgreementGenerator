package pl.coderslab.agreementgenerator.agreement;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.agreementgenerator.client.Client;
import pl.coderslab.agreementgenerator.client.ClientRepository;
import pl.coderslab.agreementgenerator.transaction.Transaction;
import pl.coderslab.agreementgenerator.transaction.TransactionRepository;

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
}
