$(document).ready(function () {

    contenedor = document.querySelector("#menuContenido")
    /* $.ajax({
         url: "http://localhost:8080/getCategorias",
         type: "GET",
         dataType: "JSON",

         success: function (res){
            for(let i=0; i<=res.length; i++){
                divCategoria = document.createElement("div")
                divCategoria.setAttribute("class","categoria")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].categoria

                divCategoria.appendChild(h2Categoria)

                $.ajax({
                    url: "http://localhost:8080/listarSubCategorias/"+res[i].categoria,
                    type: "GET",
                    dataType: "JSON",
                    success: function (sub){
                        console.log(sub)
                        for(let s=0; s<=sub.length; s++){
                        console.log("porfavoooooooooor")
                            subCategoria = document.createElement("p")
                            //subCategoria.setAttribute("class","subcategoria")
                            subCategoria.innerHTML = sub[s]


                        }
                        divCategoria.appendChild(subCategoria)
                    }
                })
                contenedor.appendChild(divCategoria)

            }

        } 

    })*/

    
    $.ajax({
        url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",

        success: function (res){
            console.log(res)
            for(let i=0; i<=res.length; i++){                
                divCategoria = document.createElement("div")
                divCategoria.setAttribute("class","categoria")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].categoria
                divCategoria.appendChild(h2Categoria)

                
                subcategorias = res[i].tablaSubcategorias
                for (let s = 0; s < subcategorias.length; s++) {
                    //console.log(subcategorias[s].subcategoria)
                    subcate = document.createElement("div")
                    subcate.setAttribute("class","subcategoria")
                    subcate.innerHTML = subcategorias[s].subcategoria
                    divCategoria.appendChild(subcate)
                    
                }
                
                contenedor.appendChild(divCategoria)
           }
       } 
    });

    

})