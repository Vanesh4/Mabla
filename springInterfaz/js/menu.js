$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h2')
    
    $.ajax({
        /* url: "http://127.0.0.1:8000/getcate", */
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
    })

    console.log(titulosCat[0])


    
    listacategorias=[]

    for (let c = 0; c < titulosCat.length; c++) {
        listacategorias.push(titulosCat[c].value)      
    } 
    console.log("categorias",listacategorias)
    

})