
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:reclamations/pages/reclamations/reclamations_list.dart';

import '../utils/apis.dart';

class HandleReclamationController extends GetxController{
  var isLoading = false.obs;
  var reclamation ;
  var selectedImage = false.obs;
  File? image ;

  @override
  void onInit() {
    reclamation = Get.arguments;
  }
  handleReclamation()async{
    isLoading.value = true;
    try {
      var url = Uri.parse(AppApis.baseUrl + AppApis.addReclamation+reclamation["_id"]);
      var request = http.MultipartRequest('PUT', url);
      // Add form fields
      request.fields["municipalite"] = reclamation["municipalite"];
      request.fields["adresse"] = reclamation["adresse"];
      request.fields["category"] = reclamation["category"];
      request.fields["status"] = "true";

      // Add image file
      var multipartFile = http.MultipartFile(
        'image',
        http.ByteStream(image!.openRead()),
        await image!.length(),
        filename: image?.path.split('/').last,
      );
      // Add the image file to the request
      request.files.add(multipartFile);
      print(request.fields);
      var response = await request.send();
      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.defaultDialog(title: "Done", content: Text(response.reasonPhrase.toString()));
        Get.off(()=>ReclamationList());
      } else {
        isLoading.value = false;
        Get.defaultDialog(title: "oops", content: Text(response.reasonPhrase.toString()));

      }
    } catch (e) {
      isLoading.value = false;
      Get.defaultDialog(title: "oops", content: Text("something is wrong please try agian"));

    }
  }
  getFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      selectedImage.value = true;
    }
  }

  getFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      selectedImage.value = true;
    }
  }
}