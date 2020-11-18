package pl.coderslab.agreementgenerator.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = ConfirmPasswordValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ConfirmPassword {
    String message() default "Podane hasła muszą być jednakowe.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}