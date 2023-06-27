

let hider_btn=document.getElementById('hider_btn');

let hide_abc=document.getElementById('hide_abc');

hider_btn.addEventListener('click', toggleText);

function toggleText(){
    hide_abc.classList.toggle('show');


}