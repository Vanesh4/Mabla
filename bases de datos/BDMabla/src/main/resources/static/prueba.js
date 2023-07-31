document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("miFormulario");
  
    form.addEventListener("submit", function(event) {
      let isValid = true;
  
      // Verificar cada campo requerido
      form.querySelectorAll("[required]").forEach(function(input) {
        if (input.value.trim() === "") {
          isValid = false;
          showPopover(input);
        } else {
            alert("hola")
          hidePopover(input);
        }
      });
  
      // Si algún campo requerido está vacío, se detiene el envío del formulario
      if (!isValid) {
        event.preventDefault();
      }
    });
  
    function showPopover(input) {
      const popover = input.nextElementSibling;
      popover.classList.add("active");
    }
  
    function hidePopover(input) {
      const popover = input.nextElementSibling;
      popover.classList.remove("active");
    }
  });
  