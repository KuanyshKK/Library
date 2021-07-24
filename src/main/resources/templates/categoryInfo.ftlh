<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
        <div class="col-10">

            <div class="card ">
                <div class="card-header text-center">
                    Категория
                </div>

                <div class="card-body">
                    <h5 class="card-title">${category.name!}</h5>
                    <p class="card-text">Код - ${category.description!}</p>
                </div>
            </div>
        </div>
</@navbar.horizontalNav>