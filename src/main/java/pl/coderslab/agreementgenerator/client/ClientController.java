package pl.coderslab.agreementgenerator.client;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequiredArgsConstructor
public class ClientController {
    @Autowired
    private ClientRepository clientRepository;

    //    public ClientController(ClientRepository clientRepository) {
//        this.clientRepository = clientRepository;
//    }
    @Secured("ROLE_ADMIN")
    @RequestMapping(value = "/admin/allClients", method = RequestMethod.GET)
    public String getAllClientsForAdmin(Model model) {
        model.addAttribute("allClientsForAdmin", clientRepository.findAll());
        return "admin/clientList";
    }
}
