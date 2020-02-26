<%@ page import="search.hotels.Country" %>
<div class="dialog">
    <div class="row">
        <label for="name">
            <div class="name">Название <span>*</span></div>
            <g:textField type="text" id="name" name="hotel.name" required="required" value="${fieldValue(bean:hotel,field:'name')}" placeholder="Введите название отеля"/>
        </label>
    </div>
    <div class="row">
        <label for="country">
            <div class="name">Страна <span>*</span></div>
            <g:select optionKey="id" id="country" required="required" name="hotel.country" from="${Country.list().sort{it.name}}" noSelection="['null': 'Выберите страну']" value="${fieldValue(bean:hotel,field:'country.id')}"/>
        </label>
    </div>
    <div class="row">
        <label for="website">
            <div class="name">Сайт <span>*</span></div>
            <g:textField id="website" name="hotel.website" value="${fieldValue(bean:hotel,field:'website')}" placeholder="Введите веб-сайт"/>
        </label>
    </div>
    <div class="row">
        <label for="rating">
            <div class="name">Рейтинг <span>*</span></div>
            <input type="hidden" id="rating" name="hotel.rating" required="required" value="${fieldValue(bean:hotel,field:'rating')}">
            <g:render template="stars/stars" />
        </label>
    </div>
</div>