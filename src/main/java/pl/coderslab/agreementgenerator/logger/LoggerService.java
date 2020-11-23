package pl.coderslab.agreementgenerator.logger;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class LoggerService {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoggerService.class);
}
