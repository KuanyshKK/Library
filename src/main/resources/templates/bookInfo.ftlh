<#import "base.ftlh" as navbar>
<@navbar.horizontalNav>
    <div class="card text-center">
        <div class="card-header">
            ${book.name}
        </div>
        <img src="/files/${book.photo!""}" class="card-img-top" alt="pic" height="500px" >
        <div class="card-body">
            <p class="card-text">Автор - ${book.author}</p>
            <p class="card-text">Год выпуска - ${book.yearOfIssue}</p>
            <p class="card-text">Описание</p>
            <textarea class="form-control" id="exampleFormControlDescription" disabled rows="3">${book.description!""}</textarea>
            <p class="card-text">Дата добавления - ${book.addingDate}</p>
            <p class="card-text">Категория- ${book.category.name}</p>

            <p class="card-text">Статус - ${book.status}</p>
        </div>
        <div class="card-footer text-muted">
        </div>
    </div>
    </div>
</@navbar.horizontalNav>