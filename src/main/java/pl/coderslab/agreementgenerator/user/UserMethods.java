package pl.coderslab.agreementgenerator.user;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserMethods {

    private UserRepository userRepository;

    public UserMethods(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    protected void saveEditedUser(User user, User baseUser) {
        baseUser.setEmail(user.getEmail());
        baseUser.setFirstName(user.getFirstName());
        baseUser.setLastName(user.getLastName());
        baseUser.setUsername(user.getUsername());
        baseUser.setRole(user.getRole());
    //    baseUser.setEnabled(user.getEnabled());
        userRepository.save(baseUser);
    }

    protected void saveEditedAdmin(User admin, User baseAdmin) {
        baseAdmin.setEmail(admin.getEmail());
        baseAdmin.setFirstName(admin.getFirstName());
        baseAdmin.setLastName(admin.getLastName());
        baseAdmin.setUsername(admin.getUsername());
        //baseAdmin.setRole(admin.getRole());
        //    baseUser.setEnabled(user.getEnabled());
        userRepository.save(baseAdmin);
    }

}
