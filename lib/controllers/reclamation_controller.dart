import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../utils/apis.dart';

class ReclamationController extends GetxController{

  var isLoading = false.obs;
  var reclamationsList = [].obs;

  @override
  void onInit() {
    getAllReclams();
  }


  getAllReclams() async {
    isLoading.value = true ;
    try {
      var url = Uri.parse(AppApis.baseUrl+AppApis.getAllReclamation);
      print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isLoading.value = false;
        var json = jsonDecode(response.body);
        reclamationsList.value=json["reclamations"];
        print(json["reclamations"]);
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