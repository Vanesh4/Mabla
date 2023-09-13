$(document).ready(function () {
    
    /* titulosCat = document.querySelectorAll('h2')
    divsCategorias = document.querySelectorAll('.categoria')
    console.log("lenght: "+titulosCat.length) */

    contenedor = document.querySelector("#menuContenido")
    //console.log("porfis",divsCategorias[6])
    
    $.ajax({
        //url: "http://192.168.43.184/getcate",
        url: "http://127.0.0.1:8000/getcate",
        //url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(let i=0; i<=res.length; i++){
                          
                divCategoria = document.createElement("div")
                divCategoria.setAttribute("class","categoria")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].Categoria
                divCategoria.appendChild(h2Categoria)

                
                subcategorias = res[i].Subcategorias
                //console.log(subcategorias)
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
    })
})