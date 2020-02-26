<meta name="layout" content="page" />
<h1>Создать отель</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: hotel]}"/>
<g:form action="save" method="post">
    <g:render template="form/formcreate" />
    <div class="buttons">
        <g:submitButton name="create" value="Добавить" class="button" action="save"/>
    </div>
</g:form>