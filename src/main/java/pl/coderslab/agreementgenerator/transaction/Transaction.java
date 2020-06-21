package pl.coderslab.agreementgenerator.transaction;

import lombok.Getter;
import lombok.Setter;
import org.springframework.ui.Model;
import pl.coderslab.agreementgenerator.client.Client;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Entity
@Setter
@Getter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "To pole nie może być puste")
    @PastOrPresent(message = "Data zawarcia nie może być w przyszłości")
    private String dateOfSign;
    @Column(columnDefinition = "default 'false'")
    private boolean isActive;
    @Column(columnDefinition = "default 'true'")
    private boolean hasValidDate;
    @Future(message = "Data ważności nie może być w przesłości")
    private String validDate;
    @NotEmpty(message = "To pole nie może być puste")
    private String currency;
    @Column(precision = 2)
    @NotEmpty(message = "To pole nie może być puste")
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double amount;
    @Column(columnDefinition = "default 'false'")
    private boolean isTerminated;
    private String terminationDate;
    @NotEmpty(message = "To pole nie może być puste")
    private String repaymentAccount;
    @NotEmpty(message = "To pole nie może być puste")
    private String collaterals;
    @NotEmpty(message = "To pole nie może być puste")
    private ReferenceRate referenceRate;
    @Column(scale = 2)
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double setUpFee;
    @Column(scale = 2)
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double arrangementFee;
    @Column(scale = 2)
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double administrationFee;
    @Column(scale = 2)
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double operationalFee;
    @Column(scale = 2)
    @NotEmpty(message = "To pole nie może być puste")
    @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double margin;
    @ManyToOne (fetch = FetchType.EAGER)
    private Client client;

    public String getFees() {
        return "Setup fee: " + setUpFee + "%, arrangament fee: " + arrangementFee
                + "%, administration fee: " + administrationFee + "%, operational fee: "
                + "%.";
    }
}
