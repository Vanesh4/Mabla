$(document).ready(function () {

contenedor = document.querySelector("#list")
const contenidoMostrado = document.getElementById('resultado');
boton=document.getElementById('botonQuiz')

    
$.ajax({
    url: "http://127.0.0.1:8000/getcategoria",
    type: "GET",
    dataType: "JSON",      
    success: function (res) { 
      
        for(let x = 0; x<=res.length; x++) {
<<<<<<< HEAD
=======
            //console.log("el res for primero",res)
 
            //console.log("hollaaaaaa",res[x])
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
            contenedorli=document.createElement("li")
            contenedorli.setAttribute("class","list_item list_item--click")

            divcategoria=document.createElement("div")
            divcategoria.setAttribute("class","list_button list_button--click")

            imgdesplegar=document.createElement("img")  
            imgdesplegar.setAttribute("class","list_arrow")
            imgdesplegar.setAttribute("src", "/static/img/flecha-apunta-a-la-derecha.png")

            h1categoria = document.createElement("h1")    
            h1categoria.setAttribute("class","categorias")
            h1categoria.innerHTML = res[x].Categoria
    
            divcategoria.appendChild(h1categoria)
            divcategoria.appendChild(imgdesplegar)
            contenedorli.appendChild(divcategoria)
            contenedor.appendChild(contenedorli)
                   
            contenedorsub=document.createElement("ul")
            contenedorsub.setAttribute("class", "list_show")
            subdecategorias=res[x].Subcategorias
            //console.log("hola quiero observer",subdecategorias)
            for(let s=0; s<subdecategorias.length; s++){       
<<<<<<< HEAD
=======
                //console.log("subcategorias ijuemadre en s",subdecategorias)
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                
                li = document.createElement("li")
                li.setAttribute("class","list_inside")    

                a=document.createElement("a")
                a.setAttribute("class","nav_link nav_link--inside")
                a.innerHTML=subdecategorias[s].subcategoria
<<<<<<< HEAD
               
=======
                //console.log(subdecategorias[s].subcategoria)

                //console.log("que hay en a",a)
                
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                li.appendChild(a)
                contenedorsub.appendChild(li)
                contenedorli.appendChild(contenedorsub)

                paldesubcate=subdecategorias[s].palabraas
                //console.log("palabras en subcate",paldesubcate)
                
<<<<<<< HEAD
                    console.log("siiiiiiiiiiiiiiiiiiiiiiiii?")
=======

                    //console.log("siiiiiiiiiiiiiiiiiiiiiiiii?")
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                    enlaces = document.querySelectorAll('.nav_link--inside');
                    //console.log("capturando etiquetas a ")           
                    //console.log("enlaces",enlaces)
                    enlaces.forEach(enlace => {
                    //console.log("entra al foreach con enlace",enlaces)    
                    enlace.addEventListener('click', function(event) {

                        event.preventDefault();
                        //const valor = enlace.getAttribute('data-valor'); 
                        valor = enlace.textContent;
                        //console.log("mirando valor",valor)
                        contenidoMostrado.textContent = ContenidoDeBaseDeDatos(valor);
<<<<<<< HEAD
=======
                        //console.log("que hay en el contenedor ",ContenidoDeBaseDeDatos)
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                
                    function ContenidoDeBaseDeDatos(valor) {
                        $.ajax({
                            url: 'http://127.0.0.1:8000/getpalabrassub/'+valor,
                            data: {valor: valor},
                            dataType: 'json',
                            success: function(data) {
<<<<<<< HEAD
=======
                                //console.log("valoooooooooor"+valor)
                                //console.log("ver lo que hay en data palabras",data)
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                                var resultsDiv = $('#resultado');
                                                          
                               resultsDiv.empty();                      
                                var palabras = data.palabras; 
<<<<<<< HEAD
=======
                                //console.log("queria mirar lo que se guarda aqui",palabras)
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                                palabras.forEach(function(palabra) {
                    
                                    grupopalabra=document.createElement('div')
                                    grupopalabra.setAttribute('class','grouppal')
                    
                                    img=document.createElement('img')
                                    img.setAttribute('class','imgpal')
                                    img.src=palabra.Senia
                    
                                    p=document.createElement('p')
                                    p.setAttribute('class','ppal')
                                    p.innerHTML=palabra.Palabra
                                                    
                                    grupopalabra.append(img)
                                    grupopalabra.append(p)
                                    contenidoMostrado.append(grupopalabra)
                                    resultsDiv.append(grupopalabra)
<<<<<<< HEAD

                                    //llamar el boton y mostrarlo
=======
  
                                    //console.log("boooooooooooo",$("#botonQuiz").val(res[x].Categoria))
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                                    $('.boton').css("display","block")
                                    
                                    
                                });
                               
                            }
<<<<<<< HEAD
                   
=======

                    
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                            });
                            
                    }
                                     
                });
            });
                      
            } 
<<<<<<< HEAD
          
           contenedor.appendChild(contenedorli)
=======

            contenedor.appendChild(contenedorli)
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e

            let listElements=document.querySelectorAll('.list_button--click');

            listElements.forEach(listElement=>{
                //console.log("holaaa si entra a foreach")
                listElement.addEventListener('click',()=>{
                   
                    //console.log("dando click en la fecha")
                    listElement.classList.toggle('.arrow');
                    let height=0;
                    let menu=listElement.nextElementSibling;
                    if(menu.clientHeight=="0"){
                        height=menu.scrollHeight
                        listElement.getElementsByClassName('categorias')
                        valo=listElement.innerText
                        //console.log("veeeeeeeeeer",valo)
                        boton.setAttribute("value", valo)
<<<<<<< HEAD
                                                         
=======
  
                                                          
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
                    }
                    menu.style.height =`${height}px`;

                })             
            });
<<<<<<< HEAD
                              
        }
        
    }   
})


=======
           
        }
    }
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e
})



<<<<<<< HEAD
=======
cat = document.getElementById("botonQuiz").value
localStorage.setItem('categoria', cat)

function generarNumeroAleatorio() {
    return Math.floor(Math.random() * 2) + 1;
}
console.log(generarNumeroAleatorio())

function llevar() {
    if (generarNumeroAleatorio()==1) {
        window.location.href = "http://127.0.0.1:8000/quizTipo1";
    }
    else if(generarNumeroAleatorio()==2){
        window.location.href = "http://127.0.0.1:8000/quizTipo2";
    }
}

$("#botonQuiz").click(function() {
    llevar()
})

})
>>>>>>> ecc2c2e6590e07a2eb9e60f691d8ea0b7357a36e


