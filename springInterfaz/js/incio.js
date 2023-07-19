$(document).ready (()=>{
    
    header = document.getElementById("header")

    $("#imgBotonAbrirMenu").on("click", ()=>{      
        header.style.setProperty("display", "inherit")
    })

    $("#imgBotonCerrarMenu").on("click", ()=>{
        //console.log("porfavor")
        header.style.setProperty("display", "none")
    })


    commentsList = document.querySelector(".listComent")
    
    $.ajax({
        //url: "http://127.0.0.1:8000/tablaComment",
        url: "http://localhost:8080/commentAlias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            
            for (let i = 0; i < 4; i++) {
            
                comentario = document.createElement("div")
                comentario.setAttribute("id","comentario")

                usuario = document.createElement("p")
                usuario.setAttribute("id","user")
                usuario.innerHTML = res[i][0]

                texto = document.createElement("p")
                texto.setAttribute("id","coment")
                texto.innerHTML = res[i][1]

                comentario.appendChild(usuario)
                comentario.appendChild(texto)
                commentsList.appendChild(comentario)
            }
        }
    })

})



