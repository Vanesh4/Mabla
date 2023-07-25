$(document).ready(function () {
    
    /*titulosCat = document.querySelectorAll('h2')

    $.ajax({
        *//* url: "http://127.0.0.1:8000/getcate", *//*
        url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(i = 0; i <= res.length ; i++){
                titulosCat[i].innerHTML = res[i].categoria
            }
            console.log("tit ",titulosCat)
        }
    })*/

    categorias = []
    contenedor = document.querySelector("#menuContenido")
     $.ajax({
         url: "http://localhost:8080/getCategorias",
         type: "GET",
         dataType: "JSON",

         success: function (res){
            for(let i=0; i<=res.length; i++){
                divCategoria = document.createElement("div")
                divCategoria.setAttribute("class","categoria")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].categoria

                categorias.push(res[i].categoria)
                divCategoria.appendChild(h2Categoria)
                
                /* $.ajax({
                    url: "http://localhost:8080/listarSubCategorias/"+res[i].categoria,
                    type: "GET",
                    dataType: "JSON",
                    success: function (sub){
                        console.log(sub)
                        for(let s=0; s<=sub.length; s++){
                            subcate = document.createElement("p")
                            console.log(subcate)
                            subcate.innerHTML = sub[s][0]
                            console.log(subcate)
                            divCategoria.appendChild(subcate)                            
                        }                        
                    }
                }) */
                
                contenedor.appendChild(divCategoria)

            }

        }
        
    })
    console.log(categorias)
    for (let i = 0; i < categorias.length; i++) {
        $.ajax({
            url: "http://localhost:8080/listarSubCategorias/"+categorias[i],
            type: "GET",
            dataType: "JSON",
            success: function (sub){
                console.log(sub)
                for(let s=0; s<=sub.length; s++){
                    subcate = document.createElement("p")
                    console.log(subcate)
                    subcate.innerHTML = sub[s][0]
                    console.log(subcate)
                    divCategoria.appendChild(subcate)                            
                }                        
            }
        })        
    }
    
    
})