<meta name="layout" content="page" />
<h1>Просмотр страны ${country.name}</h1>
<g:render template="/templates/messages"/>
<g:render template="/templates/errors" model="${[category: country]}"/>
<p>Название: <strong>${country.name}</strong></p>
<p>Столица: <strong>${country.capital}</strong></p>
<g:form controller="country" method="get">
    <input type="hidden" name="id" value="${country?.id}" />
    <g:actionSubmit value="Редактировать" action="edit" action_edit="edit" class="button"/>
</g:form>