<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
<div class="row">
    <div class="col">
        <form class="mx-auto">
            <div class="form-group">
                <#list errors as error>
                    <h3>${error}</h3>
                </#list>
            </div>
        </form>
    </div>

</div>

</@navbar.horizontalNav>