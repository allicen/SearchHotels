<meta name="layout" content="page" />
<h1>Просмотр отеля</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: hotel]}"/>
<p>Название: <strong>${hotel.name}</strong></p>
<g:if test="${hotel.website}">
    <p>Сайт: <strong>${hotel.website}</strong></p>
</g:if>
<p>Страна: <strong>${hotel.country}</strong></p>
<p>Рейтинг: <span class="rating-mini"><g:render template="stars/starsmall" /></span></p>
<g:form controller="hotel" method="get">
    <input type="hidden" name="id" value="${hotel?.id}" />
    <g:actionSubmit value="Редактировать" action="edit" action_edit="edit" class="button"/>
</g:form>