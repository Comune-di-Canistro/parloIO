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
                <fieldset aria-label="Configurazione App IO">
                    <legend>Parametri di configurazione per l'integrazione con App IO</legend>

                    <div class="row">
                        <div class="col-12">
                            <div class="callout important">
                                <div class="callout-title">
                                    <svg class="icon">
                                        <use href="/svg/sprite.svg#it-info-circle"></use>
                                    </svg>
                                    Importante
                                </div>
                                <p>Il servizio deve essere registrato sul portale <a target="_blank"
                                                                                     href="https://developer.io.italia.it/">IO
                                        Developers Italia</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="io-id">Identificativo Servizio</label>
                                <input type="text" id="io-id" class="form-control text-uppercase"
                                       required value="${(ioSetting.identifier)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="io-pk">Chiave Primaria</label>
                                <input type="password" id="io-pk" class="form-control"
                                       required value="${(ioSetting.primaryKey)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="io-sk">Chiave Secondaria</label>
                                <input type="password" id="io-sk" class="form-control"
                                       required value="${(ioSetting.secondaryKey)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="io-reg-date">Data di Registrazione</label>
                                <input class="form-control-plaintext" type="text" id="io-reg-date"
                                       value="${(ioSetting.registrationDate)!}" readonly>
                            </div>
                        </div>


                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button id="send-button" class="btn btn-primary btn-icon float-right"
                                    onclick="upsertIoSetting()">
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


<div class="notification with-icon success" role="alert" aria-labelledby="io-settings-title"
     id="ioSettingNotification">
    <h5 id="io-settings-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-check-circle"></use>
        </svg>
        Configurazione App IO
    </h5>
    <p>Configurazione aggiornata con successo</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="io-settings-title-error"
     id="ioSettingErrorNotification">
    <h5 id="io-settings-title-error">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Assicurati che i campi siano compilati correttamente</p>
</div>

<#include "./layout/footer.ftlh">

<script>

    function upsertIoSetting() {

        const payload = {
            'identifier': $('#io-id').val(),
            'primaryKey': $('#io-pk').val(),
            'secondaryKey': $('#io-sk').val()
        }

        axios.post('/io-settings', payload)
            .then(response => {

                if (response.status === 200) {
                    notificationShow('ioSettingNotification');
                }

            })
            .catch(error => {

                const status = error.response.status;

                if (status === 400) {
                    notificationShow('ioSettingErrorNotification')
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