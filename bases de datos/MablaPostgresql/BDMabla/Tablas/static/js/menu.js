$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h2')
    divsCategorias = document.querySelectorAll('.categoria')
    console.log("lenght: "+titulosCat.length)
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
    
    categoriasLista=[]
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        //url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            //console.log(res)
            for(i = 0; i <= titulosCat.length ; i++){
                //console.log(res[i].Categoria)                
                titulosCat[i].innerHTML = res[i].Categoria
                categoriasLista.push(res[i].Categoria)
                
            }           
            
        } 
    })
    
    console.log(categoriasLista)
    console.log(categoriasLista[2])
    for (let cat = 0; cat <= categoriasLista.length; cat++) {
        console.log("hola?")
        console.log(categoriasLista[cat])
        
    }
})