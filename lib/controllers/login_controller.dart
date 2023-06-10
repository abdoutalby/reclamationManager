import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Login() async {
    isLoading.value = true;
    try {
      var url = Uri.parse('http://192.168.1.13:8000/citoyen/login');
      var response = await http.post(url, body: {
        'email': emailController.text.toString(),
        'password': passwordController.text.toString()
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.defaultDialog(title: "ok", content: Text("logged in "));
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.body.toString()));
      }
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: "OOPS", content: Text(e.toString()));
    }
  }
}
