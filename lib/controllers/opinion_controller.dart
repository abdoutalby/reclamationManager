import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../utils/apis.dart';

class OpinionController extends GetxController{

  var isLoading = false.obs;
  var opinonsList = [].obs;


  @override
  void onInit() {
    getAllByOwner();
  }

  getAllByOwner()async {
    isLoading.value = true ;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var decoded = JwtDecoder.decode(token!);
      var url = Uri.parse(AppApis.baseUrl+AppApis.getUserOpinions+decoded["subject"]["_id"].toString());
      print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isLoading.value = false;
        opinonsList.value =jsonDecode( response.body)["opinions"];
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.body.toString()));
      }
    }catch(e){
      isLoading.value = false;
      Get.defaultDialog(title: "OOPS", content: Text(e.toString()));

    }
  }

  deleteOpinion(id) async {
    isLoading.value = true ;
    try {
      var url = Uri.parse(AppApis.baseUrl+AppApis.deleteOpinion+id.toString());
      print(url);
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        isLoading.value = false;
        getAllByOwner();
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