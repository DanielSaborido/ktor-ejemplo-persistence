<#-- @ftlvariable name="campo" type="com.example.models.Campo" -->
<#import "_layout.ftl" as layout />
<@layout.header>
    <div>
        <h3>
            ${campo.name}
        </h3>
        <p>
            ${campo.value}
        </p>
        <p>
            ${campo.description}
        </p>
        <p>
            ${campo.order}
        </p>
        <hr>
        <p>
            <a href="/campos/${campo.id}/editCampo">Edit article</a>
        </p>
    </div>
</@layout.header>