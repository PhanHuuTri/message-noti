import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Đảm bảo màn hình mở rộng toàn bộ màn hình
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: Colors.white, // Màu nền cho màn hình splash
      body: Center(
        child: Image.asset('assets/images/logo.png'), // Đường dẫn tới logo của bạn
      ),
    );
  }
}
