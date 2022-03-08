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
                <fieldset aria-label="Form Nuovo Utente">
                    <legend>Nuovo Utente</legend>

                    <div class="row">
                        <div class="col-12">
                            <button id="upload-users-button"
                                    class="btn btn-outline-primary btn-icon float-right mr-2" data-toggle="modal"
                                    data-target="#upload-users-modal">
                                <svg class="icon icon-primary">
                                    <use
                                            href="/svg/sprite.svg#it-upload"
                                    ></use>
                                </svg>
                                <span class="text-uppercase">Carica Utenti</span>
                            </button>
                        </div>
                    </div>

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

                </fieldset>
            </form>
            <div class="row">

                <div class="col-12">
                    <button id="send-button" onclick="createNewUser()"
                            class="btn btn-primary btn-icon float-right">
                        <svg class="icon icon-white">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuovo Utente</span>
                    </button>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="upload-users-modal" aria-labelledby="upload-users-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-uppercase" id="upload-modal-title">Caricamento utenti</h5>
            </div>
            <div class="modal-body">
                <div class="callout important">
                    <div class="callout-title">
                        <svg class="icon">
                            <use href="/svg/sprite.svg#it-info-circle"></use>
                        </svg>
                        Importante
                    </div>
                    <p>
                        Il file <u>.csv</u> deve essere composto dalle seguenti colonne utilizzando la <i>virgola</i>
                        come separatore.
                    </p>
                    <table id="users-table" class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Codice Fiscale</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Cognome</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>AAAAAA00A00A000A</td>
                            <td>Mario</td>
                            <td>Rossi</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <form id="upload-form" enctype="multipart/form-data">
                    <input type="file" name="upload1" id="upload1" class="upload" accept="text/csv, .csv"/>
                    <label for="upload1">
                        <svg class="icon icon-sm" aria-hidden="true">
                            <use href="/svg/sprite.svg#it-file"></use>
                        </svg>
                        <span class="text-uppercase">Scegli file</span>
                    </label>
                    <ul id="file-upload-list" class="upload-file-list hidden">
                        <li class="upload-file success">
                            <svg class="icon icon-sm" aria-hidden="true">
                                <use href="/svg/sprite.svg#it-file"></use>
                            </svg>
                            <p id="uploaded-file-name">
                            </p>
                            <button disabled>
                                <span class="sr-only">Caricamento ultimato</span>
                                <svg class="icon" aria-hidden="true">
                                    <use href="/svg/sprite.svg#it-check"></use>
                                </svg>
                            </button>
                        </li>
                    </ul>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary btn-sm text-uppercase" data-dismiss="modal" type="button">Annulla
                </button>
                <button class="btn btn-primary btn-sm text-uppercase" data-dismiss="modal" type="button"
                        onclick="createUsersCsv()">Carica
                </button>
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
        Nuovo utente
    </h5>
    <p>Utente aggiunto con successo</p>
</div>

<div class="notification with-icon success" role="alert" aria-labelledby="not2dms-title2"
     id="messageSentNotificationCsv">
    <h5 id="not2dms-title2">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-check-circle"></use>
        </svg>
        Caricamento utenti
    </h5>
    <p>Caricamento utenti in corso</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="bad-req-new-weather-alert2dms-title"
     id="badReqNewWeatherAlertNotification">
    <h5 id="bad-req-new-weather-alert2dms-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Assicurati che i campi siano compilati correttamente</p>
</div>

<div class="notification with-icon error" role="alert" aria-labelledby="bad-req-format-new-weather-alert2dms-title"
     id="badReqFormatNewWeatherAlertNotification">
    <h5 id="bad-req-format-new-weather-alert2dms-title">
        <svg class="icon">
            <use href="/svg/sprite.svg#it-error"></use>
        </svg>
        Errore
    </h5>
    <p>Il formato del file non è supportato</p>
</div>

<#include "./layout/footer.ftlh">

<script>

    document.getElementById('upload1').addEventListener('change', (e) => {
        $('#uploaded-file-name').text(e.target.files[0].name)
        document.getElementById('file-upload-list').classList.remove('hidden')
    })

    $('#upload-users-modal').on('hidden.bs.modal', function () {
        resetUploadUsers()
    });

    function resetUploadUsers() {
        document.getElementById('upload-form').reset()
        document.getElementById('uploaded-file-name').value = ""
        document.getElementById('file-upload-list').classList.add('hidden')
    }

    function createUsersCsv() {

        const file = document.getElementById('upload1').files[0];

        const formData = new FormData();
        formData.append('file', file);

        axios.post('/users/csv', formData, {headers: {'content-type': 'multipart/form-data'}})
            .then(response => {
                if (response.status === 200) {
                    notificationShow('messageSentNotificationCsv')
                }
            })
            .catch(error => {
                const status = error.response.status;

                if (status === 400) {
                    notificationShow('badReqFormatNewWeatherAlertNotification')
                } else if (status === 401 || status === 403) {
                    console.log('Unauth')
                } else {
                    console.log("Temp Error")
                }

            })

    }

    function createNewUser() {
        const payload = {
            'fiscalCode': $('#user-cf').val(),
            'firstName': $('#user-fn').val(),
            'familyName': $('#user-sn').val()
        }

        axios.post('/users', payload)
            .then(response => {
                if (response.status === 200) {
                    notificationShow('messageSentNotification')
                    resetInputs('message-form')
                }
            })
            .catch(error => {
                const status = error.response.status;

                if (status === 400) {
                    notificationShow('badReqNewWeatherAlertNotification')
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