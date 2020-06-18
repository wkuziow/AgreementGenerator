package pl.coderslab.agreementgenerator.user;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Set;

@Entity
@Setter
@Getter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false, unique = true, length = 60)
    private String username;
    private String password;
    private boolean enabled;
    private Role role;
    @NotEmpty(message = "To pole nie może być puste")
    private String firstName;
    private String lastName;
    private String email;

    public String getFullname() {
        return firstName + " " + lastName;
    }
}