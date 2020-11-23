package pl.coderslab.agreementgenerator.client;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.agreementgenerator.transaction.TransactionRepository;
import pl.coderslab.agreementgenerator.user.CurrentUser;
import pl.coderslab.agreementgenerator.user.Role;
import pl.coderslab.agreementgenerator.user.User;
import pl.coderslab.agreementgenerator.user.UserRepository;

import javax.validation.Validator;
import java.util.Arrays;
import java.util.List;

@Controller
public class ClientController {

    private ClientRepository clientRepository;
    private UserRepository userRepository;
    private TransactionRepository transactionRepository;
    private ClientUtils clientUtils;

    public ClientController(ClientRepository clientRepository, UserRepository userRepository, TransactionRepository transactionRepository, ClientUtils clientUtils) {
        this.clientRepository = clientRepository;
        this.userRepository = userRepository;
        this.transactionRepository = transactionRepository;
        this.clientUtils = clientUtils;
    }

    @ModelAttribute("currentUserFullName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = "-1";
        if (customUser != null) {
            currentUser = customUser.getUser().getFullname();
        }
        return currentUser;
    }

    @RequestMapping(value = "/admin/allClients", method = RequestMethod.GET)
    public String getAllClientsForAdmin(Model model) {
        model.addAttribute("allClientsForAdmin", clientRepository.findAll());
        return "admin/clientList";
    }

    @RequestMapping(value = "/admin/addClient", method = RequestMethod.GET)
    public String addClientByAdminGetForm(Model model) {
        model.addAttribute("client", new Client());
        return "admin/addClient";
    }

    @RequestMapping(value = "/admin/addClient", method = RequestMethod.POST)
    public String addClientByAdminProcessForm(@ModelAttribute @Validated Client client,
                                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/addClient";
        }
        client.setSoftDelete(false);
        clientRepository.save(client);
        return "redirect:allClients";
    }

    @RequestMapping(value = "/user/addClient", method = RequestMethod.GET)
    public String addClientByUserGetForm(Model model) {
        model.addAttribute("client", new Client());
        return "user/addClient";
    }

    @RequestMapping(value = "/user/addClient", method = RequestMethod.POST)
    public String addClientByUserProcessForm(@ModelAttribute @Validated Client client,
                                              BindingResult bindingResult, @AuthenticationPrincipal CurrentUser customUser) {
        if (bindingResult.hasErrors()) {
            return "user/addClient";
        }
        client.setUser(customUser.getUser());
        client.setSoftDelete(false);
        clientRepository.save(client);
        return "redirect:allClients";
    }

    @ModelAttribute("isActiveList")
    public List<Boolean> isActiveList() {
        return Arrays.asList(true, false);
    }

    @ModelAttribute("listOfUsers")
    public List<User> listOfUsers() {
        return userRepository.findAllByRole(Role.ROLE_USER);
    }

    @RequestMapping(value = "/user/allClients", method = RequestMethod.GET)
    public String getAllClientsForUser(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        model.addAttribute("allClientsForUser", clientRepository.findAllByUser(customUser.getUser()));
        return "user/clientList";
    }

    @RequestMapping(value = "/admin/client/update/{id}", method = RequestMethod.GET)
    public String updateClientByAdminGet(@PathVariable Long id, Model model) {
        Client client = clientRepository.findClientById(id);
        model.addAttribute("client", client);
        return "admin/addClient";
    }

    @RequestMapping(value = "/admin/client/update/{id}", method = RequestMethod.POST)
    public String updateClientByAdminProcessForm(@ModelAttribute @Validated Client client,
                                              BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/addClient";
        }

        clientRepository.save(client);
        return "redirect:../../allClients";
    }

    @RequestMapping(value = "/user/client/update/{id}", method = RequestMethod.GET)
    public String updateClientByUserGet(@PathVariable Long id, Model model) {
        Client client = clientRepository.findClientById(id);
        model.addAttribute("client", client);
        return "user/addClient";
    }

    @RequestMapping(value = "/user/client/update/{id}", method = RequestMethod.POST)
    public String updateClientByUserProcessForm(@PathVariable Long id, @ModelAttribute @Validated Client client,
                                                 BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "user/addClient";
        }
        User user = clientRepository.findUserIdWhereClientId(id);
        client.setUser(user);
        clientRepository.save(client);
        return "redirect:../../allClients";
    }

    @RequestMapping(value = "client/{clientId}/allTransactions", method = RequestMethod.GET)
    public String getAllTransactionsForClient(Model model, @PathVariable Long clientId) {
        model.addAttribute("allTransactionsforClient", transactionRepository.findTransactionByClientId(clientId));
        return "client/transactionList";
    }

    @RequestMapping(value = "/admin/clint/{id}/disable", method = RequestMethod.GET)
    public String disableClientByAdmin(@PathVariable Long id) {
        clientUtils.disableClientByAdmin(id);
        return "redirect:../../admin/allUsers";
    }

    @RequestMapping(value = "/admin/client/{id}/enable", method = RequestMethod.GET)
    public String enableClientByAdmin(@PathVariable Long id) {
        User user = userRepository.findUserById(id);
        user.setEnabled(true);
        userRepository.save(user);
        return "redirect:../../admin/allUsers";
    }

}
