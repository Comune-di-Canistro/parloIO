<html lang="it">
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
                                    <h4 class="text-white">Rinnovo password</h4>
                                    <p class="text-white">Inserisci una nuova password ${username!}</p>
                                </div>
                            </div>

                            <div>

                                <div class="card-body">
                                    <div class="form-row col-sm-6 mx-auto">
                                        <div class="col-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <svg class="icon icon-sm icon-primary">
                                                            <use xlink:href="/svg/sprite.svg#it-locked"></use>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <input type="password" class="form-control col-12"
                                                       id="psw1"
                                                       autocomplete="0" placeholder="Nuova Password" name="psw1">
                                            </div>
                                        </div>

                                        <div class="col-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <svg class="icon icon-sm icon-primary">
                                                            <use xlink:href="/svg/sprite.svg#it-locked"></use>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <input type="password" class="form-control col-12"
                                                       id="psw2"
                                                       autocomplete="0" placeholder="Conferma Password" name="psw2">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row pt-2 d-flex justify-content-center">
                                        <button onclick="passwordRenewal('${username}')"
                                                class="btn btn-white text-primary col-sm-4 col-10 text-uppercase"
                                                title="Conferma">
                                            Conferma
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

    <div class="row mb-lg-5">
        <div class="col-12">
            <div class="row d-flex justify-content-center">
                <button onclick="location.href = '/login'"
                        class="btn btn-primary text-uppercase"
                        title="toLogin">
                    Torna alla login
                </button>
            </div>
        </div>
    </div>

    <div class="notification with-icon success" role="alert" aria-labelledby="not2dms-title"
         id="pswChangedNotification">
        <h5 id="not2dms-title">
            <svg class="icon">
                <use href="/svg/sprite.svg#it-check-circle"></use>
            </svg>
            Password aggiornata
        </h5>
        <p>La password è stata aggiornata con successo</p>
    </div>

</div>

<script>
    function passwordRenewal(username) {

        const payload = {
            'password': $('#psw1').val(),
            'confirmPassword': $('#psw2').val()
        }

        axios.post("/login/password-renewal/" + username, payload)
            .then(response => {
                if (response.status === 200) {

                    $('#psw1').val("")
                    $('#psw2').val("")
                    notificationShow('pswChangedNotification')

                }
            })
            .catch(error => {
                const status = error.response.status;

                if (status === 400) {
                    console.log("Bad Request")
                } else {
                    console.log("Temp Error")
                }
            })

    }
</script>
<#include "./layout/footer.ftlh">

</body>
</html>