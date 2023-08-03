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

respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","moto","colegio","bus","gato","camiseta","falda","medias","pera","banano","zapatos"]
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
            /* console.log(res[1][0]) */ //id de la pregunta
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

})