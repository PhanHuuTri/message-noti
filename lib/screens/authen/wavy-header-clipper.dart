import 'package:flutter/material.dart';

class WavyHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Start from (0,0), go down 80% of the container's height
    path.lineTo(0, size.height * 0.8);

    // Draw the first curve
    // You can change the Offset values to create different curves
    path.quadraticBezierTo(
      size.width * 0.25, // Control point X
      size.height * 0.7, // Control point Y
      size.width * 0.5, // End point X
      size.height * 0.8, // End point Y
    );

    // Draw the second curve in succession
    path.quadraticBezierTo(
      size.width * 0.75, // Control point X
      size.height * 0.9, // Control point Y
      size.width, // End point X
      size.height * 0.8, // End point Y
    );

    // Go to the top and close the shape

    path.lineTo(size.width, 0); 
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}