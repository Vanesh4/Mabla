
let hider_btn=document.getElementById('hider_btn');

let hide_abc=document.getElementById('hide_abc');

hider_btn.addEventListener('click', toggleText);

function toggleText(){
    hide_abc.classList.toggle('show');
    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='r';
        
    }else{
        hideText_btn.innerHTML='y';
    }


}


/* function consultar(){
    console.log("holaaaaaa")

    fetch("http://127.0.0.1:8000/getpalabra",{
        method:"GET",
        headers:{
            "consultar-type":"Tablas/json"
        }
        
    })
    console.log("holaaaaaa")

    .then(response=>response.json())
    .then(datos=>{
        console.log("entra o nooooooo")
        console.log(datos)
        let tabla=document.getElementById("listadopalabras");
        tabla.innerHTML=""; // mostrar los datos en el html
        if(datos==0){
            console.log("hacia el fooooorr")
            tabla.innerHTML+=`<tr><td>NO hay Datos</td></tr>`
        }else{
            console.log("hacia el fooooorr")
            for(let dat of datos){
                tabla.innerHTML+=`
                <tr>
                <td>${dat.Palabra}</td>
                <td>${dat.subcategoria}</td>
                </tr>
                `
            }
        }
    })
} */


$(document).ready(function() {
    $('#buscador').on('submit', function(event) {
        event.preventDefault();
        var inicial = $('#inicial').val();
        $.ajax({
            url: 'http://127.0.0.1:8000/getpalabrasdiccio/'+inicial,
            data: {inicial: inicial},
            dataType: 'json',
            success: function(data) {
                console.log("ver lo que hay en data",data)
                var resultsDiv = $('#results');
               

                resultsDiv.empty();
                var palabras = data.palabras;
                palabras.forEach(function(palabra) {

                    grupopalabra=document.createElement('div')
                    grupopalabra.setAttribute('class','grouppal')

                    img=document.createElement('img')
                    img.setAttribute('class','imgpal')
                    img.src=palabra.senia
                    /* img.src='Tablas/static/img/capiLogin.png' */

                    p=document.createElement('p')
                    p.setAttribute('class','p')
                    p.innerHTML=palabra.palabra

                    

                    grupopalabra.append(img)
                    grupopalabra.append(p)
                    resultsDiv.append(grupopalabra)
                });
                
            }
        });
    });
});





const enlaces = document.querySelectorAll('#enlace');
const inputMostrarContenido = document.getElementById('inicial');
const contenidoMostrado = document.getElementById('results');
enlaces.forEach(enlace => {
  enlace.addEventListener('click', function(event) {
    console.log("palabra quicleadad",enlace)
    event.preventDefault(); 
    const valor = enlace.getAttribute('data-valor');
 
    inputMostrarContenido.value = valor;
    contenidoMostrado.textContent = obtenerContenidoDeBaseDeDatos(valor);
  });
});
function obtenerContenidoDeBaseDeDatos(valor) {
    $.ajax({
        url: 'http://127.0.0.1:8000/getpalabrasdiccio/'+valor,
        data: {valor: valor},
        dataType: 'json',
        success: function(data) {
            console.log("ver lo que hay en data",data)
            var resultsDiv = $('#results');
            resultsDiv.empty();
            var palabras = data.palabras;
            console.log("queria mirar lo que se guarda aqui",palabras)
            palabras.forEach(function(palabra) {

                grupopalabra=document.createElement('div')
                grupopalabra.setAttribute('class','grouppal')

                img=document.createElement('img')
                img.getAttribute('class','imgpal')
                img.src=palabra.senia

                p=document.createElement('p')
                p.setAttribute('class','p')
                p.innerHTML=palabra.palabra

                grupopalabra.append(img)
                grupopalabra.append(p)
                resultsDiv.append(grupopalabra)
            });
            
        }
    });
  }


  $(document).ready(function() {
    var word = document.getElementById('container');
    console.log("hola mi gente")
   
    $('#inicial').on('input', function() {
      var inicial = $(this).val().toLowerCase(); // Obtenemos la inicial ingresada y la convertimos a minúsculas
      var wordList = $('#wordList'); // Elemento donde mostraremos la lista de palabras
      $.ajax({
        url: 'http://127.0.0.1:8000/getpalabrasdiccio/'+inicial, 
        method: 'GET',
        data: { inicial: inicial }, // Enviamos la inicial como parámetro
        success: function(data) {
          var resultsDiv = $('#results');
          resultsDiv.empty();
          wordList.empty(); // Vaciamos la lista actual de palabras
          var palabras = data.palabras;
  
          // se va agregando cada palabra recibida a la lista
          palabras.forEach(function(Palabra) {
            console.log("vinedo las palbras recorridads en el foreach",palabras)
            var listItem = $('<p>').text(Palabra.palabra).addClass('miClase');
            console.log("lo que hay en listem ",listItem)

            listItem.click(function() {
              $('.miClase').val(Palabra);
              // Aquí podrías hacer algo con el contenido de la palabra seleccionada
                grupopalabra=document.createElement('div')
                grupopalabra.setAttribute('class','grouppal')

                img=document.createElement('img')
                img.getAttribute('class','imgpal')
                img.src=Palabra.senia

                p=document.createElement('p')
                p.setAttribute('class','p')
                p.innerHTML=Palabra.palabra

                grupopalabra.append(img)
                grupopalabra.append(p)
                resultsDiv.append(grupopalabra)
          });
         
           
            listItem.css({
              'font-family':'raleway',             
              'color': 'white',
              'fontSize': '18px',
              'padding': '12px',
              
            
                
              });
            wordList.append(listItem);
            word.style.backgroundColor='#00000092';
            word.style.width='21%';
            word.style.padding='15px';
            word.style.borderRadius='10px',
            

            console.log("como me trae las palabras",listItem)



                  
          });
        },
        error: function(err) {
          console.error('Error al obtener las palabras:', err);
        }
      });
    });
  });
  
  
  
  
  
  