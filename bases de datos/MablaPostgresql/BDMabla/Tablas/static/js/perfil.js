
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