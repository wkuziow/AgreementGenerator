package pl.coderslab.agreementgenerator.transaction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Arrays;
import java.util.List;

@Controller
public class TransactionController {


    @ModelAttribute("isActiveList")
    public List<Boolean> isActiveList() {
        return List.of(true, false);
    }

    @ModelAttribute("hasValidDate")
    public List<Boolean> hasValidDate(){
        return List.of(true, false);
    }

    @ModelAttribute("referenceRateList")
    public List<ReferenceRate> getListOfReferenceRates(){
        return Arrays.asList(ReferenceRate.values());
    }


}
