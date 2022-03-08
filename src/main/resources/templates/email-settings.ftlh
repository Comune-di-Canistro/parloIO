<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid my-4">

    <div class="row">

        <div class="col-sm-12 col-md-2">
            <#include "./layout/sidebar.ftlh">
        </div>

        <div class="col-sm-12 col-md-10">

            <div id="message-form" class="needs-validation">
                <fieldset aria-label="Configurazione email">
                    <legend>Parametri di configurazione per email SMTP</legend>

                    <div class="row mt-4">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="email-from">Da</label>
                                <input type="text" id="email-from" class="form-control" placeholder="Comune di XXXXXXXX <comune@email.it>"
                                       required value="${(emailSetting.fromAddress)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-6">
                            <div class="form-group">
                                <label for="email-uname">Username</label>
                                <input type="text" id="email-uname" class="form-control"
                                       required value="${(emailSetting.username)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="password" autocomplete="new-password"
                                           class="form-control col-12 input-password" id="email-pwd" name="pwdRAOField"
                                           aria-describedby="pwdRAOFieldHelp" value="${(emailSetting.password)!}">
                                    <label for="email-pwd" class="" style="width: auto;">Password</label>
                                    <span class="password-icon " aria-hidden="true">
                                                <svg class="password-icon-visible icon icon-sm"><use
                                                            xlink:href="/svg/sprite.svg#it-password-visible"></use></svg>
                                                <svg class="password-icon-invisible icon icon-sm d-none"><use
                                                            xlink:href="/svg/sprite.svg#it-password-invisible"></use></svg>
                                            </span>
                                </div>
                                <small id="pwdRAOFieldHelp" class="form-text text-danger"></small>
                            </div>
                        </div>


                        <div class="col-sm-12 col-md-6">
                            <div class="form-group">
                                <label for="email-host">Host Posta in Uscita (SMTP)</label>
                                <input type="text" id="email-host" class="form-control"
                                       required value="${(emailSetting.host)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-6 col-6">
                            <div class="form-group">
                                <label for="email-port">Porta in Uscita (SMTP)</label>
                                <input type="number" id="email-port" class="form-control"
                                       required value="${(emailSetting.port)!}">
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button id="send-button" class="btn btn-primary btn-icon float-right"
                                    onclick="upsertEmailSettings()">
                                <svg class="icon icon-white">
                                    <use
                                            href="/svg/sprite.svg#it-refresh"
                                    ></use>
                                </svg>
                                <span class="text-uppercase">Aggiorna configurazione</span>
                            </button>
                        </div>
                    </div>

                </fieldset>
            </div>
        </div>
    </div>
</div>


<div class="notification with-icon success" role="alert" aria-labelledby="email-settings-title"
     id="emailSettingNotification">
    <h5 id="email-settings-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-check-circle"></use>
        </svg>
        Configurazione SMTP
    </h5>
    <p>Configurazione aggiornata con successo</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="email-settings-title-error"
     id="emailSettingErrorNotification">
    <h5 id="email-settings-title-error">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Assicurati che i campi siano compilati correttamente</p>
</div>

<#include "./layout/footer.ftlh">

<script>

    function upsertEmailSettings() {

        const payload = {
            'fromAddress': $('#email-from').val(),
            'username': $('#email-uname').val(),
            'password': $('#email-pwd').val(),
            'host': $('#email-host').val(),
            'port': $('#email-port').val(),
        }

        axios.post('/email-settings', payload)
            .then(response => {

                if (response.status === 200) {
                    notificationShow('emailSettingNotification');
                }

            })
            .catch(error => {

                const status = error.response.status;

                if (status === 400) {
                    notificationShow('emailSettingErrorNotification')
                } else if (status === 401 || status === 403) {
                    console.log('Unauth')
                } else {
                    console.log("Temp Error")
                }

            });

    }


</script>
</body>
</html>