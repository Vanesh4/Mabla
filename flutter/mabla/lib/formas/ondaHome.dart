import 'package:flutter/material.dart';

/*
class ondaHome extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final paint = new Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    final path = Path();
    // Mover al punto inicial
    path.moveTo(0, size.height);

    // Dibujar la onda leve utilizando curvas de Bézier cuádricas
    path.quadraticBezierTo(
      size.width*0.3, // Coordenada X del punto de control
      size.height*0.9, // Coordenada Y del punto de control
      size.height/4, // Coordenada X del punto final
      size.height*0.9, // Coordenada Y del punto final
    );

    */
/*path.quadraticBezierTo(
      size.width / 2, // Coordenada X del punto de control
      0, // Coordenada Y del punto de control
      size.width, // Coordenada X del punto final
      size.height, // Coordenada Y del punto final
    );*//*




    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
  
}*/

class ondaHome extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    final firstStartPoint = Offset(size.width/4 - size.width/8, size.height-60);
    final firstendPoint = Offset(size.width/4 + size.width/8, size.height-70);
    path.quadraticBezierTo(
        firstStartPoint.dx, firstStartPoint.dy,
        firstendPoint.dx, firstendPoint.dy);

    final sencondStartPoint = Offset(size.width/2, size.height-65);
    final secondendPoint = Offset(size.width/2 + size.width/8, size.height-50);
    path.quadraticBezierTo(
        sencondStartPoint.dx, sencondStartPoint.dy,
        secondendPoint.dx, secondendPoint.dy);

    final thirdStartPoint = Offset(3*(size.width/4)+size.width/8, size.height-30);
    final thirdendPoint = Offset(size.width, size.height-90);
    path.quadraticBezierTo(
        thirdStartPoint.dx, thirdStartPoint.dy,
        thirdendPoint.dx, thirdendPoint.dy);
    
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

class pico extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    final firstStartPoint = Offset(size.width/4 - size.width/10, size.height-60);
    final firstendPoint = Offset(size.width/4 + size.width/8, size.height-70);
    path.quadraticBezierTo(
        firstStartPoint.dx, firstStartPoint.dy,
        firstendPoint.dx, firstendPoint.dy);

    final sencondStartPoint = Offset(size.width/2, size.height-75);
    final secondendPoint = Offset(size.width/2 + size.width/8, size.height-70);
    path.quadraticBezierTo(
        sencondStartPoint.dx, sencondStartPoint.dy,
        secondendPoint.dx, secondendPoint.dy);

    final thirdStartPoint = Offset(3*(size.width/4)+size.width/8, size.height-30);
    final thirdendPoint = Offset(size.width, size.height-90);
    path.quadraticBezierTo(
        thirdStartPoint.dx, thirdStartPoint.dy,
        thirdendPoint.dx, thirdendPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
