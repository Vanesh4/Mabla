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

    //responsive
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
})