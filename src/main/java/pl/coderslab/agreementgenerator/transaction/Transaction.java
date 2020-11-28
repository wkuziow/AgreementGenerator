package pl.coderslab.agreementgenerator.transaction;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.agreementgenerator.client.Client;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Entity
@Getter
@Setter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "To pole nie może być puste")
    @FutureOrPresent(message = "Data zawarcia musi być w przyszłości")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dateOfSign;

    @Column(columnDefinition = "boolean default false")
    private boolean isActive;

    @Column(columnDefinition = "boolean default true")
    private boolean hasValidDate;

    @FutureOrPresent(message = "Data zawarcia musi być w przyszłości")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate validDate;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(min = 3, max = 3, message = "Błędna wartość")
    private String currency;

    @NotNull(message = "To pole nie może być puste")
    @Min(value = 1, message = "To pole nie może być puste")
    @Max(value = 1999999999, message = "Nieprawidłowa wartość")
    private double amount;

    @Column(columnDefinition = "boolean default false")
    private boolean isTerminated;

    @FutureOrPresent
    private LocalDate terminationDate;

    @NotEmpty(message = "To pole nie może być puste")
    @Size(max = 40, message = "Maksymalna długość to 40 znaków")
    private String repaymentAccount;

    @NotEmpty(message = "To pole nie może być puste")
    private String collaterals;

    private ReferenceRate referenceRate;

    @Max(value = 100, message = "Nieprawidłowa wartość")
    @Min(value = 0, message = "Nieprawidłowa wartość")
    private double setUpFee;

    @Max(value = 100, message = "Nieprawidłowa wartość")
    @Min(value = 0, message = "Nieprawidłowa wartość")
    private double arrangementFee;

    @Max(value = 100, message = "Nieprawidłowa wartość")
    @Min(value = 0, message = "Nieprawidłowa wartość")
    private double administrationFee;

    @Max(value = 100, message = "Nieprawidłowa wartość")
    @Min(value = 0, message = "Nieprawidłowa wartość")
    private double operationalFee;

    @DecimalMin(value = "0.001", message = "To pole nie może być puste")
    @Max(value = 100, message = "Nieprawidłowa wartość")
    private double margin;

    @ManyToOne(fetch = FetchType.EAGER)
    private Client client;

    public String getFees() {
        return "Setup fee: " + setUpFee + "%, arrangament fee: " + arrangementFee
                + "%, administration fee: " + administrationFee + "%, operational fee: "
                + "%.";
    }

    public Long getId() {
        return id;
    }


    public void setClient(Client client) {
        this.client = client;
    }

    public Client getClient() {
        return client;
    }



}
