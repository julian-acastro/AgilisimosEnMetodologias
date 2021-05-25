{include 'header.tpl'}
<div class="card shadow mt-5 bg-white rounded">
      <!--Card-Body-->
      <div class="card-body">
        <!--Card-Title-->
        <p class="card-title text-center shadow my-3 rounded">
          Solicitud de retiro de materiales
        </p>
        <div class="icons text-center">
          <i class="fa fa-truck fa-2x" aria-hidden="true"></i>
        </div>
        <hr />
        <p class="searchText"><strong>Complete el formulario</strong></p>
        <!--First Row-->
        <div class="row">
          <div class="col-sm-6">
            <input
              placeholder="&#xf073; Nombre"
              type="text"
              id="date-picker-example"
              class="form-control datepicker mb-4"
              style="font-family: Arial, FontAwesome"
            />
          </div>
          <div class="col-sm-6">
            <input
              placeholder="&#xf073; Apellido"
              type="text"
              id="date-picker-example"
              class="form-control datepicker"
              style="font-family: Arial, FontAwesome"
            />
          </div>
        </div>
        <!--Second Row-->
        <div class="row">
          <div class="col-sm-6">
            <input
              placeholder="&#xf073; Direccion"
              type="text"
              id="date-picker-example"
              class="form-control datepicker mb-4"
              style="font-family: Arial, FontAwesome"
            />
          </div>
          <div class="col-sm-6">
            <input
              placeholder="&#xf073; Telefono"
              type="text"
              id="date-picker-example"
              class="form-control datepicker"
              style="font-family: Arial, FontAwesome"
            />
          </div>
        </div>

        <!--Third Row-->
        <div class="row">
          <div class="col-sm-6">
            <select class="browser-default custom-select mb-4" id="select">
              <option value="" disabled="" selected="">
                Distancia al centro de acopio
              </option>
              <option value="1">1 Km</option>
              <option value="2">2 Km</option>
              <option value="3">3 Km</option>
              <option value="4">4 Km</option>
              <option value="5">5 Km</option>
              <option value="6">6 Km</option>
              <option value="7">+6 Km</option>
            </select>
          </div>
          <div class="col-sm-6">
            <select class="browser-default custom-select mb-4" id="select">
              <option value="" disabled="" selected="">
                Volumen del material
              </option>
              <option value="a">a) entra en una caja.</option>
              <option value="b">b) entra en el baúl de un auto.</option>
              <option value="c">c) entra en la caja de una camioneta.</option>
              <option value="d">d) es necesario un camión.</option>
            </select>
          </div>
        </div>
        <div class="row mt-4">
          <div class="col-sm-6">
            <select class="browser-default custom-select mb-4" id="select">
              <option value="" disabled="" selected="">Desde</option>
              <option value="1">6:00 AM</option>
              <option value="2">3:00 PM</option>
              <option value="3">6:00 PM</option>
            </select>
          </div>
          <div class="col-sm-6">
            <select class="browser-default custom-select mb-4" id="select">
              <option value="" disabled="" selected="">Hasta</option>
              <option value="1">6:00 AM</option>
              <option value="2">3:00 PM</option>
              <option value="3">6:00 PM</option>
            </select>
          </div>
          <div class="col-lg-12 justify-content-end">
            <a href="#" class="btn btn-primary float-end mt-5">publicar</a>
          </div>
        </div>
      </div>
    </div>
{include 'footer.tpl'} 