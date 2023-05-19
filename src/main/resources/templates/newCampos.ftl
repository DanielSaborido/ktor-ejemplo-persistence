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
                <input type="submit">
            </p>
            <p>
                <input type="number" name="order">
            </p>
        </form>
    </div>
</@layout.header>