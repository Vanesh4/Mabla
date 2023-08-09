$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h2')
    divsCategorias = document.querySelectorAll('.categoria')
    //console.log("porfis",divsCategorias[6])
    
    $.ajax({
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
                        console.log("div: ",div)
                        console.log(resSub)
                        if (resSub.length != 0) {
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
    })
    
    
})