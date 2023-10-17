$(document).ready (()=>{
    //linkeo a diccionario
    input = document.getElementById("inputADiccio");
    console.log(input)
    input.addEventListener("keydown", function(event) {
        console.log("entro a funcion")
        if (event.key === "Enter" && input.value != "") {
            localStorage.setItem('palabraABuscar', input.value)
            window.location.href = "/diccio";
        }
    });
})