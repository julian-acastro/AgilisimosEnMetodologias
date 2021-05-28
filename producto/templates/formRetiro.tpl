{include 'header.tpl'}
    <!--Card-Body-->
    <div class="card-body">
        <!--Card-Title-->
        <h3 class="card-title text-center my-3 rounded">
            Solicitud de retiro de materiales
        </h3>
        <!--Formulario-->
        <div class="d-flex justify-content-center">
            <div class="form-contain">
                <div class="col-sm-12">
                    <input placeholder="&#xf2b9; Nombre" type="text" id="date-picker-example"
                        class="form-control mb-4" style="font-family: Arial, FontAwesome" />
                </div>
                <div class="col-sm-12">
                    <input placeholder="&#xf2b9; Apellido" type="text" id="date-picker-example"
                        class="form-control datepicker" style="font-family: Arial, FontAwesome" />
                </div>
                <div class="col-sm-12">
                    <input placeholder="&#xf015; Direccion" type="text" id="date-picker-example"
                        class="form-control datepicker mb-4" style="font-family: Arial, FontAwesome" />
                </div>
                <div class="col-sm-12">
                    <input placeholder="&#xf098; Telefono" type="text" id="date-picker-example"
                        class="form-control datepicker" style="font-family: Arial, FontAwesome" />
                </div>
                <div class="col-sm-12">
                    <select class="text-secondary form-select browser-default custom-select mb-4" id="select">
                        <option value="" selected>Distancia al centro de acopio</option>
                        <option value="1">1 Km</option>
                        <option value="2">2 Km</option>
                        <option value="3">3 Km</option>
                        <option value="4">4 Km</option>
                        <option value="5">5 Km</option>
                        <option value="6">6 Km</option>
                        <option value="7">+6 Km</option>
                    </select>
                </div>
                <div class="col-sm-12">
                    <select class="text-secondary form-select browser-default custom-select mb-4" id="select">
                        <option value="" disabled="" selected="">Tipo material</option>
                        <option value="a">Envases Plásticos</option>
                        <option value="b">Botellas de Vidrio</option>
                        <option value="c">Envases de Aluminio</option>
                        <option value="d">Cartón</option>
                        <option value="d">Papel</option>
                        <option value="d">Tetrabrik</option>
                        <option value="d">Latas de conservas</option>
                        <option value="d">Vaios dentro de los materiales aceptados</option>
                    </select>
                </div>
                <div class="col-sm-12">
                    <select class="text-secondary form-select browser-default custom-select mb-4" id="select">
                        <option value="" disabled="" selected="">Volumen del material</option>
                        <option value="a">a) entra en una caja.</option>
                        <option value="b">b) entra en el baúl de un auto.</option>
                        <option value="c">c) entra en la caja de una camioneta.</option>
                        <option value="d">d) es necesario un camión.</option>
                    </select>
                </div>
                <p class="searchText"><span>Franja horaria de retiro</span></p>
                <div class="col-sm-12">
                    <select class="text-secondary form-select browser-default custom-select mb-4" id="select">
                        <option value="" disabled="" selected="">Elija turno</option>
                        <option value="1">Turno mañana de 9 am a 12 am</option>
                        <option value="2">Turno tarde de 13 pm a 17 pm</option>
                    </select>
                </div>
                <p class="searchText"><span>Cargar Imagen</span></p>
                <div class="col-sm-12">
                    <div class="custom-file">
                        <input class="text-secondary form-control" type="file" id="customFile">
                    </div>
                </div>
                <div class="col-lg-12 justify-content-end">
                    <a href="#" class="btn rounded-pill btn-primary float-end mt-3">Publicar</a>
                </div>
            </div>
        </div>
    </div>
{include 'footer.tpl'}