package pl.coderslab.agreementgenerator.client;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ClientUtils {

    private ClientRepository clientRepository;

    public ClientUtils(ClientRepository clientRepository) {
        this.clientRepository = clientRepository;
    }

    public void disableClientByAdmin(Long id) {

        Client client = clientRepository.findClientById(id);
        client.setActive(false);
        clientRepository.save(client);

    }


}
