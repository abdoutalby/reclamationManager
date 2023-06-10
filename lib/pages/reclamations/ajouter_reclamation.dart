import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/ajouter_reclamation.dart';

import '../../utils/colors.dart';

class AjouterReclamation extends StatefulWidget {
  @override
  State<AjouterReclamation> createState() => AjouterReclamationS();
}

class AjouterReclamationS extends State<AjouterReclamation> {
  late AjouterReclamationController controller;
  @override
  void initState() {
    controller = Get.put(AjouterReclamationController());
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("ajouter reclamation"),
      ),
      body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: controller.municipalite,
                decoration: InputDecoration(
                  prefix: const Icon(Icons.person),
                  prefixIconColor: AppColors.WHITE,
                  hintText: "municipalite",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.SECONDARY_COLOR),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.adresse,
                decoration: InputDecoration(
                  prefix: const Icon(Icons.person),
                  prefixIconColor: AppColors.WHITE,
                  hintText: "adresse",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.SECONDARY_COLOR),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
  TextField(
                controller: controller.category,
                decoration: InputDecoration(
                  prefix: const Icon(Icons.person),
                  prefixIconColor: AppColors.WHITE,
                  hintText: "category",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.SECONDARY_COLOR),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

           TextButton(onPressed: ()=>_chooseImage, child: Text("image")),
              const SizedBox(
                height: 20,
              ),

              Container(
                  width: Get.width-50,
                  height: Get.height*0.07,
                  child: ElevatedButton(onPressed: controller.save, child: Obx(()=> controller.isLoading.value?CircularProgressIndicator()
                      : Text("Enregister"))))
            ],
          ),
        ),
      );

  }
}

class _chooseImage {
}
