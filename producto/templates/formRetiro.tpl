{include 'header.tpl'}
<!--Card-Body-->
<div class="card-body">
    <!--Card-Title-->
    <h3 class="card-title text-center my-3 rounded">
        Solicitud de retiro de materiales
    </h3>
    <!--Formulario-->
    <form class="d-flex justify-content-center" method="POST" enctype="multipart/form-data" action="enviarSolicitud">
        <div class="form-contain">
            <div class="col-sm-12">
                <input name="nombre" placeholder="&#xf2b9; Nombre" type="text" id="date-picker-example"
                    class="form-control datepicker mb-4" style="font-family: Arial, FontAwesome" />
            </div>
            <div class="col-sm-12">
                <input name="apellido" placeholder="&#xf2b9; Apellido" type="text" id="date-picker-example"
                    class="form-control datepicker" style="font-family: Arial, FontAwesome" />
            </div>
            <div class="col-sm-12">
                <input name="direccion" placeholder="&#xf015; Direccion" type="text" id="date-picker-example"
                    class="form-control datepicker mb-4" style="font-family: Arial, FontAwesome" />
            </div>
            <div class="col-sm-12">
                <input name="telefono" placeholder="&#xf098; Telefono" type="text" id="date-picker-example"
                    class="form-control datepicker" style="font-family: Arial, FontAwesome" />
            </div>
            <div class="col-sm-12">
                <select name="distancia" class="browser-default custom-select mb-4" id="select">
                    <option value="" disabled="" selected="">
                        Distancia al centro de acopio
                    </option>
                    <option value="1">1 Km</option>
                    <option value="1">2 Km</option>
                    <option value="1">3 Km</option>
                    <option value="1">4 Km</option>
                    <option value="1">5 Km</option>
                    <option value="1">6 Km</option>
                    <option value="7">+6 Km</option>
                </select>
            </div>
            <div class="col-sm-12">
                <select name="material" class="browser-default custom-select mb-4" id="select">
                    <option value="" disabled selected>Material</option>
                    {foreach $materiales item=material}
                        <option value="{$material->ID_material}">{$material->nombre}</option>
                    {/foreach}
                </select>
            </div>
            <div class="col-sm-12">
                <select name="volumen" class="browser-default custom-select mb-4" id="select">
                    <option value="" disabled="" selected="">Volumen del material</option>
                    <option value="entra en una caja.">a) entra en una caja.</option>
                    <option value="entra en el baúl de un auto.">b) entra en el baúl de un auto.</option>
                    <option value="entra en la caja de una camioneta.">c) entra en la caja de una camioneta.</option>
                    <option value="es necesario un camión.">d) es necesario un camión.</option>
                </select>
            </div>
            <p class="searchText"><span>Franja horaria de retiro</span></p>
            <div class="col-sm-12">
                <select name="franja_horaria" class="browser-default custom-select mb-4" id="select">
                    <option value="" disabled="" selected="">Elija turno</option>
                    <option value="Turno mañana de 9 am a 12 am">Turno mañana de 9 am a 12 am</option>
                    <option value="Turno tarde de 13 pm a 17 pm">Turno tarde de 13 pm a 17 pm</option>
                </select>
            </div>
            <p class="searchText"><span>Cargar Imagen</span></p>
            <div class="col-sm-12">
                <div class="custom-file">
                    <input name="imagen" type="file" class="custom-file-input" id="customFile" multiple>
                    <label class="custom-file-label" for="customFile">Elegir Imagen...</label>
                </div>
            </div>
            <div class="col-lg-12 justify-content-end">
                <button type="submit" class="btn rounded-pill btn-primary float-end mt-3">Enviar solicitud de
                    retiro</button>
            </div>
        </div>
    </form>
</div>

</div>
{include 'footer.tpl'}