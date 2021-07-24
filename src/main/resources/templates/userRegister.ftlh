<#import "base.ftlh" as navbar>

<@navbar.horizontalNav>
    <h3>Регистрация пользователя</h3>
    <form action="/users/add" method="post">
        <div class="form-group pt-3">
            <label for="exampleInputName">Имя</label>
            <input type="text" name="name" class="form-control" id="exampleInputName" required >
        </div>
        <div class="form-group">
            <label for="exampleInputSurname">Фамилия</label>
            <input type="text" name="surname" class="form-control" id="exampleInputSurname" required >
        </div>
        <div class="form-group">
            <label for="exampleInputEmail">Email</label>
            <input type="email" name="email" class="form-control" id="exampleInputEmail" required >
        </div>
        <div class="form-group">
            <label for="exampleInputPhoneNumber">Номер телефона</label>
            <input type="text" name="phoneNumber" class="form-control" id="exampleInputPhoneNumber">
        </div>
        <button class="btn btn-primary">Добавить</button>
    </form>

</@navbar.horizontalNav>