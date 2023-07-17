
let btn=document.getElementById('btn');

let spant=document.getElementById('spant');

btn.addEventListener('click', toggleText);

function toggleText(){
    spant.classList.toggle('show');

    if(spant.classList.contains('show')){
        btn.innerHTML='Revisando';
        
    }else{
        btn.innerHTML='Mi progreso';
    }
}

