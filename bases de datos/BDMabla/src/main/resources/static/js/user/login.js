function msjHtml(msj) {
    const element = document.getElementById('mensaje-error');
    element.textContent = msj; // Actualiza el contenido del elemento HTML
  }

$(document).ready(function(){
    $('#colorbtn').on('click', function(){
        console.log("hhhhhhhhhhh")
        alias=$('#validationDefaultUsername').val()
        console.log(alias)
        clave=$('#validationDefaultPassword').val()
        $.ajax({
            url: "http://localhost:8080/IniciarSesion/"+alias+"/"+clave,
            type:"GET",
            datatype: "JSON",
            success: function(answer){
            console.log(alias+ clave)
                if(answer=="alias"){
                    window.location.href='index.html'
                }
                else{
                    msjHtml("Este usuario no existe")
                }
            },
            error:function(){
                console.error()
            }
        })
    })
})
