/* let btn=document.getElementById('btn');

let spant=document.getElementById('spant');

btn.addEventListener('click', toggleText);

function toggleText(){
    spant.classList.toggle('sohw');

    if(spant.classList.contains('sohw')){
        btn.innerHTML='Revisando';
        
    }else{
        btn.innerHTML='Mi progreso';
    }
} */

function previewImage(input) {
    var imgPreview = document.getElementById('fotouser');
    
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            imgPreview.src = e.target.result;
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        imgPreview.src = "{{ form.instance.imgPerfil.url }}";  // Mostrar la imagen actual si no se selecciona un archivo
    }
}

$("#imgPreview").on('click', ()=> {
    previewImage()
})

let clicks=document.getElementById('clicks');

let spant=document.getElementById('spant');

clicks.addEventListener('click', toggleText);

function toggleText(){
    spant.classList.toggle('show');
    console.log("entra a la funcion toggletext",spant)
    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='revisando';
        
    }else{
        hideText_btn.innerHTML='mi progreso';
    }
} 

