import 'package:flutter/material.dart';
import 'package:flutter_library/auth/signin.dart';
import 'package:flutter_library/navigation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      final box = GetStorage();
      final username = box.read('username');

      if (username == null) {
        Get.off(() => SignIn());
      } else {
        Get.off(() => Navigation());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'UDB',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
