package pl.coderslab.agreementgenerator.user;

public interface UserService {

    //User findByUserName(String name);

    void saveUser(User user);

    User findByUsernameAndEnabled(String username);
}