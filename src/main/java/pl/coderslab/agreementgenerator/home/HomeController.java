package pl.coderslab.agreementgenerator.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.agreementgenerator.ConfirmationToken.ConfirmationToken;
import pl.coderslab.agreementgenerator.ConfirmationToken.ConfirmationTokenRepository;
import pl.coderslab.agreementgenerator.ConfirmationToken.EmailSenderService;
import pl.coderslab.agreementgenerator.user.*;
import pl.coderslab.agreementgenerator.validation.ChangePasswordValidators;
import pl.coderslab.agreementgenerator.validation.ResetPasswordValidationGroup;

import java.util.Random;

@Controller
public class HomeController {
    @Autowired
    private UserRepository userRepository;
    private UserService userService;
    private ConfirmationTokenRepository confirmationTokenRepository;
    private EmailSenderService emailSenderService;
    private UserMethods userMethods;

    public HomeController(UserService userService, ConfirmationTokenRepository confirmationTokenRepository, EmailSenderService emailSenderService, UserMethods userMethods) {
        this.userService = userService;
        this.confirmationTokenRepository = confirmationTokenRepository;
        this.emailSenderService = emailSenderService;
        this.userMethods = userMethods;
    }

    @RequestMapping("/")
    public String home() {

        return "home/home";
    }

    @ModelAttribute("currentUserFullName")
    public String currentUser(@AuthenticationPrincipal CurrentUser customUser, Model model) {
        String currentUser = "-1";
        if (customUser != null) {
            currentUser = customUser.getUser().getFullname();
        }
        return currentUser;
    }

    @RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
    public String resetPasswordGet(Model model) {
        model.addAttribute("mode", "reset");
        model.addAttribute("user", new User());
        return "admin/addUser";
    }

    @RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
    public String resetPasswordPost(@ModelAttribute @Validated({ResetPasswordValidationGroup.class}) User user, BindingResult bindingResult, Model model) {
        User existingUser = userRepository.findByUsernameIgnoreCase(user.getUsername());
        if (existingUser == null) {
            bindingResult.addError(new FieldError("user", "username", "xxx"));
        }
        if (bindingResult.hasErrors()) {
            return "resetpassword";
        }
        existingUser.setEnabled(false);
        Random generator = new Random();
        int rand = generator.nextInt() * 100000;
        ConfirmationToken confirmationToken = new ConfirmationToken(existingUser);
        existingUser.setPassword(confirmationToken.getConfirmationToken() + rand);
        userService.saveUser(existingUser);
        confirmationTokenRepository.save(confirmationToken);
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setTo(existingUser.getEmail());
        mailMessage.setSubject("Reset password");
        mailMessage.setText("To reset your password, please click here : "
                +"http://localhost:8080/reset-password?token="+confirmationToken.getConfirmationToken());
        emailSenderService.sendEmail(mailMessage);
        return "home/passwordSuccess";
    }

    @RequestMapping(value="/reset-password", method= RequestMethod.GET)
    public String changePasswordByUserGetForm(Model model) {

            model.addAttribute("mode", "pass");
            model.addAttribute("user", new User());

            return "admin/addUser";

    }


    @RequestMapping(value = "/reset-password", method = RequestMethod.POST)
    public String changePasswordByUserPostForm(@Validated({ChangePasswordValidators.class}) User user,
                                               BindingResult bindingResult, Model model,
                                               @RequestParam("token")String confirmationToken) {

        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        String result = "";

        if(token != null)
        {
            if (bindingResult.hasErrors()) {
                model.addAttribute("mode", "pass");
                return "admin/addUser";
            }

            User baseUser = userRepository.findByEmailIgnoreCase(token.getUser().getEmail());

            baseUser.setEnabled(true);
            userMethods.changePassword(user, baseUser);

            userRepository.save(baseUser);
            confirmationTokenRepository.delete(token);
            model.addAttribute("message", "Gratulacje, hasło zmienione, możesz się zalogować");
            result = "home/success";

        } else {
            result = "errors/tokenError";
        }

        return result;
    }
}