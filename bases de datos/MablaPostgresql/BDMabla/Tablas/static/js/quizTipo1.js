/*
Boton html1:
cat = document.getElementById("butCat").value
localStorage.setItem('categoria', cat)
//aca tambien puedo guardar el tipo, aleatoriamente 1 o 2
function llevar() {
    window.location.href = "quiiz.html";
}
*/

history.pushState(null, null, location.href);
window.onpopstate = function () {
    history.go(1);
};

const valorRecibido = localStorage.getItem('categoria');
console.log(valorRecibido);

//categoria = "sustantivos"
categoria = valorRecibido
localStorage.clear();
function generarNumeroAleatorio(num) {
    return Math.floor(Math.random() * num)
}

respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","dos","nutria","vestido","fresas","papaya","periodista","rusia"]
$(document).ready (()=>{
    posicionActual = 0
    totalRespuestasAcertadas = 0
    
    cargarPregunta()

    function cargarPregunta() {
        if (posicionActual == 5){
            terminarQuiz()
        }
        else{
            limpiarOpciones()
            //establecer datos
            $.ajax({
                url: "http://127.0.0.1:8000/preguntas/"+1+"/"+categoria,
                //url: "http://192.168.1.10/preguntas/"+1+"/"+categoria,
                type: "GET",
                dataType: "JSON",
                success: function (res) {
                    console.log(res)
                    
                    p = generarNumeroAleatorio(res.length) // validar 5 veces diferentes preguntas
                    //¿no hay una manera de ocultar algun dato traido de la bd?
                    
                    opcionResCorrecta = "opcion"+generarNumeroAleatorio(4)
                    resCorrecta = document.getElementById(opcionResCorrecta)
                    document.getElementById('linkSenia').src=res[p].pregunta
                    //document.getElementById('linkSenia').setAttribute("src", res[p].respuesta)    
                    for (let i = 0; i < 4; i++) {
                        pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                        document.getElementById("opcion"+i).innerHTML= respuestasIncorrectas[pos]
                        //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                        respuestasIncorrectas.splice(pos, 1);
                    }
                    resCorrecta.innerHTML = res[p].respuesta
                    
                    
                }, error: function(error) {
                    window.location.href = "/error";
                } 
            }) //ajax correcto
            
        }
    }

    function limpiarOpciones(){
        for (let i = 0; i < 4; i++) {
            d = document.getElementById("opcion"+i)
            if (d.classList.contains("opcionCorrecta")) {
                d.classList.remove("opcionCorrecta");
                $("#opcion"+i).addClass("opcion"+i)
            }
            else if(d.classList.contains("opcionIncorrecta")){
                d.classList.remove("opcionIncorrecta");
                $("#opcion"+i).addClass("opcion"+i)
            }
        }

    }
    
    $(".opcion").click(function() {
        botonID = $(this).attr("id");
        console.log(botonID)
        
    });
    function validarRespuesta(opcionElegida) {
        //console.log("holaaaaaaaaa?")
        if (opcionElegida==resCorrecta.id) {
            for (let i = 0; i < 4; i++) {
                ress =  "opcion"+i
                if (ress==resCorrecta.id) {
                    //r=document.getElementById(ress).setAttribute("class","opcionCorrecta")
                    r=document.getElementById(ress).className = "opcion opcionCorrecta"
                    //r.style.background = "green"
                }else{
                    //p=document.getElementById(ress).setAttribute("class","opcionIncorrecta")
                    p=document.getElementById(ress).className = "opcion opcionIncorrecta"
                    /* p.style.color = "red"
                    p.style.background = "red" */
                }
            }
            totalRespuestasAcertadas++
        }
        else{
            for (let i = 0; i < 4; i++) {
                ress =  "opcion"+i
                document.getElementById(ress).className = "opcion opcionIncorrecta"
            }
            document.getElementById(opcionResCorrecta).className = "opcion opcionCorrecta"
        }
        posicionActual++


        setTimeout(cargarPregunta,1500);
    }

    function terminarQuiz() {
        $("#sectionPregunta").css("display", "none")
        /* console.log("Cantidad de respuestas acertadas c:")
        console.log(totalRespuestasAcertadas) */
        $("#resultado").css("visibility", "inherit")
        $("#calificacion").text(totalRespuestasAcertadas+"/5")
        
        postResulatdo()
    }
})

//post RESULTADO
function postResulatdo(){
    
const url = 'http://127.0.0.1:8000/insertPrueba';

alias = document.getElementById("alias").textContent
const data = {
    "alias_id": alias,
    "tipoPrueba": 1,
    "idCategoria_id": categoria,
    "puntaje": totalRespuestasAcertadas
};

// Opciones de configuración de la petición
const options = {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json' 
    },
    body: JSON.stringify(data) 
};

fetch(url, options)
    .then(response => {
        if (!response.ok) {
            console.log("paila")
            throw new Error('La petición no fue exitosa');
        }
        return response.json(); // Puedes usar .text() si la respuesta no es JSON
    })
    .then(data => {
        // Maneja la respuesta exitosa aquí
        console.log('Respuesta exitosa:', data);
    })
    .catch(error => {
        // Maneja errores de la petición aquí
        console.log('Error:', error);
    });

}
