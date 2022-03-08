<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid">

    <#if !adminIsPresent!true>
        <div class="row mt-2">
            <div class="col-12">
                <div class="alert alert-warning" role="alert">
                    L'utente ${username!} non esiste
                </div>
            </div>
        </div>
    </#if>

    <#if adminIsPresent!false>
        <div class="row mt-2 mb-lg-5">
            <div class="col-12">
                <div class="alert alert-success" role="alert">
                    Email di recupero inviata con successo
                </div>
            </div>
        </div>
        <div class="row pt-2 d-flex justify-content-center mb-lg-5">
            <button onclick="location.href='/login'"
                    class="btn btn-primary text-uppercase"
                    title="toLogin">
                Torna alla Homepage
            </button>
        </div>
    </#if>

    <#if !adminIsPresent!false>
        <div class="row">
            <div class="col-12">

                <div class="section section-muted bg-white">
                    <div class="section-content mx-auto col-12 col-sm-10">

                        <div class="card-deck">
                            <div class="card shadow border-0 bg-primary">
                                <div class="row d-flex justify-content-center">
                                    <div class=" pt-5 pl-5 pr-5">
                                        <h4 class="text-white">Recupero password</h4>
                                        <p class="text-white">Inserisci la tua username per procedere al recupero della
                                            tua
                                            password.</p>
                                    </div>
                                </div>

                                <div>

                                    <div class="card-body">
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
                                                    <input type="text" class="form-control col-12"
                                                           id="usernameField"
                                                           autocomplete="0" placeholder="Username" name="username">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row pt-2 d-flex justify-content-center">
                                            <button onclick="passwordRecoveryRequest()"
                                                    class="btn btn-white text-primary col-sm-4 col-10 text-uppercase"
                                                    title="Recupera">
                                                Recupera
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>


</div>

<script>
    function passwordRecoveryRequest() {
        location.href = "/login/password-recovery/" + $('#usernameField').val()
    }
</script>
<#include "./layout/footer.ftlh">

</body>
</html>