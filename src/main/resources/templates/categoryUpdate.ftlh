<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
        <div class="col-10">
            <form action="/categories/${category.id}/update" method="post">
                <div class="form-group">
                    <label for="exampleInputName">Наименование</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName" value="${category.name}">
                </div>
                <div class="form-group">
                    <label for="exampleInputManufacturer">Описание</label>
                    <input type="text" name="description" class="form-control" id="exampleInputDescription" value="${category.description}">
                </div>
                <button class="btn btn-primary">Редактировать</button>
            </form>
        </div>
</@navbar.horizontalNav>