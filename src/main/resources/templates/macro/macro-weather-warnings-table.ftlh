<#macro warnings_table headers page>
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
                    <td>${item.title}</td>
                    <td>${item.eventDate}</td>
                    <td>${item.severity}</td>
                    <td>
                        <button class="btn btn-outline-primary btn-icon btn-xs"
                                data-warning="${item.body}"
                                data-toggle="modal" data-target="#details-modal">
                            <svg class="icon icon-primary">
                                <use
                                        href="/svg/sprite.svg#it-info-circle"
                                ></use>
                            </svg>
                            <span class="text-uppercase">Dettagli</span>
                        </button>
                    </td>
                </tr>
            </#list>
            </tbody>
            <caption
                    class="text-uppercase">${page.totalElements}<#if page.totalElements gt 1> allerte<#else> allerta</#if> meteo</caption>
        </table>
    </div>
    <#include "../layout/pagination.ftlh">
</#macro>