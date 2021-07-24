<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <div class="row pt-3">
        <div class="col-8 mx-auto">
            <h3>Изменить книгу</h3>
            <form action="/books/${book.id}/update" method="post" enctype="multipart/form-data">
                <div class="form-group pt-3">
                    <label for="exampleInputName">Наименование</label>
                    <input type="text" name="name" class="form-control" id="exampleInputName" required value="${book.name!""}">
                </div>
                <div class="form-group">
                    <label for="exampleInputAuthor">Автор</label>
                    <input type="text" name="author" class="form-control" id="exampleInputAuthor" required value="${book.author!""}">
                </div>
                <div class="form-group">
                    <label for="file">
                        <p>Обложка книги</p>
                        <input type="file" id="file" name="file" required value="${book.photo!""}">
                    </label>
                </div>
                <div class="form-group">
                    <label for="exampleInputYearOfIssue">Год выпуска</label>
                    <input type="date"
                           name="yearOfIssue" class="form-control" id="exampleInputYearOfIssue"
                        value="${book.yearOfIssue!}">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlDescription">Описание книги</label>
                    <textarea class="form-control" name="description" id="exampleFormControlDescription" rows="3" >${book.description!""}</textarea>
                </div>

                <button class="btn btn-primary">Изменить</button>
            </form>
        </div>
    </div>

</@navbar.horizontalNav>