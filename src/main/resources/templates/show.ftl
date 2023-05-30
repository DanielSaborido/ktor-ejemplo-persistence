<#-- @ftlvariable name="article" type="com.example.models.Article" -->
<#-- @ftlvariable name="campos" type="kotlin.collections.List<com.example.models.Campo>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>
           Titulo: ${article.title}
        </h3>
        <p>
           Cuerpo: ${article.body}
        </p>
        <#if campos?size != 0>
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
        </#if>
        <hr>
        <p>
            <a href="/articles/${article.id}/edit">Edit article</a>
        </p>
    </div>
</@layout.header>