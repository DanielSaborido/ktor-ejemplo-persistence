<#-- @ftlvariable name="campo" type="com.example.models.Campo" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>
            Nombre: ${campo.name}
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
        <hr>
        <p>
            <a href="/campos/${campo.id}/editCampo">Edit campo</a>
        </p>
    </div>
</@layout.header>