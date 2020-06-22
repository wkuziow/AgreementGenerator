package pl.coderslab.agreementgenerator.transaction;

import lombok.Getter;
import lombok.Setter;
import org.springframework.ui.Model;
import pl.coderslab.agreementgenerator.client.Client;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Entity
@Setter
@Getter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "To pole nie może być puste")
    private String dateOfSign;

    @Column(columnDefinition = "boolean default false")
    private boolean isActive;

    @Column(columnDefinition = "boolean default true")
    private boolean hasValidDate;

    private String validDate;

    @NotEmpty(message = "To pole nie może być puste")
    private String currency;

    @NotNull(message = "To pole nie może być puste")
    @Min(value = 1, message = "To pole nie może być puste")
    private double amount;

    @Column(columnDefinition = "boolean default false")
    private boolean isTerminated;

    private String terminationDate;

    @NotEmpty(message = "To pole nie może być puste")
    private String repaymentAccount;

    @NotEmpty(message = "To pole nie może być puste")
    private String collaterals;

    private ReferenceRate referenceRate;

    //@Pattern(regexp = "\\d+(\\.\\d{1,2})?",message = "Nieprawidłowy format danych")
    private double setUpFee;

    // @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double arrangementFee;

    //   @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double administrationFee;

    // @Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    private double operationalFee;

    //@NotNull(message = "To pole nie może być puste")
    //@Pattern(regexp = "\\d+(\\.\\d{1,2})?", message = "Nieprawidłowy format danych")
    @DecimalMin(value = "0.001", message = "To pole nie może być puste")
    private double margin;

    @ManyToOne(fetch = FetchType.EAGER)
    private Client client;

    public String getFees() {
        return "Setup fee: " + setUpFee + "%, arrangament fee: " + arrangementFee
                + "%, administration fee: " + administrationFee + "%, operational fee: "
                + "%.";
    }
}
