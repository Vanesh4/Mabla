

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


function consultar(){
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
}