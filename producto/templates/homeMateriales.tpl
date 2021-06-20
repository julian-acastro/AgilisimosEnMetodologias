    <div class="row justify-content-start ">
        <div class="col-lg-10 text-center p-4">
            <h1>Materiales aceptados</h1>
        </div>
        {foreach $materiales item=material}
            <!--Material 1-->
            <div class="col-md-2 m-2 d-flex align-items-stretch">
                <div class=" oferta_Card row bg-light border rounded justify-content-center ">
                    <div class="col-lg-12 row p-2">
                        <h3 class="text-center"><b>{$material->nombre}</b></h3>
                        <div class="border bg-white mb-2 p-2 col-12 rounded text-left">
                            <h5>Formato de entrega:</h5>
                            <ul>
                                <li>{$material->formato_entrega}</li>
                            </ul>
                        </div>
                        <div class="border bg-white mb-2 p-2 col-12 rounded text-left">
                            <h5>Restricciones:</h5>
                            <ul>
                                <li>{$material->restricciones}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>   
        {/foreach} 
    </div>
</div>