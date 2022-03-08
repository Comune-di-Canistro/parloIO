
<div class="row">
    <div class="col-12">
        <nav class="pagination-wrapper justify-content-center" aria-label="Navigazione">
            <ul class="pagination justify-content-center">

                <!-- page_item d-none d-sm-flex -->
                <!-- page_item active  -->
                <#list 1..currentPage.totalPages as p>
                    <li class="page-item <#if p == inc(currentPage.number)>active <#else> d-none d-sm-flex</#if>">
                        <a class="page-link" <#if p == inc(currentPage.number)>aria-current="page"</#if> href="./${dec(p)}">${p}</a>
                    </li>
                </#list>

            </ul>
        </nav>
    </div>
</div>

<#function inc x>
    <#return x + 1>
</#function>

<#function dec x>
    <#return x - 1>
</#function>