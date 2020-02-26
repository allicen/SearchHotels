<%@ page import="search.hotels.Hotel" %>
<meta name="layout" content="page" />
<h1>Справочник отелей</h1>
<g:render template="/templates/messages"/>
<g:form action="create">
    <g:submitButton name="back" value="Добавить новый отель" class="button"/>
</g:form>
<div class="table">
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="name" title="Название" />
            <g:sortableColumn property="country" title="Страна" />
            <g:sortableColumn property="website" title="Сайт" />
            <g:sortableColumn property="rating" title="Рейтинг" />
            <th class="actions-column">Действия</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${ hotels }" status="i" var="hotel">
            <tr>
                <td><g:link action="show" id="${hotel.id}">${hotel.name}</g:link></td>
                <td>${hotel.country}</td>
                <td>${hotel.website}</td>
                <td>
                    <div class="rating-mini">
                        <g:render template="stars/starsmall" model="${[hotel: hotel]}"/>
                    </div>
                </td>
                <td>
                    <div class="actions">
                        <g:render template="/templates/editform" model="${[category: hotel]}"/>
                        <g:render template="/templates/deleteform" model="${[category: hotel]}"/>
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="paginateButtons">
    <g:paginate total="${Hotel.count}" prev="Назад" next="Вперед"/>
</div>