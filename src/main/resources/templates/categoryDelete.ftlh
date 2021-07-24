<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
<div class="col-10">
            <form>
                <div class="form-group">
                    <p>Вы действительно хотите удалить?</p>
                </div>
                <div class="row">
                    <div class="col-2"><a href="/categories/${id}/delete" class="btn btn-danger d-block">Да</a></div>
                    <div class="col-2"><a href="/categories" class="btn btn-success d-block">Нет</a></div>
                </div>
            </form>
        </div>
</@navbar.horizontalNav>