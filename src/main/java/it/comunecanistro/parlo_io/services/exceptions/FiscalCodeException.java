package it.comunecanistro.parlo_io.services.exceptions;

public class FiscalCodeException extends Exception {

    private String fiscalCode;

    public FiscalCodeException(String fiscalCode) {
        super(fiscalCode);
    }

}
