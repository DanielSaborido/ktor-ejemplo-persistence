<#-- @ftlvariable name="articles" type="kotlin.collections.List<com.example.models.Article>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <#list articles?reverse as article>
        <div>
            <h3>
                <a href="/articles/${article.id}">Titulo: ${article.title}</a>
            </h3>
            <p>
               Cuerpo: ${article.body}
            </p>
        </div>
    </#list>
    <hr>
    <p>
        <a href="/articles/new">Create article</a>
    </p>
    <p>
        <a href="/campos">Show campos</a>
    </p>
</@layout.header>