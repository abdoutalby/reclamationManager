import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:reclamations/pages/opinion/opinion_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/apis.dart';
import 'package:http/http.dart'as http;

class AjouterOpinionController extends GetxController{
  var isLoading = false.obs;

  TextEditingController opinion = TextEditingController();

  save() async {
    isLoading.value = true ;
    var citoyen = "";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var decoded = JwtDecoder.decode(token!);
      print(decoded["subject"]);
      var url = Uri.parse(AppApis.baseUrl+AppApis.addOpinion);
      print(url);
      var response = await http.post(url, body: {
        'opinion': opinion.text.toString(),
        "citoyen":decoded["subject"]["_id"]
      });
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.defaultDialog(title: "Done", content: Text("Opinion ajouter"));
        opinion.clear();
        Get.off(()=>OpinionList());
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.body.toString()));
      }
    }catch(e){
      isLoading.value = false;
      Get.defaultDialog(title: "OOPS", content: Text(e.toString()));

    }
  }
}