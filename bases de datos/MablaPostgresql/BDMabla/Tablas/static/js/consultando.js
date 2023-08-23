$(document).ready(function () {

contenedor = document.querySelector("#list")
const contenidoMostrado = document.getElementById('resultado');
    
$.ajax({
    url: "http://127.0.0.1:8000/getcate",
    type: "GET",
    dataType: "JSON",      
    success: function (res) { 
        console.log("categorias",res)   
        
        
        for(let x = 0; x<=res.length; x++) {
 
            //console.log("hollaaaaaa",res[x])
            contenedorli=document.createElement("li")
            contenedorli.setAttribute("class","list_item list_item--click")

            divcategoria=document.createElement("div")
            divcategoria.setAttribute("class","list_button list_button--click")
            //console.log("creacion del div",divcategoria)

            imgdesplegar=document.createElement("img")  
            imgdesplegar.setAttribute("class","list_arrow")
            imgdesplegar.setAttribute("src", "/static/img/flecha-apunta-a-la-derecha.png")

            h1categoria = document.createElement("h1")    
            h1categoria.setAttribute("class","categorias")
            h1categoria.innerHTML = res[x].Categoria
            //console.log("si se esta escribiendo la categoria", h1categoria)          
            divcategoria.appendChild(h1categoria)
            divcategoria.appendChild(imgdesplegar)
            contenedorli.appendChild(divcategoria)
            contenedor.appendChild(contenedorli)
          

            //console.log("los datos",contenedorli)

            
            contenedorsub=document.createElement("ul")
            contenedorsub.setAttribute("class", "list_show")
            subdecategorias=res[x].Subcategorias
            //console.log("subcategorias ijuemadre",subdecategorias)
            for(let s=0; s<subdecategorias.length; s++){       
                
                li = document.createElement("li")
                li.setAttribute("class","list_inside")    

                a=document.createElement("a")
                a.setAttribute("class","nav_link nav_link--inside")
                a.innerHTML=subdecategorias[s].subcategoria

                //console.log("que hay en a",a)
                
                li.appendChild(a)
                contenedorsub.appendChild(li)
                contenedorli.appendChild(contenedorsub)

                //console.log("viendo mi html",contenedorli)


                     
            /* donde estabaaan
            const enlaces = document.querySelectorAll('.nav_link--inside');
            console.log("capturando etiquetas a ")
            console.log(enlaces) */
                
            //console.log("que hay en el contenido resultado",contenidoMostrado)

            
            console.log("siiiiiiiiiiiiiiiiiiiiiiiii?")
            const enlaces = document.querySelectorAll('.nav_link--inside');
            console.log("capturando etiquetas a ")           
            console.log(enlaces)
            console.log("enlaces",enlaces)
            enlaces.forEach(enlace => {
                //console.log("entra al foreach con enlace",enlace.textContent)    
                enlace.addEventListener('click', function(event) {
                    //console.log("palabra quicleadad",enlace)
                    event.preventDefault(); 
                    /* const valor = enlace.getAttribute('data-valor'); */
                    valor = enlace.textContent;
                    console.log("mirando valor",valor)
                    contenidoMostrado.textContent = ContenidoDeBaseDeDatos(valor);
                    //console.log("que hay en el contenedor ",ContenidoDeBaseDeDatos)
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




function ContenidoDeBaseDeDatos(valor) {
    $.ajax({
        url: 'http://127.0.0.1:8000/getpalabrassub/'+valor,
        data: {valor: valor},
        dataType: 'json',
        success: function(data) {
            console.log("valoooooooooor"+valor)
            console.log("ver lo que hay en data palabras",data)
            /* var resultsDiv = $('#resultado');
            resultsDiv.empty();*/
            
            var palabras = data.palabras; 
            //console.log("queria mirar lo que se guarda aqui",palabras)
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
                //resultsDiv.append(grupopalabra)
            });
            
        }

        });
}

})












