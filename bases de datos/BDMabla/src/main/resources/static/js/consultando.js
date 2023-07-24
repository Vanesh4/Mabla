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

let hideText_btn=document.getElementById('hideText_btn');

let hideText=document.getElementById('hideText');

hideText_btn.addEventListener('click', toggleText);

function toggleText(){
    hideText.classList.toggle('show');

    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='Revisando';
        
    }else{
        hideText_btn.innerHTML='Animales';
    }
}


$(document).ready(function () {
    
    titulosCat = document.querySelectorAll('h1')
    /* console.log("porfis",titulosCat) */
    $.ajax({
        url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
           /*  console.log("jbvhbvjxzj holaaa",res) */
            for(i = 0; i <= res.length ; i++){
                /* console.log("mirandoooo",res) */
                titulosCat[i].innerHTML = res[i].categoria 
            }
            
            
        } 
    })
})


$.ajax({
    url: "http://localhost:8080/getSubcategoria",
    type: "GET",
    dataType: "JSON",
    
    success: function (res) {
        console.log("bdvhbjhbjzb "),
        console.log(res)           
        contenedoul = document.querySelector(".list_show")
        categorias = document.getElementsByClassName("categorias")
        console.log("hggbjhbpintadooooo", contenedoul)
        listacategorias = []
        for(let i = 0; i<titulosCat.length; i++){  
            console.log("bdvhbjhbjzb ")      
            listacategorias.push(titulosCat[i].textContent)          
            for (let x = 0; x < res.length; x++) {

                li = document.createElement("li")
                li.setAttribute("class","list_inside")

                a=document.createElement("a")
                a.setAttribute("class","nav_link nav_link--inside")
          
            
                if (listacategorias[i] == "sustantivos" && res[x].categoria_id=="sustantivos"){
                    console.log("bdvhbjhbjzb "),
                    a.innerHTML=res[x].subcategoria
                    console.log(a)
                    contenedoul.appendChild(li)
                    li.appendChild(a)
                }

               

                    
            }
        }    
        
    } 
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