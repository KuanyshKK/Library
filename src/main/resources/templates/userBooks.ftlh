<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <h2 class="text-center">Список взятых книг</h2>
    <#if user ?? &&(user.books?size >0)>
        <div class="row row-cols-4 mt-5">
        <#list user.books as book>

            <div class="col-3 mb-4 px-2">
                <div class="card text-center">
                    <div class="card-header">
                        <p class="card-text">${book.name}</p>
                    </div>
                    <img src="/files/${book.photo!""}" class="card-img-top bookInfoImage" alt="pic" height="180px">
                    <div class="card-body">
                        <h5 class="card-title"></h5>
                        <p class="card-text">Автор - ${book.author}</p>
                        <p class="card-text">Статус - ${book.status}</p>
                        <div class="row">
                            <div class="col"><a href="/users/${user.id}/pass/${book.id}" class="btn btn-success d-block">Сдать
                                </a></div>
                            <div class="col"><a href="/books/${book.id}" class="btn btn-warning d-block">Подробнее
                                </a></div>
                        </div>
                    </div>
                    <div class="card-footer text-muted">
                    </div>
                </div>
            </div>
        </#list>
    <#else>
        <h2>Нету книг</h2>
        </div>
    </#if>
</@navbar.horizontalNav>