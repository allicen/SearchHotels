<meta name="layout" content="page" />
<h1>Добавить страну</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: country]}"/>
<g:form action="save" method="post">
    <g:render template="form" />
    <div class="buttons">
        <g:submitButton name="create" value="Создать" class="button" action="save"/>
    </div>
</g:form>