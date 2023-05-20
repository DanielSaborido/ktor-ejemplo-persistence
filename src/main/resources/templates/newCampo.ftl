<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>Create campo</h3>
        <form action="/campos" method="post">
            <p>
                <input type="text" name="valor">
            </p>
            <p>
                <input type="text" name="nombre">
            </p>
            <p>
                <textarea name="descripcion"></textarea>
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
                <input type="number" name="orden">
            </p>
            <p>
                <input type="submit">
            </p>
        </form>
    </div>
</@layout.header>