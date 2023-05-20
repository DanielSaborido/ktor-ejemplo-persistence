<#-- @ftlvariable name="campo" type="com.example.models.Campo" -->
<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>Edit campo</h3>
        <form action="/campos/${campo.id}" method="post">
            <p>
                <input type="text" name="valor" value="${campo.value}">
            </p>
            <p>
                <input type="text" name="nombre" value="${campo.name}">
            </p>
            <p>
                <textarea name="descripcion">${campo.description}</textarea>
            </p>
            <p>
                <select name="idtemporada">
                    <option value="">Seleccione una ID</option>
                    <% for (article in articles) { %>
                    <option value="${article.id}">${article.id}</option>
                    <% } %>
                </select>
            </p>
            <p>
                <input type="number" name="orden" value="${campo.order}">
            </p>
            <p>
                <input type="submit" name="_action" value="update">
            </p>
        </form>
    </div>
    <div>
        <form action="/campos/${campo.id}" method="post">
            <p>
                <input type="submit" name="_action" value="delete">
            </p>
        </form>
    </div>
</@layout.header>