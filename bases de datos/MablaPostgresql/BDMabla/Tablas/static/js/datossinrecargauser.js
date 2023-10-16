function consultar(){
    fetch("http://127.0.0.1/tablaUsuario",{
        method:"GET",
        headers:{
            "consultar-type":"Tablas/json"
        }
    })
    .then(response=>response.json())
    .then(datos=>{
        console.log(datos)
        tabla=document.getElementById("consultaUsers")
        tabla.innerHTML=""
        if(datos==0){
            tabla.innerHTML+='<tr><td>No hay datos</td></tr>'
        }
        else{
            for(dat of datos){
                tabla.innerHTML+=`
                    <tr>
                    <td>${dat.alias}</td>
                    <td>${dat.nombre}</td>
                    <td>${dat.apellido}</td>
                    <td>${dat.telefono}</td>
                    <td>${dat.correo}</td>
                    <td>${dat.clave}</td>
                    </tr>
                `
            }
        }
    })
}
