<#macro operators_table headers page>
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
                    <td>${item.username}</td>
                    <td>${item.firstName}</td>
                    <td>${item.familyName}</td>
                    <td>
                        <#if item.enabled>
                            <div class="text-center" title="Attivo">
                                <svg class="icon icon-success" height="20" width="20">
                                    <circle cx="10" cy="10" r="8"></circle>
                                </svg>
                            </div>
                        <#else>
                            <div class="text-center" title="Non attivo">
                                <svg class="icon icon-danger" height="20" width="20">
                                    <circle cx="10" cy="10" r="8"></circle>
                                </svg>
                            </div>
                        </#if>
                    </td>
                    <td>
                        <#if item.enabled>
                            <button class="btn btn-xs" onclick="changeStatus('${item.username}', false)">
                                <span class="primary-color">Disabilita</span>
                            </button>
                        <#else>
                            <button class="btn btn-xs" onclick="changeStatus('${item.username}', true)">
                                <span class="primary-color">Abilita</span>
                            </button>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
            <caption
                    class="text-uppercase">${page.totalElements}<#if page.totalElements gt 1> operatori<#else> operatore</#if></caption>
        </table>
    </div>

    <div class="notification with-icon error" role="alert" aria-labelledby="bad-change-status-alert2dms-title"
         id="badChangeStatusAlertNotification">
        <h5 id="bad-change-status-alert2dms-title">
            <svg class="icon">
                <use href="/svg/sprite.svg#it-error"></use>
            </svg>
            Errore
        </h5>
        <p>Non è stato possibile cambiare lo stato dell'operatore</p>
    </div>

    <#include "../layout/pagination.ftlh">

    <script>
        function changeStatus(username, status) {
            axios.put("/operators/change-status/" + username + "?status=" + status)
                .then(response => {
                    document.location.reload()
                })
                .catch(error => {
                    notificationShow('badChangeStatusAlertNotification')
                })
        }
    </script>
</#macro>
