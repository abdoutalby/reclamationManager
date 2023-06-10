import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AjouterReclamationController extends GetxController {

  var isLoading = false.obs;

  TextEditingController municipalite = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController category= TextEditingController();
  TextEditingController image= TextEditingController();
  save() async
  {
      isLoading.value = true ;
      for(var i = 0 ; i<50;i++ ){
        print("object");
      }
      isLoading.value = false;
  }
}