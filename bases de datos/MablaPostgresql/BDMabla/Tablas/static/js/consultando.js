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
            for(let i = 0; i<titulosCat.length; i++){        
                listacategorias.push(titulosCat[i].textContent)          
                for (let x = 0; x < res.length; x++) {

                    li = document.createElement("li")
                    li.setAttribute("class","list_inside")

                    a=document.createElement("a")
                    a.setAttribute("class","nav_link nav_link--inside")
              
                
                    if (listacategorias[i] == "Sustantivos" && res[x].categoria_id=="Sustantivos"){
                        a.innerHTML=res[x].subcategoria
                        console.log(a)
                        contenedoul.appendChild(li)
                        li.appendChild(a)
                    }

                    if (listacategorias[i] == "Adjetivos" && res[x].categoria_id=="Adjetivos"){
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

            divcajita = document.querySelector(".cajita")
            subcate = document.getElementsByClassName("palabrita")
            listasubcategorias=[]

            for(let i = 0; i<subcate.length; i++){        
                listasubcategorias.push(subcate[i].textContent)          
                for (let x = 0; x < res.length; x++) {

                    divimg = document.createElement("div")
                    divimg.setAttribute("class","img")

                    divtext=document.createElement("div")
                    divtext.setAttribute("class","text")

                    h2=document.createElement("h2")
                    h2.setAttribute("class", "palabrita")
            
              
                
                    if (listasubcategorias[i] == "Animales" && res[x].subcategoria_id=="Animales"){
                        console.log(res[x].Palabra)
                        h2.innerHTML=res[x].Palabra

                        console.log(h2)
                        divcajita.appendChild(divtext)
                        divtext.appendChild(h2)
                    }
 
                }
            }



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