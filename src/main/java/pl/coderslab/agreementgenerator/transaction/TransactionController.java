package pl.coderslab.agreementgenerator.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import pl.coderslab.agreementgenerator.user.CurrentUser;
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
        return Arrays.asList(true, false);
    }

    @ModelAttribute("hasValidDate")
    public List<Boolean> hasValidDate() {
        return Arrays.asList(true, false);
    }

    @ModelAttribute("referenceRateList")
    public List<ReferenceRate> getListOfReferenceRates() {
        return Arrays.asList(ReferenceRate.values());
    }

    @RequestMapping(value = "/admin/client/{clientId}/addTransaction", method = RequestMethod.GET)
    public String addTransactionByAdminGetForm(Model model) {
        model.addAttribute("transaction", new Transaction());
        return "transaction/addTransaction";
    }

    @RequestMapping(value = "/admin/client/{clientId}/addTransaction", method = RequestMethod.POST)
    public String addTransactionByAdminProcessForm(@PathVariable Long clientId,
                                                   @ModelAttribute @Validated Transaction transaction,
                                              BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "transaction/addTransaction";
        }
        transaction.setClient(clientRepository.findClientById(clientId));
        transactionRepository.save(transaction);
        return "redirect:../../../admin/allTransactions";
    }

    @RequestMapping(value = "/admin/transaction/update/{id}", method = RequestMethod.GET)
    public String updateTransactionByAdminGet(@PathVariable Long id, Model model) {
        Transaction transaction = transactionRepository.findTransactionById(id);
        model.addAttribute("transaction", transaction);
        return "transaction/addTransaction";
    }

    @RequestMapping(value = "/admin/transaction/update/{id}", method = RequestMethod.POST)
    public String updateTransactionByAdminProcessForm(@ModelAttribute @Validated Transaction transaction, @PathVariable Long id,
                                                 BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "transaction/addTransaction";
        }

        transaction.setClient(transactionRepository.findTransactionById(id).getClient());
        transactionRepository.save(transaction);
        return "redirect:../../../admin/allTransactions";
    }

    @ModelAttribute("currentUserFullName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = "-1";
        if (customUser != null) {
            currentUser = customUser.getUser().getFullname();
        }
        return currentUser;
    }

    @RequestMapping(value = "/admin/allTransactions", method = RequestMethod.GET)
    public String getAllTransactionsForAdmin(Model model) {
        model.addAttribute("allTransactionsForAdmin", transactionRepository.findAll());
        return "admin/transactionList";
    }

    @RequestMapping(value = "user/allTransactions", method = RequestMethod.GET)
    public String getAllTransactionsForUser(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        model.addAttribute("allTransactionsforUser", transactionRepository.findTransactionsForUser(customUser.getUser().getId()));
        return "user/transactionList";
    }

    @RequestMapping(value = "/user/transaction/update/{id}", method = RequestMethod.GET)
    public String updateTransactionByUserGet(@PathVariable Long id, Model model) {
        Transaction transaction = transactionRepository.findTransactionById(id);
        model.addAttribute("transaction", transaction);
        return "transaction/addTransaction";
    }

    @RequestMapping(value = "/user/transaction/update/{id}", method = RequestMethod.POST)
    public String updateTransactionByUserProcessForm(@ModelAttribute @Validated Transaction transaction, @PathVariable Long id,
                                                      BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "transaction/addTransaction";
        }

        transaction.setClient(transactionRepository.findTransactionById(id).getClient());
        transactionRepository.save(transaction);
        return "redirect:../../../user/allTransactions";
    }

    @RequestMapping(value = "/user/client/{clientId}/addTransaction", method = RequestMethod.GET)
    public String addTransactionByUserGetForm(Model model) {
        model.addAttribute("transaction", new Transaction());
        return "transaction/addTransaction";
    }

    @RequestMapping(value = "/user/client/{clientId}/addTransaction", method = RequestMethod.POST)
    public String addTransactionByUserProcessForm(@ModelAttribute @Validated Transaction transaction,
                                              @PathVariable Long clientId,
                                              BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "transaction/addTransaction";
        }
        transaction.setClient(clientRepository.findClientById(clientId));
        transactionRepository.save(transaction);
        return "redirect:../../../user/allTransactions";
    }

}
