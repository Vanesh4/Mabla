$(document).ready(function(){
    $('#ingresar').on('click', function(){
        console.log("hhhhhhhhhhh")
        alias=$('#validationDefaultUsername').val()
        console.log(alias)
        clave=$('#validationDefaultPassword').val()
        $.get("/user", function(data){
            console.log(data)
                /* var contentDiv = document.getElementById("content"); */
                if (data != null) {
                    $("#ingresar").textContent=""
                    /* $("#imgdeperfil").html('<img id="fotoUser" src="data.picture" alt="">'); */
                    /* contentDiv.innerHTML = '<p>Bienvenido, ' + data.email + '!</p>' +
                        '<a href="/logout">Cerrar sesión</a>'; */
                } 
                
            })
            .catch(error => {
                console.error("Error en la solicitud AJAX:", error);
            });
    })
})
