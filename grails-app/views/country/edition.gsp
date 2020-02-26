<meta name="layout" content="page" />
<h1>Редактировать страну ${country.name}</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: country]}"/>
<g:form action="update" method="post" >
    <g:render template="form" />
    <div class="buttons">
        <input type="hidden" name="id" value="${country?.id}" />
        <g:submitButton name="update" value="Обновить" class="button" action="update"/>
    </div>
</g:form>
