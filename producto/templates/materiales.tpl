{include 'header.tpl'}
<div class="row justify-content-center my-5">
    <div class="py-3 bg-success-gradiant shadow border rounded-pill row col-8 justify-content-between">
        <div class="col-9 text-center">
            <h1>Agregar material aceptado:</h1>
        </div>
        <div class="col-3 my-auto">
            <a type="button" class="btn rounded-pill btn-primary py-2 px-4" href="altaMaterial">Agregar</a>
        </div>
    </div>
  <h1 class="col-10 my-5">Materiales aceptados:</h1>
    <div class="col-10 ">
            <table class="shadow table">
                <thead class="bg-success-gradiant">
                <tr>
                    <th scope="col">Material</th>
                    <th scope="col">Formato de entrega</th>
                    <th scope="col">Restricciones</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>1</th>
                    <td> Lorem ipsum dolor sit amet consectetur adipisicing elit. Enim delectus excepturi, necessitatibus animi nostrum temporibus modi id quis voluptatum nisi quod fuga repellendus explicabo cumque saepe asperiores tempore veritatis neque?   </td>
                    <td>
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Doloremque, commodi aspernatur. Molestiae quas est voluptatem eos mollitia deserunt optio alias, laborum totam autem eaque libero dolore saepe aliquam doloribus sint?
                    </td>
                    <td>
                        <a type="button" class="btn rounded-pill btn-info text-white py-2 px-4" href="editarMaterial">Editar</a>
                        
                    </td>
                    <td>
                        <a type="button" class="btn rounded-pill btn-danger text-white py-2 px-4" href="eliminarMaterial">Eliminar</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
  
{include 'footer.tpl'} 