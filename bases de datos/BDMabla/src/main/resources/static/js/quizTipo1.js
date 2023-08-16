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

categoria = "sustanivos"

function generarNumeroAleatorio(num) {
    /* return Math.floor(Math.random() * num) + 1; */
    return Math.floor(Math.random() * num)
}

respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","chaqueta","nutria","vestido","fresas"]
console.log(respuestasIncorrectas.length)
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
            //establecer datos
            $.ajax({
                url: "http://localhost:8080/preguntas/"+categoria+"/"+1,
                type: "GET",
                dataType: "JSON",
                success: function (res) {
                    console.log(res)
                    
                    p = generarNumeroAleatorio(res.length) // validar 5 veces diferentes preguntas
                    //¿no hay una manera de ocultar algun dato traido de la bd?
                    document.getElementById('linkSenia').src = res[p][1]
        
                    for (let i = 0; i < 4; i++) {
                        pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                        document.getElementById("opcion"+i).innerHTML= respuestasIncorrectas[pos]
                        //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                        respuestasIncorrectas.splice(pos, 1);
                    }
                    resCorrecta.innerHTML = res[p][2]
                    
                    
                }
            })
        }
    }

    function validarRespuesta(opcionElegida) {
        if (opcionElegida==resCorrecta.id) {
            r=document.getElementById(resCorrecta)
            r.style.boxShadow = "0px 0px 20px green";
            totalRespuestasAcertadas++
        }
        else{
            r=document.getElementById(opcionElegida)
            r.style.boxShadow = "0px 0px 20px red";
        }
        posicionActual++
        setTimeout(cargarPregunta,1000);
    }

    function terminarQuiz() {
        $("#espacioQuiz").style.display = "none";
        console.log("Cantidad de respuestas acertadas c:")
        console.log(totalRespuestasAcertadas)
    }
})


