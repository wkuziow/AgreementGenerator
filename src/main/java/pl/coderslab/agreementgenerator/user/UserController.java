package pl.coderslab.agreementgenerator.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.agreementgenerator.ConfirmationToken.ConfirmationToken;
import pl.coderslab.agreementgenerator.ConfirmationToken.ConfirmationTokenRepository;
import pl.coderslab.agreementgenerator.ConfirmationToken.EmailSenderService;
import pl.coderslab.agreementgenerator.validation.AddUserValidationGroup;
import pl.coderslab.agreementgenerator.validation.ChangePasswordValidators;
import pl.coderslab.agreementgenerator.validation.EditUserValidationGroup;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;
    private final UserService userService;
    private UserMethods userMethods;
    private ConfirmationTokenRepository confirmationTokenRepository;
    private EmailSenderService emailSenderService;

    public UserController(UserService userService, UserMethods userMethods, ConfirmationTokenRepository confirmationTokenRepository, EmailSenderService emailSenderService) {
        this.userService = userService;
        this.userMethods = userMethods;
        this.confirmationTokenRepository = confirmationTokenRepository;
        this.emailSenderService = emailSenderService;
    }

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
        model.addAttribute("mode", "add");
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/admin/addUser", method = RequestMethod.POST)
    public String addUserByAdminProcessForm(Model model,
                                            @ModelAttribute @Validated({AddUserValidationGroup.class}) User user,
                                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "add");
            return "admin/addUser";
        }

        user.setEnabled(false);
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
        model.addAttribute("mode", "edit");
        User user = userRepository.findUserById(id);
        model.addAttribute("user", user);
        return "admin/addUser";
    }

    @PostMapping("/admin/user/update/{id}")
    public String updateUserByAdminPost(Model model,@PathVariable Long id, @ModelAttribute @Validated({EditUserValidationGroup.class}) User user,
                                        BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "edit");
            return "admin/addUser";
        }
        User baseUser = userRepository.findUserById(id);
        //user.setEnabled(userRepository.findUserById(id).isEnabled());
        //userRepository.save(user);
        userMethods.saveEditedUser(user, baseUser);
        return "redirect:../../allUsers";
    }

    @RequestMapping(value = "/admin/addAdmin", method = RequestMethod.GET)
    public String addAdminByAdminGetForm(Model model) {
        model.addAttribute("mode", "add");
        model.addAttribute("user", new User());
        return "admin/addAdmin";
    }



    @RequestMapping(value = "/admin/addAdmin", method = RequestMethod.POST)
    public String addAdminByAdminProcessForm(Model model, @ModelAttribute
                                                 @Validated
            ({AddUserValidationGroup.class})
                                                         User user,
                                            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "add");
            return "admin/addAdmin";
        }

        user.setEnabled(false);
        user.setRole(Role.ROLE_ADMIN);
        userService.saveUser(user);
        return "redirect:../admin/allUsers";
    }

    @GetMapping("/admin/admin/update/{id}")
    public String updateAdminByAdminGet(@PathVariable Long id, Model model) {

        model.addAttribute("mode", "edit");
        User admin = userRepository.findUserById(id);
        model.addAttribute("user", admin);
        return "admin/addAdmin";
    }

    @PostMapping("/admin/admin/update/{id}")
    public String updateAdminByAdminPost(Model model, @PathVariable Long id, @ModelAttribute @Validated({EditUserValidationGroup.class}) User user,
                                        BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "edit");
            return "admin/addAdmin";
        }
        User baseUser = userRepository.findUserById(id);

        //admin.setEnabled(userRepository.findUserById(id).getEnabled());
        //admin.setRole(Role.ROLE_ADMIN);
        userMethods.saveEditedAdmin(user, baseUser);
        return "redirect:../../allUsers";
    }

    @RequestMapping(value = "/admin/{id}/disable", method = RequestMethod.GET)
    public String disableUserByAdmin (@PathVariable Long id) {
        User user = userRepository.findUserById(id);
        user.setEnabled(false);
        userRepository.save(user);
        return "redirect:../../admin/allUsers";
    }

    @RequestMapping(value = "/admin/{id}/enable", method = RequestMethod.GET)
    public String enableUserByAdmin (@PathVariable Long id) {
        User user = userRepository.findUserById(id);
        user.setEnabled(true);
        userRepository.save(user);
        return "redirect:../../admin/allUsers";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerUserGetForm(Model model) {
        model.addAttribute("mode", "add");
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUserProcessForm(@ModelAttribute @Validated({AddUserValidationGroup.class}) User user,
                                            BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "add");
            return "admin/addUser";
        }

        user.setEnabled(false);
        userService.saveUser(user);

        ConfirmationToken confirmationToken = new ConfirmationToken(user);

        confirmationTokenRepository.save(confirmationToken);

        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(user.getEmail());
        mailMessage.setSubject("Complete Registration!");
        mailMessage.setFrom("donotreply@gmail.com");
        mailMessage.setText("To confirm your account, please click here : "
                +"http://localhost:8080/confirm-account?token="+confirmationToken.getConfirmationToken());

        emailSenderService.sendEmail(mailMessage);

        model.addAttribute("emailId", user.getEmail());
        String message = "Gratulacje, pomyślnie zarejestrowałeś się. " +
                "Sprawdź swoją pocztę, wysłaliśmy link aktywacyjny.";
        model.addAttribute("message", message);

        //modelAndView.setViewName("successfulRegisteration");
        return "home/success";
    }

    @RequestMapping(value="/confirm-account", method= {RequestMethod.GET, RequestMethod.POST})
    public String confirmUserAccount(Model model, @RequestParam("token")String confirmationToken)
    {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        String result = "";

        if(token != null)
        {
            User user = userRepository.findByEmailIgnoreCase(token.getUser().getEmail());
            user.setEnabled(true);
            userRepository.save(user);
            confirmationTokenRepository.delete(token);
            result = "redirect:/login";
        } else {

            result = "errors/tokenError";
        }
        return result;
    }

    @RequestMapping(value = "/user/changePassword", method = RequestMethod.GET)
    public String changePasswordByUserGetForm(Model model) {
        model.addAttribute("mode", "pass");
        //User user = customUser.getUser();
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/user/changePassword", method = RequestMethod.POST)
    public String changePasswordByUserPostForm(@Validated({ChangePasswordValidators.class}) User user,
                                               BindingResult bindingResult, Model model,
                                               @AuthenticationPrincipal CurrentUser customUser) {
        if (bindingResult.hasErrors()) {
          model.addAttribute("mode", "pass");
          //  model.addAttribute("bindingResult", bindingResult);
            return "admin/addUser";
        }
        User baseUser = customUser.getUser();
        userMethods.changePassword(user, baseUser);
        return "redirect:/";
    }

    @GetMapping("/admin/admin/update")
    public String testupdateAdminByAdminGet(
            HttpSession session,
            Model model
            ) {
        Long userId = (Long) session.getAttribute("userId");
        model.addAttribute("mode", "edit");
        User admin = userRepository.findUserById(userId);
        model.addAttribute("user", admin);
        return "admin/addAdmin";
    }

    @PostMapping("/admin/admin/update")
    public String testupdateAdminByAdminPost(Model model,
                                             @ModelAttribute @Validated({EditUserValidationGroup.class}) User user,
                                         BindingResult bindingResult,
                                             HttpSession session) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "edit");
            return "admin/addAdmin";
        }
        Long id = (Long) session.getAttribute("userId");
        User baseUser = userRepository.findUserById(id);

        //admin.setEnabled(userRepository.findUserById(id).getEnabled());
        //admin.setRole(Role.ROLE_ADMIN);
        userMethods.saveEditedAdmin(user, baseUser);
        return "redirect:../allUsers";
    }


    @PostMapping("/admin/allUsers")
    public String formTestPost(@RequestParam Long userId,
                               @RequestParam String role,
                               Model model, HttpSession session) {
        session.setAttribute("userId", userId);
        session.setAttribute("role", role);
        return "redirect:../admin/"+role+"/update";
    }


    @GetMapping("/admin/user/update")
    public String testupdateUserByAdminGet(HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("userId");
        model.addAttribute("mode", "edit");
        User user = userRepository.findUserById(userId);
        model.addAttribute("user", user);
        return "admin/addUser";
    }

    @PostMapping("/admin/user/update")
    public String testupdateUserByAdminPost(Model model,HttpSession session, @ModelAttribute @Validated({EditUserValidationGroup.class}) User user,
                                        BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mode", "edit");
            return "admin/addUser";
        }
        Long userId = (Long) session.getAttribute("userId");
        User baseUser = userRepository.findUserById(userId);
        //user.setEnabled(userRepository.findUserById(id).isEnabled());
        //userRepository.save(user);
        userMethods.saveEditedUser(user, baseUser);
        return "redirect:../allUsers";
    }

}