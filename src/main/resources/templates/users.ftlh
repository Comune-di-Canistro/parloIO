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
                <legend>Lista Utenti</legend>

                <div class="col-12">
                    <button id="new-user-button" class="btn btn-outline-primary btn-icon float-right"
                            onclick="location.href = '/users';">
                        <svg class="icon icon-primary">
                            <use
                                    href="/svg/sprite.svg#it-plus"
                            ></use>
                        </svg>
                        <span class="text-uppercase">Nuovo Utente</span>
                    </button>
                </div>
            </fieldset>

            <div class="row">
                <div class="col-12">
                    <#if users.numberOfElements gt 0>
                        <#assign currentPage=users>
                        <@users_table headers=['#', 'Codice Fiscale', 'Nome', 'Cognome', 'Data Registrazione'] page=currentPage></@users_table>
                    <#else >
                        <p class="text-uppercase">Nessun utente registrato</p>
                    </#if>
                </div>
            </div>


        </div>
    </div>
</div>

<#include "./layout/footer.ftlh">

</body>
</html>