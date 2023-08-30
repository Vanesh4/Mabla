let hider_btn=document.getElementById('hider_btn');

let hide_abc=document.getElementById('hide_abc');

hider_btn.addEventListener('click', toggleText);

function toggleText(){
    hide_abc.classList.toggle('show');
    console.log("entra a la funcion toggletext",hide_abc)
    if(hideText.classList.contains('show')){
        hideText_btn.innerHTML='r';

    }else{
        hideText_btn.innerHTML='y';
    }


}