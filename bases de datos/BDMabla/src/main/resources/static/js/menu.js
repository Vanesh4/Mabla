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
    })

    

})