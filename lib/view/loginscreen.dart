import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/services.dart';
import 'homepage.dart';

class LoginScreen extends StatelessWidget {
  var controller = Get.put<Service>(Service());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create login screen
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Screen',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.emailController.value,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.passwordController.value,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.login().then((value) {
                    if (value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      //create snackbar
                      Get.snackbar('Login Success', 'Welcome to Home Page',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      Get.snackbar('Login Failed', 'Wrong Username or Password',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  });
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
