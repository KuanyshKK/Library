<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
        <div class="col-10">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Описание</th>
                    <th scope="col">
                        <a href="/categories/add" data-toggle="tooltip" title="Добавить категорию"><i class="fas fa-plus"></i></a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <h3 class="mb-3">Категории</h3>
                <#if categories?? &&(categories?size > 0)>
                    <#list categories as category>
                        <tr>
                            <th scope="row">${category?counter}</th>
                            <td>${category.name!""}</td>
                            <td>${category.description!""}</td>
                            <td class="my-activity-column">
                                <a href="/categories/${category.id}" data-toggle="tooltip" title="Информация">
                                    <i class="fas fa-info-circle fa-lg info-color pr-3"></i>
                                </a>
                                <a href="/categories/${category.id}/update" data-toggle="tooltip" title="Изменить категорию">
                                    <i class="far fa-edit fa-lg modify-color pr-3"></i>
                                </a>
                                <a href="/categories/${category.id}/deletePage" data-toggle="tooltip" title="Удалить категорию">
                                    <i class="far fa-trash-alt fa-lg delete-color"></i>
                                </a>
                            </td>
                        </tr>
                    </#list>
                <#else>
                    <h2>Нету категории</h2>
                </#if>
                </tbody>
            </table>
        </div>
</@navbar.horizontalNav>