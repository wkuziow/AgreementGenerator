package pl.coderslab.agreementgenerator.client;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.agreementgenerator.user.User;

import java.util.List;

public interface ClientRepository extends JpaRepository<Client, Long> {

    List<Client> findAllByUser(User user);
    Client findClientById(Long id);
    @Query("select c.user from Client c where c.id = ?1")
    User findUserIdWhereClientId(Long id);
}
