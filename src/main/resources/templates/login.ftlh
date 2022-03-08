<html lang="it">
<head>
    <#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
    <@security.authorize access="isAuthenticated()">

        <meta http-equiv="refresh" content="0; url =
    /weather-warning"/>
    </@security.authorize>
</head>
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid">
    <div class="row">
        <div class="col-12">

            <div class="section section-muted bg-white">
                <div class="section-content mx-auto col-12 col-sm-10">

                    <div class="card-deck">
                        <div class="card shadow border-0 bg-primary">
                            <div class="row d-flex justify-content-center">
                                <div class=" pt-5 pl-5 pr-5">
                                    <h4 class="text-white">Benvenuto!</h4>
                                    <p class="text-white">Effettua l'accesso inserendo le tue credenziali.</p>
                                </div>
                            </div>

                            <div>
                                <form action="/login" method="post">
                                    <input type="hidden" name="csrfmiddlewaretoken"
                                           value="ziCIwGcjMnAEIZOugbuRagxgPE4PskBDZzRYbodtKsOUXaNILXWSvdAN09vXagvb">
                                    <div class="card-body ">
                                        <div class="form-row col-sm-6 mx-auto">
                                            <div class="col-12 ">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text">
                                                            <svg class="icon icon-sm icon-primary">
                                                                <use xlink:href="/svg/sprite.svg#it-user"></use>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <input type="text" class="form-control col-12" id="usernameField"
                                                           autocomplete="0" placeholder="Username" name="username">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row pt-4 col-sm-6 mx-auto">
                                            <div class="form-group col-12">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text ">
                                                            <svg class="icon icon-sm icon-primary">
                                                                <use xlink:href="/svg/sprite.svg#it-locked"></use>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <input type="password" autocomplete="off"
                                                           class="form-control col-12 input-password" id="passwordField"
                                                           name="password" aria-describedby="passwordHelp"
                                                           placeholder="Password">
                                                    <div class="input-group-append password-icon"
                                                         title="Mostra/Nascondi password">
                                                        <svg class="password-icon-visible icon icon-sm">
                                                            <use xlink:href="/svg/sprite.svg#it-password-visible"></use>
                                                        </svg>
                                                        <svg class="password-icon-invisible icon icon-sm d-none">
                                                            <use xlink:href="/svg/sprite.svg#it-password-invisible"></use>
                                                        </svg>
                                                    </div>
                                                </div>

                                                <a href="/login/password-recovery" class="text-white">Hai dimenticato
                                                    la password?</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-2 d-flex justify-content-center">
                                        <button type="submit"
                                                class="btn btn-white text-primary col-sm-4 col-10 text-uppercase"
                                                title="Login">
                                            Accedi
                                        </button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<#include "./layout/footer.ftlh">

</body>
</html>