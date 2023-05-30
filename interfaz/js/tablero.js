canvas= document.querySelector('#pizarra')
lineas=[]
correccionX=0
correccionY=0
pintarL=false
nuevaPosX=0
nuevaPosY=0
posicion= canvas.getBoundingClientRect()
correccionX= posicion.x
correccionY= posicion.y

canvas.width=500
canvas.height=500

function empezarDibujo(){
    pintarL = true
    lineas.push([])
}

function guardarLinea(){
    lineas[lineas.length-1].push({
        x: nuevaPosX,
        y: nuevaPosY
    })
}

function dibujarLinea(event) {
    event.preventDefault();
    if (pintarL) {
        let ctx = canvas.getContext('2d')
        // Estilos de linea
        ctx.lineJoin = ctx.lineCap = 'round';
        ctx.lineWidth = 10;
        // Color de la linea
        ctx.strokeStyle = '#fff';
        // Marca el nuevo punto
        if (event.changedTouches == undefined) {
            // Versión ratón
            nuevaPosX = event.layerX;
            nuevaPosY = event.layerY;
        } else {
            // Versión touch, pantalla tactil
            nuevaPosX = event.changedTouches[0].pageX - correccionX;
            nuevaPosY = event.changedTouches[0].pageY - correccionY;
        }
        // Guarda la linea
        guardarLinea();
        // Redibuja todas las lineas guardadas
        ctx.beginPath();
        lineas.forEach(function (segmento) {
            ctx.moveTo(segmento[0].x, segmento[0].y);
            segmento.forEach(function (punto, index) {
                ctx.lineTo(punto.x, punto.y);
            });
        });
        ctx.stroke();
    }
}

/**
 * Funcion que deja de dibujar la linea
 */
function pararDibujar () {
    pintarL = false;
    guardarLinea();
}

//======================================================================
// EVENTOS
//======================================================================

// Eventos raton
canvas.addEventListener('mousedown', empezarDibujo, false);
canvas.addEventListener('mousemove', dibujarLinea, false);
canvas.addEventListener('mouseup', pararDibujar, false);

// Eventos pantallas táctiles
canvas.addEventListener('touchstart', empezarDibujo, false);
canvas.addEventListener('touchmove', dibujarLinea, false);