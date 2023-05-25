<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#-- @ftlvariable name="campos" type="kotlin.collections.List<com.example.models.Campo>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>
            ${article.title}
        </h3>
        <p>
            ${article.body}
        </p>
        <h2>
            Campos relacionados:
        </h2>
        <#list campos?reverse as campo>
            <div>
                <h3>
                    <a href="/campos/${campo.id}">Nombre: ${campo.name}</a>
                </h3>
            </div>
        </#list>
        <hr>
        <p>
            <a href="/articles/${article.id}/edit">Edit article</a>
        </p>
    </div>
</@layout.header>