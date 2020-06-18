package pl.coderslab.agreementgenerator.client;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.agreementgenerator.transaction.Transaction;
import pl.coderslab.agreementgenerator.user.User;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Setter
@Getter
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "To pole nie może być puste")
    private String name;
    private boolean isActive;
    private String NIP;
    private String REGON;
    private String street;
    private String postalCode;
    private String blockNumber;
    private String flatNumber;
    private String town;
    private String phone;
    private String email;
    private boolean softDelete;
    private String account;
    private String contactPerson;
    @ManyToOne (fetch = FetchType.EAGER)
    private User user;

    public String getAdress() {
        return street + " " + blockNumber + "/"
                + flatNumber + "; " + postalCode + " " + town;
    }

    public String getContactInfo() {
        return "email: " + email + ", phone: " + phone;
    }
}
