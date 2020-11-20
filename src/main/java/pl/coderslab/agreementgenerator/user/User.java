package pl.coderslab.agreementgenerator.user;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.agreementgenerator.validation.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Getter
@Setter
@ConfirmPassword(groups = {AddUserValidationGroup.class, ChangePasswordValidators.class}, message = "hasła muszą być takie same")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 60)
    @NotEmpty(message = "To pole jest wymagane",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class, ResetPasswordValidationGroup.class})
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class, ResetPasswordValidationGroup.class})
    @Pattern(regexp = "[a-zA-Z0-9]*", message = "błędny format, dopuszczalne tylko cyfry i litery",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class, ResetPasswordValidationGroup.class})
    private String username;

    @NotEmpty(message = "To pole jest wymagane",
            groups = {AddUserValidationGroup.class})
    @Size(min = 3, max = 100, message = "nieprawidłowe dane, minimalna długość to 3",
            groups = {AddUserValidationGroup.class, ChangePasswordValidators.class})
    private String password;

    @Transient
    private String confirmPassword;

    private boolean enabled;

    private Role role;

    @NotEmpty(message = "To pole jest wymagane",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    private String firstName;

    @NotEmpty(message = "To pole jest wymagane",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    @Size(min = 3, max = 30, message = "nieprawidłowe dane, minimalna długość to 3, maksymalna 30 znaków",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    private String lastName;

    @NotEmpty(message = "To pole jest wymagane",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    @Email(groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    @Size(max = 40, message = "maksymalna długość to 40 znaków",
            groups = {AddUserValidationGroup.class, EditUserValidationGroup.class})
    private String email;

    public String getFullname() {
        return firstName + " " + lastName;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}