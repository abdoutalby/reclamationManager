import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/apis.dart';

class AnnoncesController extends GetxController{

  var isLoading = false.obs;
  var annonces = [].obs;

  @override
  void onInit() {
    getAll();
  }

   getAll() async {
     isLoading.value = true ;
     try {
       var url = Uri.parse(AppApis.baseUrl+AppApis.getAllAnnonces);
       print(url);
       var response = await http.get(url);
       if (response.statusCode == 200) {
         isLoading.value = false;
         print(response.body);
         annonces.value =jsonDecode(response.body);
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