
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
            palabras.forEach(function(palabra) {

                grupopalabra=document.createElement('div')
                grupopalabra.setAttribute('class','grouppal')

                img=document.createElement('img')
                img.setAttribute('class','imgpal')
                img.src=palabra.seni

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