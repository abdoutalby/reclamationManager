import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reclamations/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/reclamations/reclamations_list.dart';
import '../utils/apis.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginCitoyen() async {
    isLoading.value = true;
    var type = Get.arguments;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse(AppApis.baseUrl+(type=="citoyen"? AppApis.loginCitoyen: AppApis.loginAgent));
      print(url);
      var response = await http.post(url, body: {
        'email': emailController.text.toString(),
        'password': passwordController.text.toString()
      }
      );
      if (response.statusCode == 200) {
        var json =jsonDecode(response.body );
        print(json["token"]);
        prefs.setString("token", json["token"]);
        isLoading.value = false;
        type=="citoyen"?
        Get.to(()=>HomePage()):
        Get.to(()=>ReclamationList());
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
