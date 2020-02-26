<%@ page import="search.hotels.Country" %>
<h1>Поиск по отелям</h1>
<g:if test="${flash.message}">
    <div class="error">${flash.message}</div>
</g:if>
<g:form method="get" name="form" controller="search" action="results">
    <div class="countries-block">
        <div class="title">Выберите страну поиска</div>
        <div class="countries">
            <g:each in="${Country.list()}" var="country">
                <label for="country-${country.id}">
                    <g:checkBox name="countryId" value="${country.id}" id="country-${country.id}" checked=""/>
                    <span>${country}</span>
                </label>
            </g:each>
        </div>
    </div>
    <div class="field">
        <g:textField name="query" value="" placeholder="Введите название отеля" />
        <g:submitButton name="button" value="Найти" class="button"/>
    </div>
</g:form>