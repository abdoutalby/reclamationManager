import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../pages/home.dart';
import '../utils/apis.dart';

class AjouterReclamationController extends GetxController {

  var isLoading = false.obs;
  var selectedImage = false.obs;
  var categories = [].obs;

  TextEditingController municipalite = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController status = TextEditingController();
    File? image ;
  var category= "Select an option".obs;


  @override
  void onInit() {
    getAllCategories();
  }

  getAllCategories() async {
    isLoading.value = true ;
    try {
      var url = Uri.parse(AppApis.baseUrl+AppApis.getAllCat);
      print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(response.body);
        var json = jsonDecode(response.body);
        categories.value=json;
        category.value = categories.value.elementAt(0)["_id"];
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.body.toString()));
      }
    }catch(e){
      isLoading.value = false;
      Get.defaultDialog(title: "OOPS", content: Text(e.toString()));

    }
  }

  save() async
  {
    isLoading.value = true;
    try {
      var url = Uri.parse(AppApis.baseUrl + AppApis.addReclamation);
      var request = http.MultipartRequest('POST', url);
      // Add form fields
      request.fields["municipalite"] = municipalite.text.trim();
      request.fields["adresse"] = adresse.text;
      request.fields["category"] = category.value.toString();

      // Add image file
      var multipartFile = http.MultipartFile(
        'image',
        http.ByteStream(image!.openRead()),
        await image!.length(),
        filename: image?.path.split('/').last,
      );
      // Add the image file to the request
      request.files.add(multipartFile);
      var response = await request.send();
      if (response.statusCode == 201) {
        isLoading.value = false;
        Get.defaultDialog(title: "Done", content: Text(response.reasonPhrase.toString()));
        Get.off(()=>HomePage());
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.reasonPhrase.toString()));

      }
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: "oops", content: Text("something is wrong please try agian"));

    }
  }
  }
