<html lang="it">
<body>
<#include "./layout/header.ftlh">

<div class="container-fluid my-4">

    <div class="row">

        <div class="col-sm-12 col-md-2">
            <#include "./layout/sidebar.ftlh">
        </div>

        <div class="col-sm-12 col-md-10">
            <fieldset aria-label="Lista Utenti">
                <legend>Lista Operatori</legend>

                <div class="col-12">
                    <button id="new-user-button" class="btn btn-outline-primary btn-icon float-right"
                            onclick="location.href = '/operators';">
                        <svg class="icon icon-primary">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuovo Operatore</span>
                    </button>
                </div>
            </fieldset>

            <div class="row">
                <div class="col-12">
                    <#if operators.numberOfElements gt 0>
                        <#assign currentPage=operators>
                        <@operators_table headers=['#', 'Codice Fiscale', 'Nome', 'Cognome', '', 'Azioni'] page=currentPage></@operators_table>
                    <#else >
                        <p class="text-uppercase">Nessun operatore registrato</p>
                    </#if>
                </div>
            </div>


        </div>
    </div>
</div>

<#include "./layout/footer.ftlh">

</body>
</html>