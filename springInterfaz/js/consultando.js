let listElements=document.querySelectorAll('.categorias');

listElements.forEach(listElement => {
    listElement.addEventListener('click',()=>{

        listElement.classList.toggle('arrow');

        let height=0;
        let menu=listElement.nextElementSibling;
        if(menu.clientHeight=="0"){
            height=menu.scrollHeight
        }

        menu.style.height =`${height}px`;

    })
    
}); 


function consultarCategoria(){

    fetch("http://127.0.0.1:8000/getcate",{
        method:"GET",
        headers:{
            "consultar-type":"Tablas/json"
        }
    })

    .then(response=>response.json())
    .then(datos=>{
        console.log(datos)
        let tabla=document.getElementById("consultaCategoria");
        tabla.innerHTML=""; // mostrar los datos en el html
        if(datos==0){
            tabla.innerHTML+=`<tr><td>NO hay Datos</td></tr>`
        }else{
            for(let dat of datos){
                tabla.innerHTML+=`
                <tr>
                <td>${dat.Categoria}</td>
                
                </tr>`
            }
        }
    })
}

/* let list_show=document.getElementById('list_show');

let hideText=document.getElementById('hideText');

list_show.addEventListener('click', toggleText);

function toggleText(){
    hideText.classList.toggle('show');

    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='Revisando';
        
    }else{
        hideText_btn.innerHTML='Animales';
    }
}  */


$(document).ready(function () {
    
 /*    titulosCat = document.querySelectorAll('h1')
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            for(i = 0; i <= res.length ; i++){
                titulosCat[i].innerHTML = res[i].Categoria 
            }
            
            
        } 
    }) */




    contenedor = document.querySelector("#caja")
    
    $.ajax({
        url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",      
        success: function (res) {    
            console.log("categorias",res)               
            for(let x = 0; x<=res.length; x++) {
                console.log("hollaaaaaa",res[x])
                divcategoria=document.createElement("div")
                divcategoria.setAttribute("class","nav")
                

                h1categoria = document.createElement("h1")    
                h1categoria.setAttribute("class","categorias")
                h1categoria.innerHTML = res[x].categoria 
                divcategoria.appendChild(h1categoria)

                console.log("los datos",divcategoria)

            
                subcategorias=res[x].tablaSubcategorias
                for(let s=0; s<subcategorias.length; s++){

                    contenedorsub=document.createElement("div")
                    contenedorsub.setAttribute("class", "list_show")

                    /* li = document.createElement("li")
                    li.setAttribute("class","list_inside")

                    a=document.createElement("a")
                    a.setAttribute("class","nav_link nav_link--inside") */                      
                    contenedorsub.innerHTML=subcategorias[s].subcategoria
                    divcategoria.appendChild(contenedorsub)


                    
                } 

                contenedor.appendChild(divcategoria)


                    
            }
        }    

    })

    
    $.ajax({
        url: "http://localhost:8080/getSubcategoria",
        type: "GET",
        dataType: "JSON",      
        success: function (res) {    
            console.log("subcategorias",res) 
            for(let s=0; s<=res.length; s++){
                
            }

            

               

                    
            }
    })    


    })



/* function mostrarsubcate(){

    fetch("http://127.0.0.1:8000/getsubcate",{
        method:"GET",
        headers:{
            "consultar-type":"Tablas/json"
        }
    })

    .then(response=>response.json())
    .then(datos=>{
        console.log(datos)
        let caja=document.getElementById("cajita");
        caja.innerHTML=""; // mostrar los datos en el html
        if(datos==0){
            caja.innerHTML+=`<h2>NO hay Datos</h2>`
        }else{
            for(let dat of datos){
                caja.innerHTML+=`
                <h2>${dat.subcategoria}</h2>
                `
            }
        }
    })
} */