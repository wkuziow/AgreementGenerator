package pl.coderslab.agreementgenerator.client;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.agreementgenerator.user.User;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Setter
@Getter
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min=3,max = 30, message = "długość pola to minimalnie 3 a maksylanie 30 znaków")
    private String name;

    private boolean isActive;

    @NotEmpty(message = "To pole nie może być puste")
    @org.hibernate.validator.constraints.pl.NIP (message = "Nieprawidłowy format danych")
    private String NIP;

    @NotEmpty(message = "To pole nie może być puste")
    @org.hibernate.validator.constraints.pl.REGON (message = "Nieprawidłowy format danych")
    private String REGON;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min=3, max = 40, message = "minimalna długość pola to 3, a maksymana 40 znaków")
    private String street;

    @NotEmpty(message = "To pole nie może być puste")
    @Pattern(regexp = "\\d{2}-\\d{3}", message = "Nieprawidłowy format danych")
    @Size(max=6, message = "maksymalna długość to 6 znaków")
    private String postalCode;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min=1, max = 7, message = "minimalna długość pola to 1, a maksymana 7 znaków")
    private String blockNumber;

    @Size(max = 7, message = "maksymalna długość pola to 7 znaków")
    private String flatNumber;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min =3, max = 40, message = "minimalna długość to 3 a maksymana to 40 znaków")
    private String town;

    @Size(max = 40, message = "maksymalna dłogość pola to 40 znaków")
    @Pattern(regexp = "^$|^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\\s\\./0-9]*$" , message = "Nieprawidłowy format")
    private String phone;

    @Email(message = "nieprawidłowy format danych")
    @Size(max = 40, message = "maksymana długość pola 40 znaków")
    private String email;

    private boolean softDelete;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min=3, max = 40, message = "minimalna długość pola to 3, a maksymana 40 znaków")
    private String account;

    @Size(max = 40, message = "maksymalna dłogość pola to 40 znaków")
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

    public void setActive(boolean active) {
        isActive = active;
    }
}
