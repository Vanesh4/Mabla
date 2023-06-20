function msjHtml(msj) {
    const element = document.getElementById('mensaje-error');
    element.textContent = msj; // Actualiza el contenido del elemento HTML
  } 
  function irAInterfaz() {
    // Código para redirigir a la interfaz deseada
    window.location.href = 'http://127.0.0.1:5500/BDMabla/Tablas/templates/inicio.html';
  }

  
  function mostrarErrorEnHTML(error) {
    if (error instanceof SyntaxError) {
        msjHtml("El alias ingresado ya existe");
    } else {
      // Mostrar otros errores no relacionados con JSON
      console.log(error);
    }
  }
  
document.addEventListener("DOMContentLoaded", function(){
    document.getElementById("formInsert").addEventListener("submit",function(event){
        event.preventDefault();

        var data={
            alias: document.getElementById('validationUsername').value,
            nombre: document.getElementById('validationNombre').value,
            apellido: document.getElementById('validationApellido').value,
            telefono: document.getElementById('validationTelefono').value,
            correo: document.getElementById('validationCorreo').value,
            clave: document.getElementById('validationPassword').value  
        };

        jsonData= JSON.stringify(data)
        fetch('http://127.0.0.1:8000/insertUser',{
            method:'POST',
            body:jsonData,
            headers:{
                'Content-Type':'Tablas/json'
            }
        })
        .then(response => response.json())
        .then(datos => {
          consultar(),
          $('#colorbtn').on('click',function(){
            
          })
          console.log(datos)
        })
        .catch(error => {
            // Capturar el error y mostrarlo en el HTML
            mostrarErrorEnHTML(error);
          })
        //promesa
    })
})
