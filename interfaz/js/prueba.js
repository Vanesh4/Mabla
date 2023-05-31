window.addEventListener("load",mostrar);
function mostrar() {
  var x = document.getElementById('alerta');
  var x1 = document.getElementById('alerta1');
  if (x.style.display && x1.style.display === 'none') {
      x.style.display = 'block';
      x1.style.display = 'block';
  } else {
      x.style.display = 'block';
      x1.style.display = 'block';
  }
}