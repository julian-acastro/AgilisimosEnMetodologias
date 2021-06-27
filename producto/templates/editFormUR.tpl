{include 'header.tpl'}
<div class="container mb-5">
    <h3>Editar Cartonero</h3>
    <form class="mt-3" action="confirmEdit" method="POST">
        <div class="row">
            <div class="col">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombre" value="{$urbanRecuperator->nombre}" id="nombre"
                    aria-describedby="emailHelp" required>
            </div>
            <div class="col">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" name="apellido" value="{$urbanRecuperator->apellido}"
                    id="apellido" aria-describedby="emailHelp" required>
            </div>
        </div>
        <div class="row my-2">
            <div class="col">
                <label for="tipo_dni" class="form-label">Tipo Documento</label>
                <select class="form-select" name="tipo_dni" id="tipo_dni" aria-describedby="emailHelp">
                    <option selected>Seleccione el tipo de documento</option>
                    <option value="dni">DNI</option>
                    <option value="le">LE</option>
                    <option value="lc">LC</option>
                    <option value="ci">CI</option>
                </select>
            </div>
            <div class="col">
                <label for="nro_dni" class="form-label">Número Documento</label>
                <input type="text" class="form-control" name="nro_dni" value="{$urbanRecuperator->nro_dni}" id="nro_dni"
                    aria-describedby="emailHelp" required>
            </div>
        </div>
        <div class="mb-3 my-2">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" class="form-control" name="direccion" value="{$urbanRecuperator->direccion}"
                id="direccion" aria-describedby="emailHelp" required>
        </div>
        <div class="mb-3">
            <label for="fecha_nac" class="form-label">Fecha de Nacimiento</label>
            <input type="date" class="form-control" name="fecha_nac" value="{$urbanRecuperator->fecha_nac}"
                id="fecha_nac" aria-describedby="emailHelp" required>
        </div>
        <div class="mb-3">
            <label for="vehiculo" class="form-label">Vehículo</label>
            <select class="form-select" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo"
                aria-describedby="emailHelp">
                <option selected>Seleccione el tipo de vehículo</option>
                <option value="bicicleta">Bicicleta</option>
                <option value="moto">Moto</option>
                <option value="auto">Auto</option>
                <option value="camioneta">Camioneta</option>
                <option value="camion">Camión</option>
            </select>
            <!--<input type="text" class="form-control" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo" aria-describedby="emailHelp"> -->
        </div>
        <input type="hidden" value="{$urbanRecuperator->tipo_dni}" name="oldType">
        <input type="hidden" value="{$urbanRecuperator->nro_dni}" name="oldNro">
        <button type="submit" class="btn btn-primary">Guardar Cambios</button>

    </form>
</div>

{include 'footer.tpl'}