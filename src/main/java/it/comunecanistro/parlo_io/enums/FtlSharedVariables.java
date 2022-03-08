package it.comunecanistro.parlo_io.enums;

import lombok.Getter;

@Getter
public enum FtlSharedVariables {

    PORTAL_VERSION("portalVersion"),
    MUNICIPALITY_NAME("municipalityName"),
    MUNICIPALITY_LOGO("municipalityLogo"),
    MUNICIPALITY_URL("municipalityUrl"),
    MUNICIPALITY_SUBTITLE("municipalitySubtitle"),
    AFFERENT_ADMINISTRATION_NAME("afferentAdministrationName"),
    AFFERENT_ADMINISTRATION_URL("afferentAdministrationUrl");

    private final String ftlSharedVariable;

    FtlSharedVariables(String ftlSharedVariable) {
        this.ftlSharedVariable = ftlSharedVariable;
    }

}
