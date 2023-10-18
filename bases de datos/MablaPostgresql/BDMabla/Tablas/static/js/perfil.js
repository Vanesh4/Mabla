/* let btn=document.getElementById('btn');

let spant=document.getElementById('spant');

btn.addEventListener('click', toggleText);

function toggleText(){
    spant.classList.toggle('sohw');

    if(spant.classList.contains('sohw')){
        btn.innerHTML='Revisando';
        
    }else{
        btn.innerHTML='Mi progreso';
    }
} */

function previewImage(input) {
    var imgPreview = document.getElementById('fotouser');
    
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            imgPreview.src = e.target.result;
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        imgPreview.src = "{{ user.imgPerfil.url }}";  // Mostrar la imagen actual si no se selecciona un archivo
    }
}

$("#imgPreview").on('click', ()=> {
    previewImage()
})

let clicks=document.getElementById('clicks');

let spant=document.getElementById('spant');

clicks.addEventListener('click', toggleText);

function toggleText(){
    spant.classList.toggle('show');
    console.log("entra a la funcion toggletext",spant)
    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='revisando';
        
    }else{
        hideText_btn.innerHTML='mi progreso';
    }
} 




/* var contenedorCajas = document.getElementById("vertodo");

contenedorCajas.addEventListener("click", function(event) {
  var target = event.target;

  if (target.classList.contains("mas")) {
    event.preventDefault(); // Previene el comportamiento predeterminado del enlace
    var targetId = target.getAttribute("data-target"); // Obtiene el atributo data-target
    var contenido = target.closest("#cdos").querySelector("#" + targetId); // Encuentra el contenido correspondiente

    if (contenido) {
      // Cambia la visibilidad del contenido
      if (contenido.style.display === "none" || contenido.style.display === "") {
        contenido.style.display = "block";
  
        
      } else {
        contenido.style.display = "none";
      }
    }
  }
})
 */

var contenedorCajas = document.getElementById("vertodo");

var ultimoGrupoNotas = null;

contenedorCajas.addEventListener("click", function(event) {
  var target = event.target;

  
  if (target.classList.contains("mas")) {
    event.preventDefault();

    var targetId = target.getAttribute("data-target"); 
    var contenido = target.closest("#cdos").querySelector("#" + targetId); 

    if (contenido) {

      if (ultimoGrupoNotas) {
        ultimoGrupoNotas.style.display = "none";
      } 
      contenido.style.display = "flex"; 
      ultimoGrupoNotas = contenido;
    }
  }
})



$(document).ready(function () {
  hiderspan=document.getElementById("spant")
  divtodo = document.querySelector("#result")
  contenidocaja = document.getElementById('vertodo');
  contenedorprueba=document.getElementById('cdos')
 
  span=document.getElementById("todasN")

/* 
  $.ajax({
    url: "http://127.0.0.1:8000/tablaPrueba",
    type: "GET",
    dataType: "JSON",      
    success: function (res) { 
        console.log(res)

        for(let x = 0; x<=res.length; x++) {

          divcajon=document.createElement("div")
          divcajon.id="#cajon"

          divinput=document.createElement("div")
          divinput.setAttribute("class","elinp")

          input=document.createElement("input")
          input.id="#place"
          input.innerHTML=res[x].idCategoria_id
          console.log("el input",input)

          divnotas=document.createElement("div")
          divnotas.setAttribute("class","notas-container")

          divnot=document.createElement("div")
          divnot.id="#cajita"

          h3=document.createElement("h3")
          h3.id="#nota"
          h3.innerHTML=res[x].puntaje
          console.log("puntajeeeeeeeeeeee",h3)


          hiderspan.appendChild(divtodo)
          divtodo.appendChild(contenidocaja)
          contenidocaja.appendChild(contenedorprueba)
          contenedorprueba.appendChild(divcajon)
          divcajon.appendChild(divinput)
          a=document.getElementsByClassName('mas')
          divcajon.appendChild(a)
          divinput.appendChild(input)
          contenedorprueba.appendChild(span)
          span.appendChild(divnotas)
          divnotas.appendChild(divnot)
          divnot.appendChild(h3)


        }

    }

    }) */

    $(".mas").click(function() {
      botonID = $(this).attr("id");
      console.log(botonID)
      $.ajax({
        url: "/puntaje/"+botonID,
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            //console.log(res)     
            contenedorMAdre = document.getElementById("todasN")
           /*  if(res.length == 0){
              divVAcio = document.createElement("div")
              divVAcio.innerHTML = "Presenta una prueba para ver resultados";
              contenedorMAdre.appendChild(divVAcio)
            }else{ */
              contenedorMAdre = document.getElementById("todasN")
            divNotasConiner = document.createElement("div")
            divNotasConiner.setAttribute("class","notas-container")

            for (let i = 0; i < 5; i++) {
              divnot=document.createElement("div")
              divnot.setAttribute("class","cajita")
              divnot.innerHTML = res[i].puntaje + "/5"
              divNotasConiner.appendChild(divnot)
            }
            contenedorMAdre.appendChild(divNotasConiner)
           /*  } */
            
        }, error: function(error) {
            window.location.href = "/error";
        } 
    })
  });
})