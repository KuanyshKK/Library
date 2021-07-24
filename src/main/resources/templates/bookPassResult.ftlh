<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <div class="row">
        <div class="col">
            <#list errors as error>
                <h3>${error}</h3>
            </#list>
        </div>

    </div>

</@navbar.horizontalNav>