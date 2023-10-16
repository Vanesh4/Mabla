document.addEventListener('DOMContentLoaded', function() {
    const countdownText = document.getElementById('countdownText');
    let count = 3;
  
    function startCountdown() {
      countdownText.textContent = count;
  
      if (count === 0) {
        document.getElementById('splash').style.display = 'none';
        document.getElementById('contenido').style.display = 'block';
      } else {
        count--;
        setTimeout(startCountdown, 1000);
      }
    }
  
    // Iniciar el splash y la cuenta regresiva después de 1 segundo
    setTimeout(startCountdown, 1000);
});