package pl.coderslab.agreementgenerator.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
 
    private final UserService userService;
 
    public UserController(UserService userService) {
        this.userService = userService;
    }

//    @GetMapping("/create-user")
//    public String createUser() {
//        User user = new User();
//        user.setUsername("admin");
//        user.setPassword("admin123");
//        user.setRole(Role.ROLE_ADMIN);
//        userService.saveUser(user);
//        return "redirect:/";
//    }


}