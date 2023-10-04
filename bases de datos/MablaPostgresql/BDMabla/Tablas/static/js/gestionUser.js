var getBrowserInfo = function() {
    var ua= navigator.userAgent, tem, 
    M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
   if(/trident/i.test(M[1])){
        tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
       return 'IE '+(tem[1] || '');
   }
   if(M[1]=== 'Chrome'){
       tem= ua.match(/\b(OPR|Edg)\/(\d+)/);
       if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
   }
   M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
   if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
   return M.join(' ');
};

elementoI = document.getElementsByTagName('i');
var arrayEtiquetasI = Array.from(elementoI);
navegador= getBrowserInfo()
console.log(navegador);

if (navegador.includes('Edg')) {
    arrayEtiquetasI.forEach(function(elementoI) {
        elementoI.remove();
    });
}

function ver(){
    
    passwordInput = $("#password");
    type = passwordInput.attr("type");
    if (type === "password") {
        passwordInput.attr("type", "text");
        $("#toggle-password").removeClass("fa-eye").addClass("fa-eye-slash");
    }
    else {
        passwordInput.attr("type", "password");
        $("#toggle-password").removeClass("fa-eye-slash").addClass("fa-eye");
    }
}

function ver1(){
    passwordInput = $("#password1");
    type = passwordInput.attr("type");
    if (type === "password") {
        passwordInput.attr("type", "text");
        $("#toggle-password1").removeClass("fa-eye").addClass("fa-eye-slash");
    }
    else {
        passwordInput.attr("type", "password");
        $("#toggle-password1").removeClass("fa-eye-slash").addClass("fa-eye");
    }
}
