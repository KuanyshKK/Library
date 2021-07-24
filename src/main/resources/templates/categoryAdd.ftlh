<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
<div class="col-10">
            <h3>Добавить категорию</h3>
            <form action="/categories/add" method="post">
                <div class="form-group">
                    <label for="exampleInputName">Наименование</label>
                    <input type="text" name="name" class="form-control" id="exampleInputInputName" >
                </div>
                <div class="form-group">
                    <label for="exampleInputDescription">Описание</label>
                    <input type="text" name="description" class="form-control" id="exampleInputInputDescription" >
                </div>
                <button class="btn btn-primary">Добавить</button>
            </form>
        </div>
</@navbar.horizontalNav>