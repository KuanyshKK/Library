<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <h2 class="text-center">Список книг</h2>
    <#if books ?? &&(books?size >0)>
        <div class="row">
            <div class="col py-0">
                <div class="float-right pb-1">
                    <#if hasPrevious!>
                        <a href="/books?page=${currentPage - 1}">Предыдущая</a>
                    <#else>
                        <p></p>
                    </#if>
                    <#if hasNext!>
                        <a href="/books?page=${currentPage + 1}">Следующая</a>
                    <#else>
                        <p></p>
                    </#if>
                </div>
            </div>

        </div>
        <div class="row row-cols-4 mt-2">
        <#list books as book>
            <div class="col-3 mb-4 px-2">
                <div class="card text-center">
                    <div class="card-header mb-5">
                        ${book.name}
                    </div>
                    <#if book.photo??>
                        <img src="/files/${book.photo!""}" class="card-img-top bookInfoImage" alt="pic">
                    <#else>
                        <h4 class="my-5">Нету картинки</h4>
                    </#if>
                    <div class="card-body">
                        <p class="card-text">Автор - ${book.author}</p>
                        <p class="card-text">Статус - ${book.status}</p>
                        <div class="row">

                            <div class="col">

                                <a href="#"
                                   class=
                                   <#if book.status?contains("В наличии")>
                                   "btn btn-success d-block mb-3"
                                    <#else>
                                    "btn btn-success d-block mb-3 disabled"
                                </#if>
                                data-toggle="modal"
                                data-target="#takeBookModalCenter"
                                data-whatever="${book.id}">Получить
                                </a>
                            </div>
                            <div class="col"><a href="/books/${book.id}" class="btn btn-warning d-block">Подробнее
                                </a></div>
                        </div>

                    </div>
                    <div class="card-footer text-muted">
                        <div class="row">
                            <div class="col"><a href="/books/${book.id}/update" class="btn btn-primary d-block">Изменить
                                </a></div>
                            <div class="col"><a href="/books/${book.id}/deletePage" class="btn btn-danger d-block">Удалить
                                </a></div>
                        </div>
                    </div>
                </div>
            </div>
        </#list>

    <#else>
        <h2>Нету книг</h2>
        </div>
    </#if>

</@navbar.horizontalNav>

