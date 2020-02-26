<% def count=5 %>
<g:each in="${1..count}" var="star" >
    <g:if test="${star <= hotel.rating}">
        <span class="active"></span>
    </g:if>
    <g:if test="${star > hotel.rating}">
        <span></span>
    </g:if>
</g:each>