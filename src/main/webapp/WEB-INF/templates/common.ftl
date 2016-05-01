<#macro pagination url param="">
    <#if (page.list)?? && page.total gt 0>
    <div class="pull-right">
        <ul class="pagination">
            <li><a href="javascript:" class="page-info">第 ${page.startRow}~${page.endRow} 条, 共 ${page.total} 条, 第 ${page.pageNum} 页,
                共 ${page.pages} 页</a></li>
        </ul>
    </div>
    <div class="pull-left">
        <ul class="pagination">
            <li>
                <a href="${url}?p=1<#if param?has_content>&${param}</#if>">
                    <i class="ace-icon fa fa-angle-double-left"></i>
                </a>
            </li>
            <li>
                <#if page.hasPreviousPage>
                    <a href="${url}?p=${page.prePage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-left"></i>
                    </a>
                <#else>
                    <a href="${url}?p=1<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-left"></i>
                    </a>
                </#if>
            </li>

            <#list page.navigatepageNums as nav>
                <li <#if nav == page.pageNum>class="active"</#if>>
                    <a href="${url}?p=${nav}<#if param?has_content>&${param}</#if>">${nav}</a>
                </li>
            </#list>

            <li>
                <#if page.hasNextPage>
                    <a href="${url}?p=${page.nextPage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-right"></i>
                    </a>
                <#else>
                    <a href="${url}?p=${page.lastPage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-right"></i>
                    </a>
                </#if>
            </li>
            <li>
                <a href="${url}?p=${page.lastPage}<#if param?has_content>&${param}</#if>">
                    <i class="ace-icon fa fa-angle-double-right"></i>
                </a>
            </li>
        </ul>
    </div>
    </#if>
</#macro>