let listElements=document.querySelectorAll('.list_button--click');

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

/* let hideText_btn=document.getElementById('hideText_btn');

let hideText=document.getElementById('hideText');

hideText_btn.addEventListener('click', toggleText);

function toggleText(){
    hideText.classList.toggle('show');

    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='Revisando';
        
    }else{
        hideText_btn.innerHTML='Animales';
    }
} */


$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h1')
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            for(i = 0; i <= res.length ; i++){
                titulosCat[i].innerHTML = res[i].Categoria 
            }
            
            
        } 
    })

    
    $.ajax({
        url: "http://127.0.0.1:8000/getsubcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)           
            contenedoul = document.querySelector(".list_show")
            categorias = document.getElementsByClassName("categorias")
            console.log(contenedoul)
            listacategorias = []
            for(let i = 0; i<categorias.length; i++){
                
                listacategorias.push(categorias[i].textContent)
            

                for (let x = 0; x < res.length; x++) {

                    li = document.createElement("li")
                    li.setAttribute("class","list_inside")

                    a=document.createElement("a")
                    a.setAttribute("class","nav_link nav_link--inside")
              
                
                    if (listacategorias[i] == "Sustantivos" && res[x].categoria_id=="Sustantivos"){
                        console.log(res[x].subcategoria)
                        a.innerHTML=res[x].subcategoria

                        console.log(a)
                        contenedoul.appendChild(li)
                        li.appendChild(a)
                    }
                        
                }
            }    
            
        } 
    })



    $.ajax({
        url: "http://127.0.0.1:8000/getsubcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            

        }
    
    })




})



$(document).ready(function () {
    
    titulosSubcat = document.querySelectorAll('a')
    console.log(titulosSubcat)
    $.ajax({
        url: "http://127.0.0.1:8000/viendosustan",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            for(i = 0; i <= res.length ; i++){
                titulosSubcat[i].innerHTML = res[i].subcategoria 
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