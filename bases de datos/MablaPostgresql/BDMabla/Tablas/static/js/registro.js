function msjHtml(msj) {
    const element = document.getElementById('mensaje-error');
    element.textContent = msj; // Actualiza el contenido del elemento HTML
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
        .then(response => {
          if(response.redirected){
            response.redirected
            window.location.href=response.url
          }else{
            msjHtml("El alias ingresado ya existe")
          }
        })
        .then(datos => {
          consultar(),
          console.log(datos)
          window.location.href='inicio.html'
        })
        .catch(
            console.error()
          )
        //promesa
    })
})
