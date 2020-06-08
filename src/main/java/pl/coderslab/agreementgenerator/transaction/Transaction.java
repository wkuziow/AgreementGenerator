package pl.coderslab.agreementgenerator.transaction;

import lombok.Getter;
import lombok.Setter;
import org.springframework.ui.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.time.LocalDate;

@Entity
@Setter
@Getter
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDate dateOfSign;
    private boolean isActive;
    private boolean hasValidDate;
    private LocalDate validDate;
    private String currency;
    private double amount;
    private boolean isTerminated;
    private LocalDate terminationDate;
    private String repaymentAccount;
    private String collaterals;
    private ReferenceRate referenceRate;
    private double setUpFee;
    private double arrangementFee;
    private double administrationFee;
    private double operationalFee;
    private double margin;
}
