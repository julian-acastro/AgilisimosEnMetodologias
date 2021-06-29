{include 'header.tpl'}
<div class="justify-content-center">
    <div class="row justify-content-center">
        <h1 class="col-10 mb-5 mt-5">Listado de pedidos de retiro:</h1>
        <div class="col-10">
            <table class="table shadow">
                <thead class="bg-success-gradiant">
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Apellido</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Marerial a retirar</th>
                        <th scope="col">Volumen</th>
                        <th scope="col">Imagen</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $pedidos item=pedido}
                        <tr>
                            <th>{$pedido->nombre}</th>
                            <td>{$pedido->apellido}</td>
                            <td>{$pedido->direccion}</td>
                            <td>{$pedido->nombre_material}</td>
                            <td>{$pedido->volumen}</td>
                            <td><img src="{$pedido->imagen}" </td>

                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
{include 'footer.tpl'}