{include 'header.tpl'}
<div class="row justify-content-center my-5">
    <div class="py-3 bg-success-gradiant shadow border rounded-pill row col-8 justify-content-between">
        <div class="col-9 text-center">
            <h1>Agregar material aceptado:</h1>
        </div>
        <div class="col-3 my-auto">
            <a type="button" class="btn rounded-pill btn-primary py-2 px-4" href="altaMaterial">Agregar</a>
        </div>
    </div>
    <h1 class="col-10 my-5">Materiales aceptados:</h1>
    <div class="col-10 ">
        <table class="shadow table">
            <thead class="bg-success-gradiant">
                <tr>
                    <th scope="col">Material</th>
                    <th scope="col">Formato de entrega</th>
                    <th scope="col">Restricciones</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach $materiales item=material}
                    <tr>
                        <th>{$material->nombre}</th>
                        <td>{$material->formato_entrega}</td>
                        <td>{$material->restricciones}</td>
                        <td>
                            <a type="button" class="btn rounded-pill btn-info text-white py-2 px-4"
                                href="editarMaterial/{$material->ID_material}">
                                Editar
                            </a>
                        </td>
                        <td>
                            <a type="button" class="btn rounded-pill btn-danger text-white py-2 px-4"
                                href="eliminarMaterial/{$material->ID_material}">
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