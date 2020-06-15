package pl.coderslab.agreementgenerator.agreement;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class AgreementWording {

    private final String umowa = "Umowa nr ";
    private final String zawarta =
            "Zawarta w: ";
    private final String dnia =
            "dnia: ";
    private final String roku =
            ".roku pomiędzy: ";
    private final String firmaa =
            "Firmą ";
    private final String zsiedziba =
            " z siedzibą w ";


}
