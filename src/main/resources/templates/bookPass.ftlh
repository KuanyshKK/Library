<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <div class="row">
        <div class="col">
            <form class="mx-auto" action="/users/${userBook.userId}/pass/${userBook.bookId}" method="post">
                <div class="form-group">
                    <p>Вы действительно хотите сдать книгу?</p>
                </div>
                <div class="row">
<#--                    <div class="col-2"><a href="" class="btn btn-danger d-block">Да</a></div>-->
                    <button class="btn btn-danger d-block">Да</button>
                </div>
            </form>
        </div>

    </div>

</@navbar.horizontalNav>