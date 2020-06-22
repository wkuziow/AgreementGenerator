package pl.coderslab.agreementgenerator.user;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Setter
@Getter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 60)
    @NotEmpty(message = "To pole jest wymagane")
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków")
    @Pattern(regexp = "[a-zA-Z0-9]*", message = "błędny format, dopuszczalne tylko cyfry i litery")
    private String username;

    @NotEmpty(message = "To pole jest wymagane")
    @Size(min = 3, max = 100, message = "nieprawidłowe dane, minimalna długość to 3")
    private String password;

    private boolean enabled;

    private Role role;

    @NotEmpty(message = "To pole jest wymagane")
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków")
    private String firstName;

    @NotEmpty(message = "To pole jest wymagane")
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków")
    private String lastName;

    @NotEmpty(message = "To pole jest wymagane")
    @Email
    @Size(max = 40, message = "maksymalna długość to 40 znaków")
    private String email;

    public String getFullname() {
        return firstName + " " + lastName;
    }
}