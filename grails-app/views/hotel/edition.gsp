<meta name="layout" content="page" />
<h1>Редактировать отель</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: hotel]}"/>
<g:form action="update" method="post" >
    <g:render template="form/formupdate" />
    <div class="buttons">
        <input type="hidden" name="id" value="${hotel?.id}" />
        <g:submitButton name="update" value="Обновить" class="button" action="update"/>
    </div>
</g:form>