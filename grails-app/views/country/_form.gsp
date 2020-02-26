<%@ page import="search.hotels.Country" %>
<div class="dialog">
    <div class="row">
        <label for="country">
            <div class="name">Название <span>*</span></div>
            <g:textField type="text" id="country" name="name" required="required" value="${fieldValue(bean:country,field:'name')}" placeholder="Введите название страны"/>
        </label>
    </div>
    <div class="row">
        <label for="capital">
            <div class="name">Столица <span>*</span></div>
            <g:textField type="text" id="capital" name="capital" required="required" value="${fieldValue(bean:country,field:'capital')}" placeholder="Введите столицу страны"/>
        </label>
    </div>
</div>