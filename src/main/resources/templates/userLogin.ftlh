<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <h3>Вход в личный кабинет</h3>
    <form action="/users/login" method="post">
        <div class="form-group pt-3">
            <label for="exampleInputName">Email</label>
            <input type="text" name="email" class="form-control" id="exampleInputName" required>
        </div>
        <button class="btn btn-primary">Войти</button>
    </form>
</@navbar.horizontalNav>