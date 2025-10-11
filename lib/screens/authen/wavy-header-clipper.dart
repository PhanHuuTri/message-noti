import 'package:flutter/material.dart';

class WavyHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Bắt đầu từ (0,0), đi xuống 80% chiều cao của container
    path.lineTo(0, size.height * 0.8);

    // Vẽ đường cong thứ nhất
    // Bạn có thể thay đổi các giá trị Offset để tạo ra đường cong khác nhau
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.2, size.height - 30.0);
    path.quadraticBezierTo(
      firstControlPoint.dx, firstControlPoint.dy,
      firstEndPoint.dx, firstEndPoint.dy
    );
    
    // Vẽ đường cong thứ hai nối tiếp
    var secondControlPoint = Offset(size.width - (size.width / 3.2), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
     path.quadraticBezierTo(
      secondControlPoint.dx, secondControlPoint.dy,
      secondEndPoint.dx, secondEndPoint.dy
    );

    // Đi lên đỉnh và đóng hình lại
    path.lineTo(size.width, 0); 
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}