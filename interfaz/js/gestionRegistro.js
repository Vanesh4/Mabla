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
            alert(datos)
            console.log(datos)
        })
        .catch(console.error())
        //promesa
    })
})

//fetch: appi que envia datos por una url