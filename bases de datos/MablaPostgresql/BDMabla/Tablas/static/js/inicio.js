$(document).ready (()=>{

    //responsive
    $("#imgBotonAbrirMenu").on("click", ()=>{
        $(".header").css({
            "display": "inherit"});
        $("#imgBotonAbrirMenu").css({
            "display": "none"});
        $("body").css({
            "overflow": "hidden"});
        //console.log("helllou")
    })
    
    $("#imgBotonCerrarMenu").on("click", ()=>{
        $(".header").css({
            "display": "none"});
        $("body").css({
            "overflow": "visible"});
        $("#imgBotonAbrirMenu").css({
            "display": "inherit"});
        //console.log("helllou x2")
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

    textarea = document.getElementById("comentar");
    $("#btnComentario").on("click", ()=>{
        agregarComentario()
        textarea.value = "";
    })

    //linkeo a diccionario
    input = document.getElementById("inputADiccio");
    console.log(input)
    input.addEventListener("keydown", function(event) {
        console.log("entro a funcion")
        if (event.key === "Enter" && input.value != "") {
            localStorage.setItem('palabraABuscar', input.value)
            window.location.href = "/diccio";
        }
    });
})

//get Comentarios
commentsList = document.querySelector(".listComent")
    
function traerComentarios() {
    $.ajax({
        //url: "http://192.168.1.10/tablaComment",
        url: "http://127.0.0.1:8000/tablaComment",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)

            commentsList.innerHTML = ""
            for (let i = 0; i <=5 ; i++) {
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
}

function agregarComentario() {
    texto = document.getElementById("comentar").value
    //console.log(texto)
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
                contenedorDiv = document.getElementById("divmsj")
                contenedorDiv.innerHTML=""
                msj = document.createElement("p")
                msj.setAttribute("id","msj")
                msj.textContent = "No se pudo enviar el comentario "+error;
                contenedorDiv.appendChild(msj)
            }
        }); 
    }  
    
}