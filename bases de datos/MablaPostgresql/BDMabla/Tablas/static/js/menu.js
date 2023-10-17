$(document).ready(function () {
    $("#imgBotonAbrirMenu").on("click", ()=>{
        $(".header").css({
            "display": "inherit"});
        $("#imgBotonAbrirMenu").css({
            "display": "none"});
        $("body").css({
            "overflow": "hidden"});
        //console.log("helllou")
    })
    
    $("#imgBotonCerrarMenu").on("click", ()=>{
        $(".header").css({
            "display": "none"});
        $("body").css({
            "overflow": "visible"});
        $("#imgBotonAbrirMenu").css({
            "display": "inherit"});
        //console.log("helllou x2")
    })
    /* titulosCat = document.querySelectorAll('h2')
    divsCategorias = document.querySelectorAll('.categoria')
    console.log("lenght: "+titulosCat.length) */

    contenedor = document.querySelector("#menuContenido")
    //console.log("porfis",divsCategorias[6])
    
    $.ajax({
        //url: "http://192.168.43.184/getcate",
        url: "http://127.0.0.1:8000/getcate",
        //url: "http://localhost:8080/getCategorias",
        type: "GET",
        dataType: "JSON",
        success: function (res) {
            console.log(res)
            for(let i=0; i<res.length; i++){
                          
                divCategoria = document.createElement("a")
                divCategoria.setAttribute("class","categoria")
                divCategoria.setAttribute("href","/mostrar")

                h2Categoria = document.createElement("h2")
                h2Categoria.innerHTML = res[i].Categoria
                //console.log(res[i].Categoria)
                
                divCategoria.appendChild(h2Categoria)
                
                
                subcategorias = res[i].Subcategorias
                //console.log(subcategorias)
                for (let s = 0; s < subcategorias.length; s++) {
                    //console.log(subcategorias[s].subcategoria)
                    subcate = document.createElement("div")
                    subcate.setAttribute("class","subcategoria")
                    subcate.innerHTML = subcategorias[s].subcategoria
                    divCategoria.appendChild(subcate)
                }
                
                contenedor.appendChild(divCategoria)
           }

        }, error: function(error) {
            window.location.href = "/error";
        }          
    })
    //linkeo a diccionario
    input = document.getElementById("inputADiccio");
    console.log(input)
    input.addEventListener("keydown", function(event) {
        console.log("entro a funcion")
        if (event.key === "Enter" && input.value != "") {
            localStorage.setItem('palabraABuscar', input.value)
            window.location.href = "/diccio";
        }
    })
    
})

document.addEventListener("DOMContentLoaded", function() {
    // Obtén una referencia al botón
    console.log("hola")
    const boton = document.getElementsByClassName("categoria");
    arrayDeNodos=[]
    arrayDeNodos.push(boton)
    console.log(arrayDeNodos)
    boton.addEventListener("click",function () {
        window.location.href = "/mostrar"
    })
});