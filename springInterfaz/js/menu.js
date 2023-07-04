$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h2')
    
    //console.log("porfis",titulosCat)
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(i = 0; i <= res.length ; i++){
                titulosCat[i].innerHTML = res[i].Categoria 
            }
            
            
        } 
    })
})