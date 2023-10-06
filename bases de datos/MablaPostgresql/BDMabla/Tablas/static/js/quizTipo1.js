/*
Boton html1:
cat = document.getElementById("butCat").value
localStorage.setItem('categoria', cat)
//aca tambien puedo guardar el tipo, aleatoriamente 1 o 2
function llevar() {
    window.location.href = "quiiz.html";
}




*/
const valorRecibido = localStorage.getItem('categoria');
console.log(valorRecibido);
categoria = "Sustantivos"
console.log("hola?")

function generarNumeroAleatorio(num) {
    return Math.floor(Math.random() * num)
}

respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","chaqueta","nutria","vestido","fresas","papaya","periodista"]
$(document).ready (()=>{
    posicionActual = 0
    totalRespuestasAcertadas = 0

    opcionResCorrecta = "opcion"+generarNumeroAleatorio(4)
    resCorrecta = document.getElementById(opcionResCorrecta)
    
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
                    
                    document.getElementById('linkSenia').src=res[p].pregunta
                    //document.getElementById('linkSenia').setAttribute("src", res[p].respuesta)    
                    for (let i = 0; i < 4; i++) {
                        pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                        document.getElementById("opcion"+i).innerHTML= respuestasIncorrectas[pos]
                        //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                        respuestasIncorrectas.splice(pos, 1);
                    }
                    resCorrecta.innerHTML = res[p].respuesta
                    
                    
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
        validarRespuesta(botonID)
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
            
            //r.style.boxShadow = "0px 0px 20px red";
            /* for (let i = 0; i < 4; i++) {
                p=document.getElementById("opcion"+i)
                p.style.color = "red"
                p.style.background = "red"
            }
            document.getElementById(opcionElegida).style.color = "black" 
            
            c=document.getElementById(opcionResCorrecta)
            //console.log(c)
            c.style.background = "green"
            c.style.color = "black" */
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
        'Content-Type': 'application/json' // Especifica el tipo de contenido como JSON
    },
    body: JSON.stringify(data) // Convierte los datos a formato JSON
};

// Realiza la petición POST utilizando fetch
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
