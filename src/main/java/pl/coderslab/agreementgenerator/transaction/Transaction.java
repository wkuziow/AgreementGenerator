package pl.coderslab.agreementgenerator.transaction;

import lombok.Getter;
import lombok.Setter;
import org.springframework.ui.Model;
import pl.coderslab.agreementgenerator.client.Client;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Setter
@Getter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String dateOfSign;
    private boolean isActive;
    private boolean hasValidDate;
    private String validDate;
    private String currency;
    private double amount;
    private boolean isTerminated;
    private String terminationDate;
    private String repaymentAccount;
    private String collaterals;
    private ReferenceRate referenceRate;
    private double setUpFee;
    private double arrangementFee;
    private double administrationFee;
    private double operationalFee;
    private double margin;
    @OneToOne
    private Client client;

    public String getFees() {
        return "Setup fee: " + setUpFee + "%, arrangament fee: " + arrangementFee
                + "%, administration fee: " + administrationFee + "%, operational fee: "
                + "%.";
    }
}
