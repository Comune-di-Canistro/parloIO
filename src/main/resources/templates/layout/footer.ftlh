<html lang="it">
<body>

<footer class="it-footer">
    <div class="it-footer-small-prints clearfix">
        <div class="container">
            <div class="row">
                <div class="col-10">
                    <h3 class="sr-only">Sezione Link Utili</h3>
                    <ul class="it-footer-small-prints-list list-inline mb-0 d-flex flex-column flex-md-row">
                        <li class="list-inline-item"><a target="_blank" href="<#if municipalityUrl??><#else>#</#if>${municipalityUrl}" title="Sito Web">Comune di
                                ${municipalityName}</a></li>
                    </ul>
                </div>
                <div class="col-2">
                    <ul class="it-footer-small-prints-list list-inline mb-0 d-flex flex-column flex-md-row">
                        <li class="list-inline-item"><a href="#" title="Version">${portalVersion}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <a href="#" aria-hidden="true" data-attribute="back-to-top" class="back-to-top">
        <svg class="icon icon-light">
            <use xlink:href="/svg/sprite.svg#it-arrow-up"></use>
        </svg>
    </a>
</footer>

</body>
<script>window.__PUBLIC_PATH__ = '/fonts'</script>
<script src="/js/bootstrap-italia.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.css">
<script src="https://cdn.jsdelivr.net/npm/easymde/dist/easymde.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            const forms = document.getElementsByClassName('needs-validation');
            const validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                }, false);
                form.classList.add('was-validated');
            });
        }, false);
    })();

    function resetInputs(mainDiv) {

        const newUserRow = document.getElementById(mainDiv)

        const activeLabels = newUserRow.getElementsByTagName('label');
        const inputs = newUserRow.getElementsByTagName('input');

        for (const i of inputs) {
            i.value = ""
            i.classList.remove('focus--mouse')
        }

        for (const l of activeLabels) {
            l.classList.remove('active')
        }

    }
</script>

</html>