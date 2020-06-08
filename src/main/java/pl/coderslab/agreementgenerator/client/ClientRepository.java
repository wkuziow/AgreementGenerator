package pl.coderslab.agreementgenerator.client;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.agreementgenerator.user.User;

import java.util.List;

public interface ClientRepository extends JpaRepository<Client, Long> {

    List<Client> findAllByUser(User user);
}
