$(document).ready (()=>{
    
    header = document.getElementById("header")

    $("#imgBotonAbrirMenu").on("click", ()=>{      
        header.style.setProperty("display", "inherit")
    })

    $("#imgBotonCerrarMenu").on("click", ()=>{
        //console.log("porfavor")
        header.style.setProperty("display", "none")
    })
})



