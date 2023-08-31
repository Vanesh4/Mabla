$(document).ready(function () {

contenedor = document.querySelector("#list")
const contenidoMostrado = document.getElementById('resultado');

    
$.ajax({
    url: "http://localhost:8080/getCategorias",
    type: "GET",
    dataType: "JSON",      
    success: function (res) { 
        console.log("categorias",res) 

        for(let x = 0; x<=res.length; x++) {
            console.log("el res for primero",res)
 
            //console.log("hollaaaaaa",res[x])
            contenedorli=document.createElement("li")
            contenedorli.setAttribute("class","list_item list_item--click")

            divcategoria=document.createElement("div")
            divcategoria.setAttribute("class","list_button list_button--click")
            //console.log("creacion del div",divcategoria)

            imgdesplegar=document.createElement("img")  
            imgdesplegar.setAttribute("class","list_arrow")
            imgdesplegar.setAttribute("src", "/img/flecha-apunta-a-la-derecha.png")

            h1categoria = document.createElement("h1")    
            h1categoria.setAttribute("class","categorias")
            h1categoria.innerHTML = res[x].categoria
            //console.log("si se esta escribiendo la categoria", h1categoria)          
            divcategoria.appendChild(h1categoria)
            divcategoria.appendChild(imgdesplegar)
            contenedorli.appendChild(divcategoria)
            contenedor.appendChild(contenedorli)
          
           
           

            //console.log("los datos",contenedorli)

            
            contenedorsub=document.createElement("ul")
            contenedorsub.setAttribute("class", "list_show")
            subdecategorias=res[x].tablaSubcategorias
            console.log("hola quiero observer",subdecategorias)
            for(let s=0; s<subdecategorias.length; s++){       
                console.log("subcategorias ijuemadre en s",subdecategorias)
                
                li = document.createElement("li")
                li.setAttribute("class","list_inside")    

                a=document.createElement("a")
                a.setAttribute("class","nav_link nav_link--inside")
                a.innerHTML=subdecategorias[s].subcategoria
                //console.log(subdecategorias[s].subcategoria)

                console.log("que hay en a",a)
                
                li.appendChild(a)
                contenedorsub.appendChild(li)
                contenedorli.appendChild(contenedorsub)

                paldesubcate=subdecategorias[s].palabraas
                console.log("palabras en subcate",paldesubcate)
                

                    console.log("siiiiiiiiiiiiiiiiiiiiiiiii?")
                    enlaces = document.querySelectorAll('.nav_link--inside');
                    console.log("capturando etiquetas a ")           
                    console.log("enlaces",enlaces)
                    enlaces.forEach(enlace => {
                    console.log("entra al foreach con enlace",enlaces)    
                    enlace.addEventListener('click', function(event) {
                        
                        //console.log("palabra quicleadad",enlace)
                        event.preventDefault();
                        //const valor = enlace.getAttribute('data-valor'); 
                        valor = enlace.textContent;
                        console.log("mirando valor",valor)
                        contenidoMostrado.textContent = ContenidoDeBaseDeDatos(valor);
                        console.log("que hay en el contenedor ",ContenidoDeBaseDeDatos)
                
                    function ContenidoDeBaseDeDatos(valor) {
                        $.ajax({
                            url: 'http://localhost:8080/listandopalabras/'+valor,
                            data: {valor: valor},
                            dataType: 'json',
                            success: function(data) {
                                console.log("valoooooooooor"+valor)
                                console.log("ver lo que hay en data palabras",data)
                                var resultsDiv = $('#resultado');
                                
                                
                                resultsDiv.empty();                      
                                var palabras = data;
                                console.log("queria mirar lo que se guarda aqui",palabras)
                                palabras.forEach(function(palabra) {
                    
                                    grupopalabra=document.createElement('div')
                                    grupopalabra.setAttribute('class','grouppal')
                    
                                    img=document.createElement('img')
                                    img.setAttribute('class','imgpal')
                                    img.src=palabra.Senia
                    
                                    p=document.createElement('p')
                                    p.setAttribute('class','ppal')
                                    p.innerHTML=palabra

                                    
                                                     
                                    grupopalabra.append(img)
                                    grupopalabra.append(p)
                                    contenidoMostrado.append(grupopalabra)
                                    resultsDiv.append(grupopalabra)

                                    console.log("muaaaaaaaaaaaaaaaaaaaaaaaaaa")

                                    document.addEventListener("DOMContentLoaded",function(){
                                        var btn=document.getElementById("botonQuiz");
                                        var h1categoria=document.getElementsByClassName("categorias");
                                        btn.addEventListener("click",function(){
                                            
                                            var contenido=h1categoria.textContent
                                            btn.textContent=contenido

                                            console.log("eiiiiiiiiiiiiiiiiiiii",btn)
                                            $('.boton').css("display","block")
                                        })
                                    })

                                   /*  $("#botonQuiz").val(res[x].Categoria)
                                    console.log("boooooooooooo",$("#botonQuiz").val(res[x].Categoria))
                                     */
                                    


                                  
                                    
                                });

                                
                                
                            }
                            
                         
                    
                            });
                            
                    }
                   
                    

                   
                });
            });
           
            
            } 
          
          

            
            contenedor.appendChild(contenedorli)

            let listElements=document.querySelectorAll('.list_button--click');

            //console.log("viendo js desplegable")
            //console.log(listElements)

            listElements.forEach(listElement=>{
                console.log("holaaa si entra a foreach")
                listElement.addEventListener('click',()=>{
                   
                    console.log("dando click en la fecha")
                    listElement.classList.toggle('.arrow');
                    let height=0;
                    let menu=listElement.nextElementSibling;
                    if(menu.clientHeight=="0"){
                        height=menu.scrollHeight
                        
                                                          
                    }
                    menu.style.height =`${height}px`;

                   

                })
                
            });
            
        
           
                   
        }

       
       

        

        
    }

    
})


})