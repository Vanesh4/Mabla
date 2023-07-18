$(document).ready(function () {
    
   titulosCat = document.querySelectorAll('h2')
    
    //console.log("porfis",titulosCat)
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        //url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(i = 0; i <= res.length ; i++){
                console.log(res[i].Categoria)
                titulosCat[i].innerHTML = res[i].Categoria
            }           
            
        } 
    })
    $.ajax({
        url: "http://127.0.0.1:8000/getsubcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {

            divCategorias = document.getElementsByClassName("categoria")
            console.log(divCategorias)

            console.log(res)
            listacategorias=[]
            for (let c = 0; c < titulosCat.length; c++) {
                listacategorias.push(titulosCat[c].textContent)
                for (let s = 0; s < res.length; s++) {
                    subcate = document.createElement("p")
                    subcate.setAttribute("class","subcategoria")

                    if(listacategorias[c] == "Sustantivos" && res[s].categoria_id=="Sustantivos"){
                        subcate.innerHTML = res[s].subcategoria
                        divCategorias[0].appendChild(subcate)
                    }

                    if(listacategorias[c] == "Adjetivos" && res[s].categoria_id=="Adjetivos"){
                        subcate.innerHTML = res[s].subcategoria
                        divCategorias[3].appendChild(subcate)
                    }
                }
            }
            
            
        } 
    })
})