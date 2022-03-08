<html lang="it">
<head>
    <link href="/css/bootstrap-italia.min.css" rel="stylesheet"/>
    <link href="/css/main.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Portale Allerte Meteo</title>
</head>
<body>

<#include '../macro/macro-weather-warnings-table.ftlh'>
<#include '../macro/macro-users-table.ftlh'>
<#include '../macro/macro-operators-table.ftlh'>

<div class="it-header-wrapper">
    <div class="it-header-slim-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="it-header-slim-wrapper-content">
                        <a class="d-none d-lg-block navbar-brand"
                           href="${afferentAdministrationUrl}">${afferentAdministrationName}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="it-nav-wrapper">
        <div class="it-header-center-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="it-header-center-content-wrapper">
                            <div class="it-brand-wrapper">
                                <a href="#">
                                    <img class="icon"
                                         src="${municipalityLogo}"
                                         alt="Comune di ${municipalityName}"/>
                                    <div class="it-brand-text">
                                        <h2 class="no_toc">Comune di ${municipalityName}</h2>
                                        <h3 class="no_toc d-none d-md-block">${municipalitySubtitle}</h3>
                                    </div>
                                </a>
                            </div>

                            <#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
                            <@security.authorize access="isAuthenticated()">

                                <div class="it-right-zone">
                                    <div class="it-search-wrapper">
                                    <span class="d-none d-md-block">
                                        <@security.authorize access="hasAnyAuthority('ADMIN')">
                                            <p class="text-right mb-0"> <strong>Sei un Amministratore! </strong>  <br></p>
                                        </@security.authorize>
                                        <@security.authorize access="hasAnyAuthority('OPERATOR')">
                                            <p class="text-right mb-0"> <strong>Sei un Operatore! </strong>  <br></p>
                                        </@security.authorize>
                                        <p class="text-right mb-0"><@security.authentication property="principal.firstName" /> <@security.authentication property="principal.familyName" /><br></p>
                                    </span>
                                        <a class="search-link rounded-icon" href="/logout" aria-label="Logout"
                                           title="Logout">
                                            <strong>
                                                <svg class="icon">
                                                    <use transform="rotate(-90 12 12)"
                                                         xlink:href="/svg/sprite.svg#it-upload"></use>
                                                </svg>
                                            </strong>
                                        </a>
                                    </div>
                                </div>

                            </@security.authorize>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>