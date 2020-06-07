package pl.coderslab.agreementgenerator.home;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.agreementgenerator.user.CurrentUser;
import pl.coderslab.agreementgenerator.user.User;

@Controller

public class HomeController {

    @RequestMapping("/")
    public String home() {
        return "home/home";
    }



    @GetMapping("/about")
    public String about() {
        return "home/about";
    }

    @ModelAttribute("currentUserFisrtName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        User entityUser = customUser.getUser();
        return entityUser.getFirstName();
    }

}