<div class="sidebar-wrapper">
    <div class="sidebar-linklist-wrapper">
        <div class="link-list-wrapper">
            <ul class="link-list">
                <li>
                    <a class="list-item large right-icon <#if (sidebarIndex?string == '1' || sidebarIndex?string == '3')>active</#if>"
                       href="#collapseOne" data-toggle="collapse"
                       aria-expanded="<#if (sidebarIndex?string == '1' || sidebarIndex?string == '3')>true<#else>false</#if>"
                       aria-controls="collapseOne"><span>Allerta Meteo </span>
                        <svg class="icon icon-sm icon-primary right" aria-hidden="true">
                            <use href="/svg/sprite.svg#it-expand"></use>
                        </svg>
                    </a>
                    <ul class="link-sublist collapse <#if (sidebarIndex?string == '1' || sidebarIndex?string == '3')>show</#if>"
                        id="collapseOne">
                        <li><a class="list-item <#if sidebarIndex?string == '1'>active</#if>"
                               href="/weather-warning"><span>Nuova Allerta Meteo </span></a>
                        </li>
                        <li><a class="list-item <#if sidebarIndex?string == '3'>active</#if>"
                               href="/weather-warning/all/0"><span>Lista Allerte Meteo </span></a>
                        </li>
                        <li><a class="list-item disabled" href="#"><span>Template </span><span
                                        class="badge badge-pill badge-outline-primary">coming soon</span></a>
                        </li>
                    </ul>
                </li>


                <li>
                    <a class="list-item large right-icon <#if sidebarIndex?string == '8'>active</#if>" href="#collapseFour" data-toggle="collapse"
                       aria-expanded="<#if sidebarIndex?string == '8'>true<#else>false</#if>" aria-controls="collapseFour"><span>Canale Telegram </span>
                        <svg class="icon icon-sm icon-primary right" aria-hidden="true">
                            <use href="/svg/sprite.svg#it-expand"></use>
                        </svg>
                    </a>
                    <ul class="link-sublist collapse <#if sidebarIndex?string == '8'>show</#if>" id="collapseFour">
                        <li><a class="list-item <#if sidebarIndex?string == '8'>active</#if>" href="/telegram/view"><span>Nuova Notifica </span></a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a class="list-item large right-icon <#if (sidebarIndex?string == '2' || sidebarIndex?string == '5')>active</#if>"
                       href="#collapseTwo" data-toggle="collapse"
                       aria-expanded="<#if (sidebarIndex?string == '2' || sidebarIndex?string == '5')>true<#else>false</#if>"
                       aria-controls="collapseTwo"><span>Utenti </span>
                        <svg class="icon icon-sm icon-primary right" aria-hidden="true">
                            <use href="/svg/sprite.svg#it-expand"></use>
                        </svg>
                    </a>
                    <ul class="link-sublist collapse <#if (sidebarIndex?string == '2' || sidebarIndex?string == '5')>show</#if>"
                        id="collapseTwo">
                        <li><a class="list-item <#if sidebarIndex?string == '5'>active</#if>" href="/users"><span>Nuovo Utente </span></a>
                        </li>
                        <li><a class="list-item <#if sidebarIndex?string == '2'>active</#if>" href="/users/all/0"><span>Lista Utenti </span></a>
                        </li>
                    </ul>
                </li>

                <#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
                <@security.authorize access="isAuthenticated() && hasAnyAuthority('ADMIN')">

                    <li>
                        <a class="list-item large right-icon <#if sidebarIndex?string == '9' || sidebarIndex?string == '10'>active</#if>" href="#collapseFive" data-toggle="collapse"
                           aria-expanded="<#if sidebarIndex?string == '9' || sidebarIndex?string == '10'>true<#else>false</#if>" aria-controls="collapseFive"><span>Operatori </span>
                            <svg class="icon icon-sm icon-primary right" aria-hidden="true">
                                <use href="/svg/sprite.svg#it-expand"></use>
                            </svg>
                        </a>

                        <ul class="link-sublist collapse <#if sidebarIndex?string == '9' || sidebarIndex?string == '10'>show</#if>" id="collapseFive">
                            <li><a class="list-item <#if sidebarIndex?string == '10'>active</#if>" href="/operators"><span>Nuovo Operatore </span></a>
                            </li>
                            <li><a class="list-item <#if sidebarIndex?string == '9'>active</#if>" href="/operators/0"><span>Lista Operatori </span></a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a class="list-item large right-icon <#if sidebarIndex?string == '4' || sidebarIndex?string == '7' || sidebarIndex?string == '12'>active</#if>"
                           href="#collapseThree" data-toggle="collapse"
                           aria-expanded="<#if sidebarIndex?string == '4' || sidebarIndex?string == '7' || sidebarIndex?string == '12'>true<#else>false</#if>"
                           aria-controls="collapseThree"><span>Configurazioni </span>
                            <svg class="icon icon-sm icon-primary right" aria-hidden="true">
                                <use href="/svg/sprite.svg#it-expand"></use>
                            </svg>
                        </a>
                        <ul class="link-sublist collapse <#if sidebarIndex?string == '4' || sidebarIndex?string == '7' || sidebarIndex?string == '12'>show</#if>" id="collapseThree">
                            <li><a class="list-item <#if sidebarIndex?string == '4'>active</#if>"
                                   href="/io-settings"><span>App IO </span></a>
                            </li>
                            <li><a class="list-item <#if sidebarIndex?string == '7'>active</#if>"
                                   href="/telegram/settings"><span>Telegram </span></a>
                            </li>

                            <li><a class="list-item <#if sidebarIndex?string == '12'>active</#if>"
                                   href="/email-settings"><span>Email SMTP </span></a>
                            </li>

                        </ul>
                    </li>
                </@security.authorize>
            </ul>
        </div>
    </div>
</div>



