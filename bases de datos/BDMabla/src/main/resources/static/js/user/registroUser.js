function msjHtml(msj) {
    const element = document.getElementById('mensaje-error');
    element.textContent = msj; // Actualiza el contenido del elemento HTML
  } 

$(document).ready(function(){ 
    $('#colorbtn').on('click', function(){
        object={
            alias:$('#validationUsername').val(),
            nombre:$('#validationNombre').val(),
            apellido:$('#validationApellido').val(),
            telefono: parseInt($('#validationTelefono').val()),
            correo:$('#validationCorreo').val(),
            contrasenia:$('#validationPassword').val(),  
        }
        send=JSON.stringify(object)
        $.ajax({
            url: "http://localhost:8080/Insertaruser",
            type:"POST",
            data: send,
            contentType: "application/JSON",
            datatype: JSON,
            success: function(answer){
                if(answer=="/inicio"){
                    alert("la respuesta es: "+answer+" y se supone que la tiene que redireccionar a inicio")
                    window.location.href='consultar.html'
                }
                else{
                    alert("entro al else")
                    msjHtml("El alias ingresado ya existe")
                }
            },
            error:function(){
                console.error()
            }
        })
    })
})
