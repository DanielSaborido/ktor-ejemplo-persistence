<#-- @ftlvariable name="campo" type="com.example.models.Campo" -->
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