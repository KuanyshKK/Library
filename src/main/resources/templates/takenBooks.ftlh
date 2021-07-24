<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">
                Наименование
            </th>
            <th scope="col">
                Читатель
            </th>
        </tr>
        </thead>
        <tbody>
        <h3 class="mb-3">Список выданных книг</h3>
        <#if userBooks?? &&(userBooks?size > 0)>
            <#list userBooks as userB>
                <#list userB.books as b>
                <tr>
                    <td>
                        ${b.name!""}
                    </td>
                    <td>
                        ${userB.name}
                    </td>
                </tr>
                </#list>
            </#list>
        <#else>
            <h2>Нету выданных книг</h2>
        </#if>
        </tbody>
    </table>

</@navbar.horizontalNav>