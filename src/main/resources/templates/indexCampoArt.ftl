<#-- @ftlvariable name="campos" type="kotlin.collections.List<com.example.models.Campo>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <#list campos?reverse as campo>
        <div>
            <h3>
                <a href="/campos/${campo.id}">${campo.name}</a>
            </h3>
            <p>
                ${campo.value}
            </p>
            <p>
                ${campo.description}
            </p>
            <p>
                ${campo.seasonId}
            </p>
            <p>
                ${campo.order}
            </p>
        </div>
    </#list>
    <hr>
</@layout.header>