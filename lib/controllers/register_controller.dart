import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reclamations/utils/apis.dart';

import '../pages/login_page.dart';

class RegisterController extends GetxController{
  var isLoading = false.obs;


  var  name = TextEditingController();
  var  lastname = TextEditingController();
  var  adresse = TextEditingController();
  var  tel = TextEditingController();
  var  emailController = TextEditingController();
  var  passwordController = TextEditingController();

  register() async {
 var body = {  "name": name.text.toString(),
    "lastname":lastname.text.toString(),
    "adresse": adresse.text.toString(),
    "tel": tel.text.toString(),
    "email":emailController.text.toString(),
    "password": passwordController.text.toString() ,
    "role":1.toString()
 };

    isLoading.value = true ;
    try {
      var url = Uri.parse(AppApis.baseUrl+AppApis.registerCitoyen);
      var response = await http.post(url, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if(response.statusCode == 201){
        isLoading.value =false ;
        Get.off(()=>LoginPage());
      }else {
        isLoading.value =false ;
        Get.defaultDialog(title: "oops", content: Text("something went wrong please try agian"));
      }
    }catch(e){
      isLoading.value =false ;
      Get.defaultDialog(title: "OOPS", content: Text(e.toString()));
    }
  }
}