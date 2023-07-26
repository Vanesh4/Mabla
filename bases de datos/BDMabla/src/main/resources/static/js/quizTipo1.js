categoria = "sustantivos"
respuestasIncorrectas = ["vaca","tren","pajaro","hospital","foca","carro","colegio","bus","gato",]
$(document).ready (()=>{
    divsenia = document.getElementById("senia")
    numero = 3
    opcionResCorrecta = "opcion"+numero
    console.log(opcionResCorrecta)
    resCorrecta = document.getElementById(opcionResCorrecta)
    console.log(resCorrecta)
    $.ajax({
        url: "http://localhost:8080/preguntas/"+categoria,
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
                img = document.createElement("img")
                img.setAttribute("id","linkSenia")
                console.log(res[1][0]) //id de la pregunta
                /* img.setAttribute("src","linkSenia") */
            
        }
    })
     // con el id de la pregunta aleatoriamente crear un arreglo con las imagenes y respues
    function generarNumeroAleatorio(num) {
        /* return Math.floor(Math.random() * num) + 1; */
        return Math.floor(Math.random() * num)
    }
      
      // Ejemplo de uso
      numeroAleatorio = generarNumeroAleatorio(4);
      /* console.log(numeroAleatorio); */

    /*
    para avanzar a la misma pagina
    document.getElementById('avanza').addEventListener('click', function() {
        window.location.href = 'quizTipo1.html';
    })  */
})