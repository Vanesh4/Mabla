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

categoria = "verbos"

function generarNumeroAleatorio(num) {
    /* return Math.floor(Math.random() * num) + 1; */
    return Math.floor(Math.random() * num)
}

respuestasIncorrectas = ["https://cdn.pixabay.com/photo/2023/08/08/18/01/butterfly-8177925_1280.jpg","https://cdn.pixabay.com/photo/2023/07/17/17/05/lizard-8133108_1280.jpg","https://cdn.pixabay.com/photo/2023/08/25/18/40/scales-8213484_1280.jpg","https://cdn.pixabay.com/photo/2023/07/20/05/32/grass-8138399_1280.jpg","https://cdn.pixabay.com/photo/2023/08/08/22/11/moon-8178208_1280.jpg",
"https://cdn.pixabay.com/photo/2023/06/01/08/18/money-8033100_1280.jpg","https://cdn.pixabay.com/photo/2015/04/23/22/01/tree-736888_1280.jpg","https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_1280.jpg","https://cdn.pixabay.com/photo/2017/11/29/09/15/paint-2985569_1280.jpg","https://cdn.pixabay.com/photo/2016/04/18/22/05/seashells-1337565_1280.jpg",
"https://cdn.pixabay.com/photo/2015/02/02/11/09/office-620822_1280.jpg","https://cdn.pixabay.com/photo/2016/11/29/04/19/ocean-1867285_1280.jpg","https://cdn.pixabay.com/photo/2014/07/30/02/00/iceberg-404966_1280.jpg","https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_1280.jpg","https://cdn.pixabay.com/photo/2017/03/01/05/12/tea-cup-2107599_1280.jpg",
"https://cdn.pixabay.com/photo/2022/12/16/18/06/ice-7660302_1280.jpg","https://cdn.pixabay.com/photo/2023/08/19/15/39/breakfast-8200753_1280.jpg","https://cdn.pixabay.com/photo/2023/08/15/06/31/bird-8191339_1280.jpg","https://cdn.pixabay.com/photo/2020/11/04/07/52/pumpkin-5711688_1280.jpg","",]

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
                url: "http://localhost:8080/preguntas/"+categoria+"/"+2,
                type: "GET",
                dataType: "JSON",
                success: function (res) {
                    console.log(res)
                    
                    p = generarNumeroAleatorio(res.length) // validar 5 veces diferentes preguntas
                    //¿no hay una manera de ocultar algun dato traido de la bd?
                    
                    document.getElementById("palabra").innerHTML= res[p][1]
        
                    for (let i = 0; i < 4; i++) {
                        pos=generarNumeroAleatorio(respuestasIncorrectas.length)
                        document.getElementById("opcion"+i).src = respuestasIncorrectas[pos]
                        //console.log(document.getElementById("opcion"+i))
                        //validar que dos veces no me genere el mismo aleatorio. Eliminar de la lista
                        respuestasIncorrectas.splice(pos, 1);
                    }
                    resCorrecta.src = res[p][2]
                    
                    
                }
            }) //ajax correcto
            
        }
    }

    function limpiarOpciones(){

        for (let i = 0; i < 4; i++) {
            d = document.getElementById("conte"+i)
            if (d.classList.contains("opcionCorrecta")) {
                d.classList.remove("opcionCorrecta");
                $("#conte"+i).addClass("opcion"+i)
            }
            else if(d.classList.contains("opcionIncorrecta")){
                d.classList.remove("opcionIncorrecta");
                $("#conte"+i).addClass("opcion"+i)
            }
        }

        console.log("clases de las opciones c:")
        console.log($("#conte0").attr("class"))
        console.log($("#conte1").attr("class"))
        console.log($("#conte2").attr("class"))
        console.log($("#conte3").attr("class"))

    }
    
    $(".opcion").click(function() {
        botonID = $(this).attr("id");
        validarRespuesta(botonID)
    });
    function validarRespuesta(opcionElegida) {
    
        if (opcionElegida==resCorrecta.id) {
            for (let i = 0; i < 4; i++) {
                ress =  "conte"+i
                if (ress==resCorrecta.id) {
                    
                    r=document.getElementById(ress).className = "opcion opcionCorrecta"
                    
                }else{
                    
                    p=document.getElementById(ress).className = "opcion opcionIncorrecta"
                    
                }
            }
            totalRespuestasAcertadas++
        }
        else{
            
            for (let i = 0; i < 4; i++) {
                ress =  "conte"+i
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