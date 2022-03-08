<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid my-4">

    <div class="row">

        <div class="col-sm-12 col-md-2">
            <#include "./layout/sidebar.ftlh">
        </div>

        <div class="col-sm-12 col-md-10">

            <div class="row">
                <div class="col-md-10 col-sm-12">
                    <form id="message-form" class="needs-validation" novalidate>
                        <fieldset aria-label="Form Notifiche Telegram">
                            <legend>Nuova Notifica</legend>
                            <div class="form-row">
                                <div class="col-12 form-group">
                                    <label for="message-body-2"></label>
                                    <textarea class="form-control" placeholder="Nuovo messaggio..." id="message-body-2"
                                              name="body-2" minlength="1" maxlength="4096" rows="10"
                                              required></textarea>
                                    <div class="invalid-feedback">Scrivi un messaggio. Massimo 4096 caratteri</div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <div class="row">
                        <div class="col-12 form-group">
                            <button id="send-button" onclick="createTelegramNotification()"
                                    class="btn btn-primary btn-icon float-right">
                                <svg class="icon icon-white">
                                    <use
                                            href="/svg/sprite.svg#it-plus"
                                    ></use>
                                </svg>
                                <span class="text-uppercase">Invia</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 col-sm-12">
                    <div class="it-list-wrapper">
                        <ul class="it-list">
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(0)">
                                    <div class="it-right-zone">
                                        <span class="text">Bold<em><b>Grassetto</b></em></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(1)">
                                    <div class="it-right-zone">
                                        <span class="text">Italic<em><i>Corsivo</i></em></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(2)">
                                    <div class="it-right-zone">
                                        <span class="text">Underline<em><u>Sottolineato</u></em></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(3)">
                                    <div class="it-right-zone">
                                        <span class="text">Strikethrough<em><del>Barrato</del></em></span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(4)">
                                    <div class="it-right-zone">
                                        <span class="text">Link</span>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a style="cursor: pointer" onclick="insertHtmlTag(5)">
                                    <div class="it-right-zone">
                                        <span class="text">Spoiler</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
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
        Nuova notifica telegram
    </h5>
    <p>Notifica telegram inviata con successo</p>
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

    function insertHtmlTag(t) {

        const cursorPos = $('#message-body-2').prop('selectionStart') || 0;
        const message = $('#message-body-2').val()

        const before = message.substring(0, cursorPos);
        const after = message.substring(cursorPos, message.length)

        if (t === 0) {
            $('#message-body-2').val(before + "<b>your message</b>" + after);
        } else if (t === 1) {
            $('#message-body-2').val(before + "<i>your message</i>" + after);
        } else if (t === 2) {
            $('#message-body-2').val(before + "<u>your message</u>" + after);
        } else if (t === 3) {
            $('#message-body-2').val(before + "<del>your message</del>" + after);
        } else if (t === 4) {
            $('#message-body-2').val(before + "<a href='https://'>your message</a>" + after);
        } else if (t === 5) {
            $('#message-body-2').val(before + "<span class='tg-spoiler'>your message</span>" + after);
        }

    }


    function createTelegramNotification() {
        const payload = {
            'message': $('#message-body-2').val()
        }

        axios.post('/telegram/send', payload)
            .then(response => {
                if (response.status === 200) {
                    notificationShow('messageSentNotification')
                    $('#message-body-2').val("")
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