{include 'header.tpl'}
<div class="container mb-5">
    <h3>Editar Material</h3>
    <form class="mt-3" action="editMaterial" method="POST">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" value="{$material->nombre}" name="nombre" id="nombre" aria-describedby="emailHelp">
        </div>
        <div class="form-outline mb-4">
            <label class="form-label" for="formatoEntrega">Formato de Entrega del Material</label>
            <textarea class="form-control" name="formato_entrega" id="formatoEntrega" rows="3">{$material->formato_entrega}</textarea>
        </div>
        <div class="form-outline mb-4">
            <label class="form-label" for="exepcion">Restricciones</label>
            <textarea class="form-control" name="restricciones" id="exepcion" rows="3">{$material->restricciones}</textarea>
        </div>
        <button type="submit" class="btn btn-primary" name="id_material_editar" value="{$material->ID_material}">Editar Material</button>
    </form>
</div>

{include 'footer.tpl'}