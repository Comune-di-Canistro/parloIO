package it.comunecanistro.parlo_io.configurations;

import freemarker.template.TemplateModelException;
import it.comunecanistro.parlo_io.enums.FtlSharedVariables;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.annotation.PostConstruct;
import java.util.List;

@Configuration
public class FreemarkerConfiguration {

    @Value("${municipality.name}")
    private String municipalityName;

    @Value("${municipality.logo}")
    private String municipalityLogo;

    @Value("${municipality.url}")
    private String municipalityUrl;

    @Value("${municipality.subtitle}")
    private String municipalitySubtitle;

    @Value("${afferent.administration.name}")
    private String afferentAdministrationName;

    @Value("${afferent.administration.url}")
    private String afferentAdministrationUrl;

    @Value("${info.application.version}")
    private String version;

    private final freemarker.template.Configuration configuration;

    public FreemarkerConfiguration(freemarker.template.Configuration configuration, FreeMarkerConfigurer freeMarkerConfigurer) {
        this.configuration = configuration;
        freeMarkerConfigurer.getTaglibFactory().setClasspathTlds(List.of("/META-INF/security.tld"));
    }

    @PostConstruct
    public void init() throws TemplateModelException {
        this.configuration.setSharedVariable(
                FtlSharedVariables.MUNICIPALITY_NAME.getFtlSharedVariable(), municipalityName);
        this.configuration.setSharedVariable(
                FtlSharedVariables.MUNICIPALITY_SUBTITLE.getFtlSharedVariable(), municipalitySubtitle);
        this.configuration.setSharedVariable(
                FtlSharedVariables.MUNICIPALITY_LOGO.getFtlSharedVariable(), municipalityLogo);
        this.configuration.setSharedVariable(
                FtlSharedVariables.MUNICIPALITY_URL.getFtlSharedVariable(), municipalityUrl);
        this.configuration.setSharedVariable(
                FtlSharedVariables.AFFERENT_ADMINISTRATION_NAME.getFtlSharedVariable(), afferentAdministrationName);
        this.configuration.setSharedVariable(
                FtlSharedVariables.AFFERENT_ADMINISTRATION_URL.getFtlSharedVariable(), afferentAdministrationUrl);
        this.configuration.setSharedVariable(
                FtlSharedVariables.PORTAL_VERSION.getFtlSharedVariable(), version);
    }

}
