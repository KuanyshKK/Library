<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <div class="row pt-3">
        <div class="col-8 mx-auto">
            <h3>Добавить книгу</h3>
            <form action="/books/add"  method="post" enctype="multipart/form-data">
                <div class="form-group pt-3">
                    <label for="exampleInputName">Наименование</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName" required >
                </div>
                <div class="form-group">
                    <label for="exampleInputAuthor">Автор</label>
                    <input type="text" name="author" class="form-control" id="exampleInputAuthor" required>
                </div>
                <div class="form-group">
                    <label for="file">
                        <p>Обложка книги</p>
                        <input type="file" id="file" name="file" required>
                    </label>
                </div>
                <div class="form-group">
                    <label for="exampleInputYearOfIssue">Год выпуска</label>
                    <input type="date"
                           name="yearOfIssue" class="form-control" id="exampleInputYearOfIssue" >
                </div>
                <div class="form-group">
                    <label for="exampleInputCategory">Категория</label>
                    <select class="custom-select" name="categoryId">
                        <#list categories as category>
                            <option value="${category.id}">${category.name}</option>
                        </#list>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlDescription">Описание книги</label>
                    <textarea class="form-control" name="description" id="exampleFormControlDescription" rows="3" ></textarea>
                </div>

                <button class="btn btn-primary">Добавить</button>
            </form>
        </div>
    </div>

</@navbar.horizontalNav>