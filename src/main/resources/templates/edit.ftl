<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#-- @ftlvariable name="campos" type="kotlin.collections.List<com.example.models.Campo>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>Edit article</h3>
        <form action="/articles/${article.id}" method="post">
            <p>
                <input type="text" name="title" value="${article.title}">
            </p>
            <p>
                <textarea name="body">${article.body}</textarea>
            </p>
            <p>
                <input type="submit" name="_action" value="update">
            </p>
        </form>
    </div>
    <div>
        <form id="deleteForm" action="/articles/${article.id}" method="post">
            <p>
                <input id="deleteButton" type="submit" name="_action" value="delete">
            </p>
        </form>
    </div>

    <script>
        document.getElementById("deleteForm").addEventListener("submit", function(event) {
            event.preventDefault();

            const campos = [
                <#list campos as campo>
                "${campo.name}"
                </#list>
            ];

            if (campos.length === 0){
                if (confirm("¿Estas seguro de que quieres eliminar este articulo?")) {
                    document.getElementById("deleteForm").submit();
                }
            }
            else{
                let confirmMessage = "¿Estas seguro de que quieres eliminar este articulo? Se eliminaran los siguientes campos:\n\n";

                for (let i = 0; i < campos.length; i++) {
                    confirmMessage += campos[i] + "\n";
                }

                if (confirm(confirmMessage)) {
                    document.getElementById("deleteForm").submit();
                }
            }
        });
    </script>
</@layout.header>