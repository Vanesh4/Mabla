$(document).ready(function () {

contenedor = document.querySelector("#list")
/* const navul=document.getElementsByClassName("nav")
navul.style.overflowY = "auto"; */
const contenidoMostrado = document.getElementById('resultado');
boton=document.getElementById('botonQuiz')
const cajalinks=document.getElementById('section1')
fleimg=document.getElementById('flechacaja')
var altocaja2=document.querySelector('.caja2')
console.log("oaaoaoaooaoaoa",altocaja2)




    
$.ajax({
    url: "http://127.0.0.1:8000/getcategoria",
    type: "GET",
    dataType: "JSON",      
    success: function (res) { 
      
        for(let x = 0; x<=res.length; x++) {
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
                
                li = document.createElement("li")
                li.setAttribute("class","list_inside")    

                a=document.createElement("a")
                a.setAttribute("class","nav_link nav_link--inside")
                a.innerHTML=subdecategorias[s].subcategoria
               
                li.appendChild(a)
                contenedorsub.appendChild(li)
                contenedorli.appendChild(contenedorsub)

                paldesubcate=subdecategorias[s].palabraas
                //console.log("palabras en subcate",paldesubcate)
                
                    console.log("siiiiiiiiiiiiiiiiiiiiiiiii?")
                    enlaces = document.querySelectorAll('.nav_link--inside');

                    //console.log("capturando etiquetas a ")           
                    //console.log("enlaces",enlaces)
                    enlaces.forEach(enlace => {
                    //console.log("entra al foreach con enlace",enlaces)    

                    enlace.addEventListener('click', function(event) {
                       
                        
                        cajalinks.classList.add('cajasindisplay')
                        fleimg.id= 'flechacajadis'
                        
                        

                     
                        event.preventDefault();
                        //const valor = enlace.getAttribute('data-valor'); 
                        valor = enlace.textContent;
                        //console.log("mirando valor",valor)
                        contenidoMostrado.textContent = ContenidoDeBaseDeDatos(valor);
                
                    function ContenidoDeBaseDeDatos(valor) {
                        $.ajax({
                            url: 'http://127.0.0.1:8000/getpalabrassub/'+valor,
                            data: {valor: valor},
                            dataType: 'json',
                            success: function(data) {
                                var resultsDiv = $('#resultado');
                                                          
                               resultsDiv.empty();                      
                                var palabras = data.palabras; 
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

                                    //llamar el boton y mostrarlo
                                    $('.boton').css("display","block")
                                    
                                    
                                    
                                });
                               
                            }
                   
                            });
                            
                    }
                                     
                });
               
            });
                      
            } 
          
           contenedor.appendChild(contenedorli)

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
                        

                        localStorage.setItem('categoria', valo)
                        numeroAleatorio = Math.round(Math.random()) + 1;
                        
                        function llevar() {
                            if (numeroAleatorio==1) {
                                window.location.href = "/quizTipo1";
                            }else{
                                window.location.href = "/quizTipo2";
                            }                            
                        }
                        
                        $('#botonQuiz').click(function() {
                            console.log("aaaaaaaaaaaaaaaa")
                            llevar()
                        });
                        
                                                          
                    }
                    menu.style.height =`${height}px`;

                })             
            });
                              
        }


        
    }   
})




fleimg.addEventListener('click', function() {
    
   
    
    console.log("que hay en caja 2",altocaja2)
    // Verifica el estado actual de visibilidad del contenido
    if (cajalinks.style.display === 'none' || cajalinks.style.display === '') {
      // Si está oculto, muéstralo
      
      cajalinks.style.display = 'block'
      altocaja2.classList.add('caja2alt')
      
      
    } else {
      // Si está visible, ocúltalo
      cajalinks.style.display = 'none';
    }


  });
  

})


