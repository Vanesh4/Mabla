let seconds = 3; 
tamañoActual  = 50
function updateCounter() {
    const video = document.getElementById("contadorVideo");

    function aumentarTamaño() {
        tamañoActual += 20; // Aumentar el tamaño en 100 píxeles
        video.style.width = tamañoActual + "px";
        console.log(video.style)
        setTimeout(aumentarTamaño, 1000); // Aumentar cada segundo (1000 milisegundos)
    }
    aumentarTamaño();
    video.currentTime = seconds;
    seconds--;
  
  if (seconds < 0) {
    numeroAleatorio = Math.round(Math.random()) + 1;
    if (numeroAleatorio==1) {
        window.location.href = "/quizTipo1";
    }else{
        window.location.href = "/quizTipo2";
    } 
  } else {
    setTimeout(updateCounter, 1000); 
  }
}

updateCounter();

console.log("hola?")
