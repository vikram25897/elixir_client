import 'package:flutter/material.dart';

class RoundClipper extends CustomClipper<Path>{
  final double x;
  RoundClipper(this.x);
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width/2,size.height/2),radius: size.height*x/1.8));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}