package pl.coderslab.agreementgenerator.user;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private UserRepository userRepository;
    private final UserService userService;

//    public UserController(UserService userService) {
//        this.userService = userService;
//    }

//    @GetMapping("/create-user")
//    public String createUser() {
//        User user = new User();
//        user.setUsername("admin");
//        user.setPassword("admin123");
//        user.setRole(Role.ROLE_ADMIN);
//        userService.saveUser(user);
//        return "redirect:/";
//    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.GET)
    public String addUserGetForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
    public String addUserProcessForm(@ModelAttribute @Validated User user,
                                     BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/addUser";
        }

        userService.saveUser(user);
        return "redirect:../";
    }

    @ModelAttribute("enabledList")
    public List<Boolean> enabledList() {
        return List.of(true, false);
    }

    @ModelAttribute("roleList")
    public List<Role> roleList() {
        return List.of(Role.ROLE_USER, Role.ROLE_SUPERVISOR);
    }

    @GetMapping("/about")
    public String about() {
        return "home/about";
    }

    @ModelAttribute("currentUserFisrtName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = customUser.getUser().getFullname();
        return currentUser;
    }
}