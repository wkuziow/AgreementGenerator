package pl.coderslab.agreementgenerator.user;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
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
    public String addUserByAdminGetForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
    public String addUserByAdminProcessForm(@ModelAttribute @Validated User user,
                                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/addUser";
        }

        userService.saveUser(user);
        return "redirect:../admin/allUsers";
    }

    @ModelAttribute("enabledList")
    public List<Boolean> enabledList() {
        return Arrays.asList(true, false);
    }

    @ModelAttribute("roleList")
    public List<Role> roleList() {
        return Arrays.asList(Role.ROLE_USER, Role.ROLE_SUPERVISOR);
    }

    @GetMapping("/about")
    public String about() {
        return "home/about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "home/contact";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "home/dashboard";
    }

    @ModelAttribute("currentUserFullName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = "-1";
        if (customUser != null) {
            currentUser = customUser.getUser().getFullname();
        }
        return currentUser;
    }

    @RequestMapping(value = "/admin/allUsers", method = RequestMethod.GET)
    public String getAllUsersForAdmin(Model model) {
        model.addAttribute("allUsersForAdmin", userRepository.findAll());
        return "admin/userList";
    }

    @GetMapping("/admin/user/update/{id}")
    public String updateUserByAdminGet(@PathVariable Long id, Model model) {
        User user = userRepository.findUserById(id);
        model.addAttribute("user", user);
        return "admin/addUser";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUserByAdminPost(@PathVariable Long id, @ModelAttribute @Validated User user,
                                        BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "admin/addUser";
        }

        userRepository.save(user);
        return "redirect:../../allUsers";
    }
}