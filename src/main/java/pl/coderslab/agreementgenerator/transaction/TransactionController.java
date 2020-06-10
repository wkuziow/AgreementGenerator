package pl.coderslab.agreementgenerator.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.agreementgenerator.client.Client;
import pl.coderslab.agreementgenerator.client.ClientRepository;
import pl.coderslab.agreementgenerator.user.UserRepository;

import java.util.Arrays;
import java.util.List;

@Controller
public class TransactionController {

    @Autowired
    private ClientRepository clientRepository;
    private UserRepository userRepository;
    private TransactionRepository transactionRepository;

    public TransactionController(ClientRepository clientRepository, UserRepository userRepository, TransactionRepository transactionRepository) {
        this.userRepository = userRepository;
        this.transactionRepository = transactionRepository;
        this.clientRepository = clientRepository;
    }

    @ModelAttribute("isActiveList")
    public List<Boolean> isActiveList() {
        return List.of(true, false);
    }

    @ModelAttribute("hasValidDate")
    public List<Boolean> hasValidDate() {
        return List.of(true, false);
    }

    @ModelAttribute("referenceRateList")
    public List<ReferenceRate> getListOfReferenceRates() {
        return Arrays.asList(ReferenceRate.values());
    }

    @RequestMapping(value = "/admin/client/{id}/addTransaction", method = RequestMethod.GET)
    public String addClientByAdminGetForm(@PathVariable Long id, Model model) {
        model.addAttribute("transaction", new Transaction());
        return "transaction/addTransaction";
    }

    @RequestMapping(value = "/admin/client/{id}/addTransaction", method = RequestMethod.POST)
    public String addClientByAdminProcessForm(@ModelAttribute @Validated Transaction transaction,
                                              @PathVariable Long id,
                                              BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "transaction/addTransaction";
        }
        transaction.setClient(clientRepository.findClientById(id));
        transactionRepository.save(transaction);
        return "redirect:allClients";
    }

    @RequestMapping(value = "/admin/allTransactions", method = RequestMethod.GET)
    public String getAllTransactionsForAdmin(Model model) {
        model.addAttribute("allTransactionsForAdmin", transactionRepository.findAll());
        return "admin/transactionList";
    }
}
