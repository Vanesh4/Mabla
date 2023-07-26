
function mostrarTeclado() {
    const contenidoDiv = document.getElementById('hide_abc');

    if (contenidoDiv.style.visibility == 'hidden') {
        contenidoDiv.style.visibility = 'inherit';
    } else {
        contenidoDiv.style.visibility = 'hidden';
    }
}

alturaAbc = ()=>{
    teclado = document.getElementById('hide_abc');
    alturaPantalla = window.innerHeight;
    teclado.style.height = alturaPantalla + 'px';
}
alturaAbc()
window.addEventListener('resize', ajustarAlturaContenedor)


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