{include 'header.tpl'}
<div class="container mb-5">
    <h3>Agregar Nuevo Material</h3>
    <form class="mt-3" action="addMaterial" method="POST">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre" aria-describedby="emailHelp">
        </div>
        <div class="form-outline mb-4">
            <label class="form-label" for="formatoEntrega">Formato de Entrega del Material</label>
            <textarea class="form-control" name="entrega" id="formatoEntrega" rows="3"></textarea>
        </div>
        <div class="form-outline mb-4">
            <label class="form-label" for="exepcion">Restricciones</label>
            <textarea class="form-control" name="rechazo" id="exepcion" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Agregar Material</button>
    </form>
</div>

{include 'footer.tpl'}