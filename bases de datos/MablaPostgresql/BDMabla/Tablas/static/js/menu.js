$(document).ready(function () {
    
    /* titulosCat = document.querySelectorAll('h2')
    divsCategorias = document.querySelectorAll('.categoria')
    console.log("lenght: "+titulosCat.length) */

    contenedor = document.querySelector("#menuContenido")
    //console.log("porfis",divsCategorias[6])
    
    /* $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        //url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            div = 0
            console.log(res)
            for(i = 0; i <= titulosCat.length ; i++){
                //console.log(res[i].Categoria)                
                titulosCat[i].innerHTML = res[i].Categoria
                
                $.ajax({
                    url: "http://127.0.0.1:8000/getSubcategorias/"+res[i].Categoria,
                    type: "GET",
                    dataType: "JSON",
                    success: function (resSub) {    
                        console.log("cat: ",res[i].Categoria)                    
                        console.log("div: ",div)
                        console.log(resSub)
                        console.log("tit: ",titulosCat[div])
                        if (resSub.length !== 0) {
                            for (let s = 0; s < resSub.length; s++) {
                                p = document.createElement("p")
                                p.setAttribute("class", "subcategoria")                            
                                p.innerHTML = resSub[s].subcategoria                         
                                
                                divsCategorias[div].appendChild(p)                     
                            } 
                        }                                  
                        div++
                        //console.log(div)
                    } 
                })
                
            }           
            
        } 
    }) */
        
    $.ajax({
        url: "http://127.0.0.1:8000/listaCatSub",
        type: "GET",
        dataType: "JSON",

        success: function (res){
            console.log(res)
            for(let i=0; i<=res.length; i++){                
                divCategoria = document.createElement("div")
                divCategoria.setAttribute("class","categoria")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].Categoria
                divCategoria.appendChild(h2Categoria)
                
                
                deCategoria = res[i].Subcategorias
                console.log("subcateeeeeeeeeeeeegorias")
                console.log(deCategoria)
                for (let s = 0; s < deCategoria.length; s++) {
                    //console.log(subcategorias[s].subcategoria)
                    sub = document.createElement("div")
                    sub.setAttribute("class","subcategoria")
                    sub.innerHTML = deCategoria[s].subcategoria
                    divCategoria.appendChild(sub)
                    
                }
                
                contenedor.appendChild(divCategoria)
           }
       } 
    });
        

})