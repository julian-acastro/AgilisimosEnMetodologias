{include 'header.tpl'}
    <div class="row justify-content-center my-5">
        <h1 class="col-10">Ingreso de materiales:</h1>
        <form class="shadow align-items-center col-10 row bg-success-gradiant justify-content-around p-3 border mt-3" action="post">
            <div class="d-flex col-md-3">
                <select class="form-select" name="cartonero" id="cartonero">
                    <option value="" selected>cartonero</option>
                </select>
            </div>
            <div class="col-md-3">
                <select name="material" id="material" class="form-select">
                    <option value="" selected>material</option>
                </select>
            </div>
            <div class="col-md-3">
                <input class="form-control datepicker" type="number" placeholder="Peso"/>
            </div>
            <div class="col-md-3">
                <button class="btn btn-primary">Añadir</button>
            </div>
        </form>

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
                <tr>
                    <th>1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                </tr>
                </tbody>
            </table>
        </div>
        
    </div>  
{include 'footer.tpl'} 