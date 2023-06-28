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
    
    titulosCat = document.querySelectorAll('a')
    console.log("porfis",titulosCat)
    $.ajax({
        url: "http://127.0.0.1:8000/getcate",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(i = 0; i <= res.length ; i++){
                titulosCat[i].innerHTML = res[i].Categoria 
            }
            
            
        } 
    })
})