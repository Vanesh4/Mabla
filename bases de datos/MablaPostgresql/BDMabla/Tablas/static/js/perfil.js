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

// Almacena el último grupo de notas mostrado
var ultimoGrupoNotas = null;

// Agrega un controlador de evento clic al contenedor
contenedorCajas.addEventListener("click", function(event) {
  var target = event.target;

  // Verifica si el elemento clickeado es un enlace con la clase "mas"
  if (target.classList.contains("mas")) {
    event.preventDefault(); // Previene el comportamiento predeterminado del enlace

    var targetId = target.getAttribute("data-target"); // Obtiene el atributo data-target
    var contenido = target.closest("#cdos").querySelector("#" + targetId); // Encuentra el contenido correspondiente

    if (contenido) {
      // Oculta el último grupo de notas mostrado
      if (ultimoGrupoNotas) {
        ultimoGrupoNotas.style.display = "none";
      }

      // Muestra el nuevo grupo de notas
      contenido.style.display = "flex"; // Mostrar el contenido como flexbox

      // Actualiza la variable ultimoGrupoNotas
      ultimoGrupoNotas = contenido;
    }
  }
})



function actualizarNotas() {
  const url = 'http://127.0.0.1:8000/tablaPrueba';
  fetch(url)
      .then(response => response.json())
      .then(data => {
          var notasContainer = document.getElementById("notasContainer");
          notasContainer.innerHTML = ""; // Limpia las notas existentes

          // Itera sobre los datos y crea elementos para mostrar las notas
          data.forEach(function (dato) {
              var cajita = document.createElement("div");
              cajita.setAttribute("class", "cajita");
              cajita.innerHTML = "<h3 id='nota'>" + dato.puntaje + "/5</h3>";

              notasContainer.appendChild(cajita);
          });
      })
      .catch(error => {
          console.error("Error al obtener datos de pruebas:", error);
      });
}

// Llama a la función para actualizar las notas cuando se carga la página
actualizarNotas();




