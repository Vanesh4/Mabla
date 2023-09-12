$(document).ready (()=>{

    header = document.getElementById("header")

    $("#imgBotonAbrirMenu").on("click", ()=>{      
        header.style.setProperty("display", "inherit")
    })

    $("#imgBotonCerrarMenu").on("click", ()=>{
        //console.log("porfavor")
        header.style.setProperty("display", "none")
    })

    traerComentarios()

    //enviar comentarios
    $("#miDiv").on("click", ()=>{
        contenedorDiv = document.getElementById("divmsj")
        contenedorDiv.innerHTML=""
        msj = document.createElement("p")
        msj.setAttribute("id","msj")
        msj.textContent = "Debe iniciar sesión para poder comentar";
        
        contenedorDiv.appendChild(msj)
        
    })

    $("#btnComentario").on("click", ()=>{
        agregarComentario()
    })
})

//get Comentarios
commentsList = document.querySelector(".listComent")
    
function traerComentarios() {
    $.ajax({
        //url: "http://192.168.1.10/tablaComment",
        url: "http://127.0.0.1:8000/tablaComment",
        //url: "http://localhost:8080/users",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)

            commentsList.innerHTML = ""
            
            i = res.length-1
            h = i-5
            while (i > h) {
                if (i == 0) {
                    break;
                }
                else{
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
                i--
            }
            
        }
    })
}

function agregarComentario() {
    //si el texto esta vacio no poder comentar. Mostar mensaje de error. Solo mostar 5 comentarios del ultimo al primero
    texto = document.getElementById("comentar").value
    console.log(texto)
    alias = document.getElementById("alias").textContent
    //console.log(alias)
    if (texto === "" || texto === " ") {
        contenedorDiv = document.getElementById("divmsj")
        contenedorDiv.innerHTML=""
        msj = document.createElement("p")
        msj.setAttribute("id","msj")
        msj.textContent = "No se pudo enviar el comentario";
        contenedorDiv.appendChild(msj)
    }
    else{
        comentario = {
            "alias_id": alias,
            "texto": texto
        }
        jsonData = JSON.stringify(comentario)
        $.ajax({
            url: 'http://127.0.0.1:8000/postComment',
            type: 'POST',
            dataType: 'json', 
            data: jsonData,
            success: function(response) {
                console.log(response)
                texto.value  = ""
                traerComentarios()
                
            },
            error: function(error) {
                console.error(error);
            }
        }); 
    }   
}