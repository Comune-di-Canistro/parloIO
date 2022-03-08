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
                    <legend>Parametri di configurazione per l'integrazione di un Bot e Canale Telegram</legend>

                    <div class="row">
                        <div class="col-12">
                            <div class="callout important">
                                <div class="callout-title">
                                    <svg class="icon">
                                        <use href="/svg/sprite.svg#it-info-circle"></use>
                                    </svg>
                                    Importante
                                </div>
                                <p>Il <i>bot</i> deve essere creato dal <a
                                            href="https://web.telegram.org/z/#93372553" target="_blank">BotFather</a>
                                    <br/>
                                    <br/>Il nome del canale deve essere preceduto da <strong>@</strong>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-4">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="telegram-token">Token</label>
                                <input type="password" id="telegram-token" class="form-control"
                                       required value="${(telegramSetting.token)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="telegram-chat-id"><a href="#" data-toggle="tooltip"
                                                                 title="ID del Canale Telegram">Chat Id</a></label>
                                <input type="text" id="telegram-chat-id" class="form-control"
                                       required value="${(telegramSetting.chatId)!}">
                            </div>
                        </div>

                        <div class="col-sm-12 col-md-12">
                            <div class="form-group">
                                <label for="io-reg-date">Data di Registrazione</label>
                                <input class="form-control-plaintext" type="text" id="io-reg-date"
                                       value="${(telegramSetting.registrationDate)!}" readonly>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <button id="send-button" class="btn btn-primary btn-icon float-right"
                                    onclick="upsertTelegramSettings()">
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


<div class="notification with-icon success" role="alert" aria-labelledby="telegram-settings-title"
     id="telegramSettingNotification">
    <h5 id="telegram-settings-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-check-circle"></use>
        </svg>
        Configurazione Bot Telegram
    </h5>
    <p>Configurazione aggiornata con successo</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="telegram-settings-title-error"
     id="telegramSettingErrorNotification">
    <h5 id="telegram-settings-title-error">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Assicurati che i campi siano compilati correttamente</p>
</div>

<#include "./layout/footer.ftlh">

<script>

    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })

    function upsertTelegramSettings() {

        const payload = {
            'token': $('#telegram-token').val(),
            'chatId': $('#telegram-chat-id').val(),
        }

        axios.post('/telegram/settings', payload)
            .then(response => {

                if (response.status === 200) {
                    notificationShow('telegramSettingNotification');
                }

            })
            .catch(error => {

                const status = error.response.status;

                if (status === 400) {
                    notificationShow('telegramSettingErrorNotification')
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