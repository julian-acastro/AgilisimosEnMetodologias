{include 'header.tpl'}
<div class="row justify-content-center my-5">
    <h1 class="col-10">Ingreso de materiales:</h1>
    <form class="shadow align-items-center col-10 row bg-success-gradiant justify-content-around p-3 border mt-3"
        method="post" action="agregarAcopio">
        <div class="d-flex col-md-3">
            <select class="form-select" name="cartonero" id="cartonero">
                <option value="" disabled selected>Cartonero</option>
                {foreach $cartoneros item=cartonero}
                    <option value="{$cartonero->tipo_dni}/{$cartonero->nro_dni}">
                        {$cartonero->nombre}, {$cartonero->apellido}
                    </option>
                {/foreach}
            </select>
        </div>
        <div class="col-md-3">
            <select name="material" id="material" class="form-select">
                <option value="" disabled selected>Material</option>
                {foreach $materiales item=material}
                    <option value="{$material->ID_material}">{$material->nombre}</option>
                {/foreach}
            </select>
        </div>
        <div class="col-md-3">
            <input class="form-control datepicker" type="number" name="peso" placeholder="Peso" />
        </div>
        <div class="col-md-3">
            <button class="btn btn-primary">Añadir</button>
        </div>
    </form>
    {if $acopios}
        <h1 class="col-10 my-5">Ingresados:</h1>
        <div class="col-10 ">
            <table class="shadow table">
                <thead class="bg-success-gradiant">
                    <tr>
                        <th scope="col">Cartonero</th>
                        <th scope="col">Material</th>
                        <th scope="col">Peso</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $acopios item=material}
                        <tr>
                            <th>{$material->nombre_cartonero} {$material->apellido}</th>
                            <td>{$material->nombre_material}</td>
                            <td>{$material->kilos_acopiados}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        <h2 class="col-10 my-5">Materiales por cartonero:</h2>
        <div class="col-10">
            {foreach $cartoneros item=cartonero}
                <div class="shadow accordion my-3" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne{$cartonero->nro_dni}" aria-expanded="true"
                                aria-controls="collapseOne{$cartonero->nro_dni}">
                                <p class="my-2">
                                    <b class="nombre">{$cartonero->nombre} {$cartonero->apellido} </b> | Tipo Identificación:
                                    {$cartonero->tipo_dni} | Numeracion: {$cartonero->nro_dni}
                                </p>
                            </button>
                        </h2>
                        <div id="collapseOne{$cartonero->nro_dni}" class="accordion-collapse collapse"
                            aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <table class="table shadow-sm my-3">
                                    <thead class="bg-success-gradiant">
                                        <tr>
                                            <th scope="col">Material</th>
                                            <th scope="col">Peso total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $totalMaterialesCartonero item=totalMaterialCartonero}
                                            {if $cartonero->nro_dni === $totalMaterialCartonero->nro_dni}
                                                <tr>
                                                    <td>{$totalMaterialCartonero->nombre_material}</td>
                                                    <td>{$totalMaterialCartonero->kilos_acopiados}</td>
                                                </tr>
                                            {/if}
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>
    {/if}
</div>
{include 'footer.tpl'}