<%@ page import="search.hotels.Country" %>
<meta name="layout" content="page" />
<h1>Справочник стран</h1>
<g:render template="/templates/messages"/>
<g:form action="create">
    <g:submitButton name="back" value="Добавить новую страну" class="button"/>
</g:form>
<div class="table">
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="name" title="Название" />
            <g:sortableColumn property="capital" title="Столица" />
            <th class="actions-column">Действия</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${countries}" status="i" var="country">
            <tr>
                <td><g:link action="show" id="${country.id}">${country.name}</g:link></td>
                <td>${country.capital}</td>
                <td>
                    <div class="actions">
                        <g:render template="/templates/editform" model="${[category: country]}"/>
                        <g:render template="/templates/deleteform" model="${[category: country]}"/>
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
<div class="paginateButtons">
    <g:paginate total="${Country.count}" prev="Назад" next="Вперед"/>
</div>