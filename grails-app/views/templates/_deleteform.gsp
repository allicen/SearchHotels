<g:form>
    <input type="hidden" name="id" value="${category?.id}" />
    <g:actionSubmit onclick="return confirm('Вы уверены?');" value="Удалить" action="delete" />
</g:form>