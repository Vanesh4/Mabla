function showPopover(input) {
    const popover = input.nextElementSibling;
    popover.classList.add("active");
}

function hidePopover(input) {
    const popover = input.nextElementSibling;
    popover.classList.remove("active");
}

function validarCamposVacios(formulario) {
    inputs = formulario.querySelectorAll('input');
    isValid= true;
    for (let i = 0; i < inputs.length; i++) {
      if (inputs[i].value === '') {
        isValid= false;
        showPopover(inputs[i])
        return false;
      }
      else{
        hidePopover(inputs[i])
      }
    }
    return true;
}

function msjHtml(msj) {
    const element = document.getElementById('mensaje-error');
    element.textContent = msj; // Actualiza el contenido del elemento HTML
} 

$(document).ready(function(){ 
    $('#colorbtn').on('click', function(){
        Event.preventDefault(); 
        formulario = document.querySelector('#formInsert');
        if (validarCamposVacios(formulario)) {
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
                        window.location.href='index.html'
                    }
                    else{
                        msjHtml("El alias ingresado ya existe")
                    }
                },
                error:function(){
                    console.error()
                }
            })
        }
        /* else {

            console.log('Hay campos vacíos');
        } */
       }) 
    })

