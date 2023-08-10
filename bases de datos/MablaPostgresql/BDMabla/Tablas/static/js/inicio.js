$(document).ready (()=>{

    header = document.getElementById("header")

    $("#imgBotonAbrirMenu").on("click", ()=>{      
        header.style.setProperty("display", "inherit")
    })

    $("#imgBotonCerrarMenu").on("click", ()=>{
        //console.log("porfavor")
        header.style.setProperty("display", "none")
    })


    //get Comentarios
    commentsList = document.querySelector(".listComent")
    
    $.ajax({
        url: "http://192.168.1.10/tablaComment",
        //url: "http://127.0.0.1:8000/tablaComment",
        //url: "http://localhost:8080/users",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            
            for (let i = 0; i < res.length; i++) {
            
                comentario = document.createElement("div")
                comentario.setAttribute("id","comentario")

                usuario = document.createElement("p")
                usuario.setAttribute("id","user")
                usuario.innerHTML = res[i].alias_id

                texto = document.createElement("p")
                texto.setAttribute("id","coment")
                texto.innerHTML = res[i].texto

                comentario.appendChild(usuario)
                comentario.appendChild(texto)
                commentsList.appendChild(comentario)
            }
        }
    })

    //enviar comentarios

    contenedorComentar = document.getElementsByClassName('paraComentar')
    console.log(contenedorComentar)
    $(".inputEnviarComentario").on("click", ()=>{

        console.log("entroofuncionn")
        
        /* msj = document.createElement("p")
        msj.setAttribute("id","msj")
        msj.textContent = "Debe iniciar sesión para poder comentar";
        contenedorComentar.appendChild(msj) */

        // Crear un nuevo elemento <p>
        var nuevoParrafo = document.createElement("p");
        nuevoParrafo.textContent = "Este es un nuevo párrafo.";

        // Obtener el elemento <div> al que deseas agregar el párrafo
        var contenedorDiv = document.getElementById("miDiv");

        // Agregar el nuevo párrafo al <div>
        contenedorDiv.appendChild(nuevoParrafo);
    })
       
    
    
})



