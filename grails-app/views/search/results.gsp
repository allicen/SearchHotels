<%@ page import="search.hotels.Hotel" %>
<meta name="layout" content="page" />
<h1>Результаты поиска по запросу «${query}»</h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:if test="${hotels.size() > 0}">
    <p>Количество найденных отелей: ${hotels.size()}</p>
    <table>
        <tbody>
        <tr>
            <th>Рейтинг отеля</th>
            <th>Название отеля</th>
        </tr>
        <g:each in="${hotels}" status="i" var="hotel" >
            <tr>
            <td>
                <span class="rating-mini"><g:render template="/hotel/stars/starsmall" model="${[hotel: hotel]}"/></span>
            </td>
                <td><div class="name">${hotel.name}</div>
                <g:if test="${hotel.website}">
                    <div class="link"><a href="${hotel.website}" target="_blank">Перейти на сайт</a></div>
                </g:if>
            </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:if test="${hotels.size() == 0}">
    <p>По Вашему запросу ничего не найдено</p>
</g:if>
<g:form action="index">
    <g:submitButton name="back" value="Новый поиск" class="button"/>
</g:form>
