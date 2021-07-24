<#macro horizontalNav>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://kit.fontawesome.com/9b46d5b3aa.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
              integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/main.css">
        <title>Список книг</title>
    </head>
    <body>
    <div class="container">
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="/">Главная <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/users/takenBooks">Выданные книги</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/books/add">Добавить книгу</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/users/register">Регистрация</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/users/login">Личный кабинет</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/categories">Категории</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <#nested/>

    </div>
    <div class="modal fade" id="takeBookModalCenter" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">Взять книгу</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="/users/takeBook" method="post">
                        <div class="form-group">
                            <input type="hidden" name="bookId" class="form-control" id="bookId">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail">Ваш email</label>
                            <input type="email" name="email" class="form-control"
                                   id="exampleInputEmail" required>
                        </div>
                        <button class="btn btn-primary">Читать</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous">
    </script>
    <script>
        $('#takeBookModalCenter').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)
            var recipient = button.data('whatever')
            var modal = $(this)
            modal.find('.modal-body #bookId').val(recipient)
        })
    </script>
    </html>
</#macro>