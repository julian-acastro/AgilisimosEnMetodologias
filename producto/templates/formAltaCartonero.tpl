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
                    <option value="1">DNI</option>
                    <option value="2">LE</option>
                    <option value="3">LC</option>
                    <option value="4">CI</option>
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
            <select class="form-select" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo" aria-describedby="emailHelp">
                <option selected>Seleccione el tipo de vehículo</option>
                <option value="1">Bicicleta</option>
                <option value="2">Moto</option>
                <option value="3">Auto</option>
                <option value="4">Camioneta</option>
                <option value="5">Camión</option>
            </select>
            <!--<input type="text" class="form-control" name="vehiculo" id="vehiculo" placeholder="Ingrese Marca y Modelo" aria-describedby="emailHelp"> -->
        </div>

        <button type="submit" class="btn btn-primary">Agregar Cartonero</button>
        
    </form>
</div>

{include 'footer.tpl'}