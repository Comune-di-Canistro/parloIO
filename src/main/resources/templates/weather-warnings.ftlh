<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid my-4">

    <div class="row">

        <div class="col-sm-12 col-md-2">
            <#include "./layout/sidebar.ftlh">
        </div>

        <div class="col-sm-12 col-md-10">
            <fieldset aria-label="Lista Allerte Meteo">
                <legend>Lista Allerte Meteo</legend>

                <div class="col-12">

                    <button onclick="location.href = '/weather-warning';" class="btn btn-outline-primary btn-icon float-right">
                        <svg class="icon icon-primary">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuova allerta meteo</span>
                    </button>

                </div>
            </fieldset>
            <div class="row">
                <div class="col-12">
                    <#if weatherWarnings.numberOfElements gt 0>
                        <#assign currentPage=weatherWarnings>
                        <@warnings_table headers=['#', 'Titolo', 'Data', 'Severità', ''] page=currentPage></@warnings_table>
                    <#else >
                        <p class="text-uppercase">Nessuna allerta meteo registrata</p>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="details-modal" aria-labelledby="details-modal-title">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-uppercase" id="details-modal-title">Messaggio</h5>
            </div>
            <div class="modal-body">
                <div id="markdown-text">Sto caricando il messaggio...</div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary btn-sm text-uppercase" data-dismiss="modal" type="button">Chiudi</button>
            </div>
        </div>
    </div>
</div>

<#include "./layout/footer.ftlh">

<script>
    $(document).ready(function () {
        $('#details-modal').on('show.bs.modal', function (e) {
            const warning = $(e.relatedTarget).data('warning');
            $('#markdown-text').html(marked.parse(warning))
        });

        $('#details-modal').on('hidden.bs.modal', function (e) {
            $('#markdown-text').text('Sto caricando il messaggio...')
        });

    });
</script>
</body>
</html>