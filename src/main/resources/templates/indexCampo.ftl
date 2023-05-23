<#-- @ftlvariable name="campos" type="kotlin.collections.List<com.example.models.Campo>" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <#list campos?reverse as campo>
        <div>
            <h3>
                <a href="/campos/${campo.id}">Nombre: ${campo.name}</a>
            </h3>
            <p>
                Valor: ${campo.value}
            </p>
            <p>
                Descripcion: ${campo.description}
            </p>
            <p>
                Season ID: ${campo.seasonId}
            </p>
            <p>
                Orden: ${campo.order}
            </p>
        </div>
    </#list>
    <hr>
    <p>
        <a href="/campos/newCampo">Create campo</a>
    </p>
</@layout.header>