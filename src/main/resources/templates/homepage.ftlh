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
                <fieldset aria-label="Form Notifiche Telegram">
                    <legend>Nuova Allerta Meteo</legend>

                    <div class="form-row mt-4">
                        <div class="col-12 col-md-6 form-group">
                            <label for="message-title">Titolo</label>
                            <input type="text" id="message-title" name="title" class="form-control text-uppercase"
                                   minlength="10" required>
                            <small class="form-text text-muted">min: 10 caratteri</small>
                        </div>
                        <div class="col-12 col-md-6 form-group">
                            <div class="bootstrap-select-wrapper">
                                <label for="message-severity">Severità</label>
                                <select id="message-severity" title="Seleziona una opzione" name="severity"
                                        required>
                                    <option value="VERDE" selected>VERDE</option>
                                    <option value="GIALLA">GIALLA</option>
                                    <option value="ARANCIONE">ARANCIONE</option>
                                    <option value="ROSSA">ROSSA</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="col-12 col-md-6 form-group it-datepicker-wrapper theme-dark">
                            <label for="event-date">Data Evento</label>
                            <input class="form-control it-date-datepicker" name="eventDate" id="event-date"
                                   type="text"
                                   required>
                            <small class="form-text text-muted">Formato data gg/MM/aaaa</small>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-12 form-group">
                            <textarea id="message-body" name="body" required></textarea>
                        </div>
                    </div>
                </fieldset>
            </form>

            <div class="row">
                <div class="col-12">
                    <button id="send-button" onclick="createWeatherWarning()"
                            class="btn btn-primary btn-icon float-right">
                        <svg class="icon icon-white">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuova allerta meteo</span>
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
        Nuova allerta meteo
    </h5>
    <p>Allerta meteo registrata con successo</p>
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

<#include "./layout/footer.ftlh">

<script>

    $(document).ready(function () {
        $('.it-date-datepicker').datepicker({
            inputFormat: [''],
            outputFormat: 'dd/MM/yyyy',
        })
    });

    const markdown_editor = new EasyMDE({
        autofocus: false,
        element: document.getElementById("message-body"),
        placeholder: "Messaggio di allerta...",
        spellChecker: false,
        uploadImage: false
    });

    function createWeatherWarning() {
        const payload = {
            'title': $('#message-title').val(),
            'eventDate': $('#event-date').val(),
            'body': markdown_editor.value(),
            'severity': $('#message-severity').val()
        }

        axios.post('/weather-warning', payload)
            .then(response => {
                if (response.status === 200) {
                    notificationShow('messageSentNotification')
                    resetInputs('message-form')
                    markdown_editor.value("")
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