import 'package:flutter/material.dart';
import 'package:flutter_library/navigation.dart';
import 'package:flutter_library/profile.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool seePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Masuk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Nama Pengguna',
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.account_circle_outlined),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              textAlignVertical: TextAlignVertical.center,
              obscureText: seePass,
              decoration: InputDecoration(
                hintText: 'Kata Sandi',
                filled: true,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.password_outlined),
                suffixIcon: TextButton.icon(
                  onPressed: () {
                    setState(() {
                      seePass = !seePass;
                    });
                  },
                  label: Icon(
                    seePass
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      final box = GetStorage();
                      box.write('username', usernameController.text);
                      Get.off(() => Navigation());
                    },
                    child: Text('Masuk'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
