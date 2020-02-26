<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="x-ua-compatible" content="IE=edge" />
    <title>Сервис поиска отелей</title>
    <asset:stylesheet src="app.css"/>
</head>
<body>
<div class="container">
    <div class="main">
        <header>
            <menu>
                <div class="logo">
                    <a href="/"><span>TopHotels</span></a>
                </div>
                <div class="items">
                    <div class="item"><a href="/hotel">Отели</a></div>
                    <div class="item"><a href="/country">Страны</a></div>
                </div>
            </menu>
        </header>
        <div class="content">
            <g:if test="${controllerName != null}">
                <div class="breadcrumb"><a href="/">Главная</a>  → <g:link>${controllerName}</g:link> </div>
            </g:if>
            <g:layoutBody/>
        </div>
        <footer>
        <div class="copy">
            © ${new GregorianCalendar().getWeekYear()}. Все права защищены
        </div>
        </footer>
</div>
<asset:javascript src="app.js"/>
</body>
</html>