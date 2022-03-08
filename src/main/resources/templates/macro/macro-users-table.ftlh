<#macro users_table headers page>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <#list headers as header>
                    <th scope="col">${header}</th>
                </#list>
            </tr>
            </thead>
            <tbody>
            <#list page.content as item>
                <tr>
                    <td>${item.id}</td>
                    <td>${item.fiscalCode}</td>
                    <td>${item.firstName}</td>
                    <td>${item.familyName}</td>
                    <td>${item.registrationDate}</td>
                </tr>
            </#list>
            </tbody>
            <caption
                    class="text-uppercase">${page.totalElements}<#if page.totalElements gt 1> utenti<#else> utente</#if></caption>
        </table>
    </div>

    <#include "../layout/pagination.ftlh">
</#macro>
