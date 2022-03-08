<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid my-4">

    <div class="row">

        <div class="col-sm-12 col-md-2">
            <#include "./layout/sidebar.ftlh">
        </div>

        <div class="col-sm-12 col-md-10">

            <form id="message-form" class="needs-validation" novalidate>
                <fieldset aria-label="Form Nuovo Operatore">
                    <legend>Nuovo Operatore</legend>

                    <div class="form-row mt-4">
                        <div class="col-12 form-group">
                            <label for="user-cf">Codice Fiscale</label>
                            <input type="text" id="user-cf" class="form-control text-uppercase"
                                   minlength="16" maxlength="16" required>
                        </div>

                        <div class="col-12 col-md-6 form-group">
                            <label for="user-fn">Nome</label>
                            <input type="text" id="user-fn" class="form-control text-uppercase"
                                   required>
                        </div>

                        <div class="col-12 col-md-6 form-group">
                            <label for="user-sn">Cognome</label>
                            <input type="text" id="user-sn" class="form-control text-uppercase"
                                   required>
                        </div>

                    </div>

                    <div class="form-row mt-4">

                        <div class="col-6 form-group">
                            <label for="user-email">E-mail</label>
                            <input type="email" id="user-email" class="form-control text-uppercase" required>
                        </div>

                        <div class="col-6 form-group">
                            <label for="user-conf-email">Conferma e-mail</label>
                            <input type="email" id="user-conf-email" class="form-control text-uppercase" required>
                        </div>

                    </div>

                </fieldset>
            </form>
            <div class="row">

                <div class="col-12">
                    <button id="send-button" onclick="createOperator()"
                            class="btn btn-primary btn-icon float-right">
                        <svg class="icon icon-white">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuovo Operatore</span>
                    </button>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="notification with-icon success" role="alert" aria-labelledby="not2dms-title"
     id="messageSentNotification">
    <h5 id="not2dms-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-check-circle"></use>
        </svg>
        Nuovo operatore
    </h5>
    <p>Operatore aggiunto con successo</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="bad-req-new-operator-alert2dms-title"
     id="badReqNewOperatorAlertNotification">
    <h5 id="bad-req-new-operator-alert2dms-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Assicurati che i campi siano compilati correttamente</p>
</div>

<#include "./layout/footer.ftlh">

<script>

    function createOperator() {
        const payload = {
            'username': $('#user-cf').val(),
            'firstName': $('#user-fn').val(),
            'familyName': $('#user-sn').val(),
            'email': $('#user-email').val(),
            'confirmationEmail': $('#user-conf-email').val()
        }

        axios.post('/operators', payload)
            .then(response => {
                if (response.status === 200) {
                    notificationShow('messageSentNotification')
                    resetInputs('message-form')
                }
            })
            .catch(error => {
                const status = error.response.status;

                if (status === 400) {
                    notificationShow('badReqNewOperatorAlertNotification')
                } else if (status === 401 || status === 403) {
                    console.log('Unauth')
                } else {
                    console.log("Temp Error")
                }

            })
    }
</script>
</body>
</html>