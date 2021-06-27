{include 'header.tpl'}
<div class="container mb-5">
    <h3>Agregar Nuevo Cartonero</h3>
    <form class="mt-3" action="addCartonero" method="POST">
        <div class="row">
            <div class="col">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" aria-describedby="emailHelp">
            </div>
            <div class="col">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" name="apellido" id="apellido" aria-describedby="emailHelp">
            </div>
        </div>
        <div class="row my-2">
            <div class="col">
                <label for="tipo_dni" class="form-label">Tipo Documento</label>
                <select class="form-select" name="tipo_dni" id="tipo_dni" aria-describedby="emailHelp">
                    <option selected>Seleccione el tipo de documento</option>
                    <option value="DNI">DNI</option>
                    <option value="LE">LE</option>
                    <option value="LC">LC</option>
                    <option value="CI">CI</option>
                </select>
            </div>
            <div class="col">
                <label for="nro_dni" class="form-label">Número Documento</label>
                <input type="text" class="form-control" name="nro_dni" id="nro_dni" aria-describedby="emailHelp">
            </div>
        </div>
        <div class="mb-3 my-2">
            <label for="direccion" class="form-label">Dirección</label>
            <input type="text" class="form-control" name="direccion" id="direccion" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="fecha_nac" class="form-label">Fecha de Nacimiento</label>
            <input type="date" class="form-control" name="fecha_nac" id="fecha_nac" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="vehiculo" class="form-label">Vehículo</label>
            <select class="form-select" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo"
                aria-describedby="emailHelp">
                <option selected>Seleccione el tipo de vehículo</option>
                <option value="Bicicleta">Bicicleta</option>
                <option value="Moto">Moto</option>
                <option value="Auto">Auto</option>
                <option value="Camioneta">Camioneta</option>
                <option value="Camión">Camión</option>
            </select>
            <!--<input type="text" class="form-control" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo" aria-describedby="emailHelp"> -->
        </div>

        <button type="submit" class="btn btn-primary">Agregar Cartonero</button>

    </form>
</div>

{include 'footer.tpl'}