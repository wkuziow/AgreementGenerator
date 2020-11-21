package pl.coderslab.agreementgenerator.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.agreementgenerator.user.CurrentUser;

@Controller
public class LoginController {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoggerFactory.class);

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        LOGGER.info("/login");
        return "home/login";
    }

    @ModelAttribute("currentUserFullName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = "-1";
        if (customUser != null) {
            currentUser = customUser.getUser().getFullname();
        }
        return currentUser;
    }
}
