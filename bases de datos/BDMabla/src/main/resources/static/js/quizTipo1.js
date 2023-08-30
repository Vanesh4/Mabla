/*
Boton html1:
cat = document.getElementById("butCat").value
localStorage.setItem('categoria', cat)
//aca tambien puedo guardar el tipo, aleatoriamente 1 o 2
function llevar() {
    window.location.href = "quiiz.html";
}


html2:
const valorRecibido = localStorage.getItem('categoria');
console.log(valorRecibido);

*/

categoria = "sustantivos"

function generarNumeroAleatorio(num) {
    /* return Math.floor(Math.random() * num) + 1; */
    return Math.floor(Math.random() * num)
}

respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","chaqueta","nutria","vestido","fresas"]
//console.log(respuestasIncorrectas.length)
/* 
$(document).ready (()=>{
    divsenia = document.getElementById("senia")
    opcionResCorrecta = "opcion"+generarNumeroAleatorio(4)
    //console.log(opcionResCorrecta)
    resCorrecta = document.getElementById(opcionResCorrecta)
    //console.log(resCorrecta)


    $.ajax({
        url: "http://localhost:8080/preguntas/"+categoria+"/"+1,
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            
            p = generarNumeroAleatorio(res.length) // validar 5 veces diferentes preguntas

            img = document.createElement("img")
            img.setAttribute("id","linkSenia")
            //console.log(res[1][0]) //id de la pregunta
            img.setAttribute("src", res[p][1]) // res[1] el segundo arreglo que trae de las respuestas (aleatorio con el res.length)
            divsenia.appendChild(img)

            for (let i = 0; i < 4; i++) {
                pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                document.getElementById("opcion"+i).innerHTML= respuestasIncorrectas[pos]
                //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                respuestasIncorrectas.splice(pos, 1);
            }
            resCorrecta.innerHTML = res[p][2]
            
            
        }
    })   
     

    conteo = 0
    //para avanzar a la misma pagina
    document.getElementById('avanza').addEventListener('click', function() {
        window.location.href = 'quizTipo1.html';
        conteo++
        localStorage.setItem('conteopag', conteo)
        
    }) 
    console.log(localStorage.getItem('conteopag'))

}) */


$(document).ready (()=>{
    posicionActual = 0
    totalRespuestasAcertadas = 0

    opcionResCorrecta = "opcion"+generarNumeroAleatorio(4)
    //console.log(opcionResCorrecta)
    resCorrecta = document.getElementById(opcionResCorrecta)
    //console.log("res",resCorrecta.id)

    
    cargarPregunta()

    function cargarPregunta() {
        if (posicionActual == 5){
            terminarQuiz()
        }
        else{
            limpiarOpciones()
            //establecer datos
            $.ajax({
                url: "http://localhost:8080/preguntas/"+categoria+"/"+1,
                type: "GET",
                dataType: "JSON",
                success: function (res) {
                    console.log(res)
                    
                    p = generarNumeroAleatorio(res.length) // validar 5 veces diferentes preguntas
                    //¿no hay una manera de ocultar algun dato traido de la bd?
                    document.getElementById('linkSenia').src = res[p][2]
        
                    for (let i = 0; i < 4; i++) {
                        pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                        document.getElementById("opcion"+i).innerHTML= respuestasIncorrectas[pos]
                        //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                        respuestasIncorrectas.splice(pos, 1);
                    }
                    resCorrecta.innerHTML = res[p][1]
                    
                    
                }
            }) //ajax correcto
            
        }
    }

    function limpiarOpciones(){
        /* $("#opcion0").addClass("opcion0")
        $("#opcion1").addClass("opcion1")
        $("#opcion2").addClass("opcion2")
        $("#opcion3").addClass("opcion3") */

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

        console.log("clases de las opciones c:")
        console.log($("#opcion0").attr("class"))
        console.log($("#opcion1").attr("class"))
        console.log($("#opcion2").attr("class"))
        console.log($("#opcion3").attr("class"))
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
        console.log("Cantidad de respuestas acertadas c:")
        console.log(totalRespuestasAcertadas)
        $("#resultado").css("display", "block")
    }
})


