{include 'header.tpl'}
<h1> Acá va  ABM de cartoneros en el sketch página 3 </h1>

<div class="justify-content-center">
        <div class="row justify-content-center">
            <h1 class="col-10 mb-5 mt-5">Listado de cartoneros:</h1>
            <div class="col-10">
                <table class="table shadow">
                    <thead class="bg-success-gradiant">
                        <tr>
                            <th scope="col">DNI</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Apellido</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Vehiculo</th>
                            <th scope="col"></th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $cartoneros item=cartonero}
                            <tr>
                                <td>{$cartonero->nro_dni}</td>
                                <th>{$cartonero->nombre}</th>
                                <td>{$cartonero->apellido}</td>
                                <td>{$cartonero->direccion}</td>
                                <td>{$cartonero->vehiculo}</td>
                                <td>
                                    <a type="button" class="btn rounded-pill btn-info text-white py-2 px-4" href="modifyUrbanRecuperator/{$cartonero->nro_dni}">
                                        Editar
                                    </a>  
                                </td>
                                <td>
                                    <a type="button" class="btn rounded-pill btn-danger text-white py-2 px-4" href="/{$cartonero->nro_dni}">
                                        Eliminar
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>

{include 'footer.tpl'} 