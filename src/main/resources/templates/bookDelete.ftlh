<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <div class="row">
        <div class="col">
            <form class="mx-auto">
                <div class="form-group">
                    <p>Вы действительно хотите удалить?</p>
                </div>
                <div class="row">
                    <div class="col-2"><a href="/books/${id}/delete" class="btn btn-danger d-block">Да</a></div>
                    <div class="col-2"><a href="/books" class="btn btn-success d-block">Нет</a></div>
                </div>
            </form>
        </div>

    </div>

</@navbar.horizontalNav>