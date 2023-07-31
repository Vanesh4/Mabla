

cat = document.getElementById("butCat").value
localStorage.setItem('categoria', cat)
function llevar() {
    window.location.href = "quiiz.html";
}


console.log("cat: "+cat);
