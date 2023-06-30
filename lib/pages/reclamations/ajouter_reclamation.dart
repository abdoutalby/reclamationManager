import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reclamations/controllers/ajouter_reclamation.dart';

import '../../utils/colors.dart';

class AjouterReclamation extends StatefulWidget {
  @override
  State<AjouterReclamation> createState() => AjouterReclamationS();
}

class AjouterReclamationS extends State<AjouterReclamation> {
  late AjouterReclamationController controller;
  File? imageFile;
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
        body: SingleChildScrollView(
            child: Container(
          width: Get.width,
          height: Get.height * 0.86,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: controller.municipalite,
                  decoration: InputDecoration(
                    hintText: "municipalite",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.SECONDARY_COLOR),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                    filled: true,
                  ),
                ),
                TextField(
                  controller: controller.adresse,
                  decoration: InputDecoration(
                    hintText: "adresse",
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.SECONDARY_COLOR),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                    filled: true,
                  ),
                ),
                Obx(
                  () => Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.1,
                    child: controller.isLoading.value
                        ? SizedBox()
                        : DropdownButton<String>(
                            elevation: 2,
                            onTap: () =>
                                print(controller.categories.toString()),
                            value: controller.category.value,
                            items: controller.categories.value.map((value) {
                              return DropdownMenuItem<String>(
                                value: value["_id"],
                                child: Center(child: Text(value["name"])),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              controller.category.value = newValue.toString();
                            },
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () => _getFromGallery(),
                        child: Text("gallery")),
                    TextButton(
                        onPressed: () => _getFromCamera(),
                        child: Text("camera")),
                  ],
                ),
                Obx(() =>controller.selectedImage.value ?
                Image.file(
                  controller.image!,
                  width: Get.width*0.8,
                  height: Get.height * 0.25,
                ):
                const Text('no image Selected')
                  ,),
                Container(
                    width: Get.width - 50,
                    height: Get.height * 0.07,
                    child: ElevatedButton(
                        onPressed: controller.save,
                        child: Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Text("Enregister"))))
              ],
            ),
          ),
        )));
  }

  _getFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      controller.image = File(pickedImage.path);
      controller.selectedImage.value = true;
    }
  }

  _getFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      controller.image = File(pickedImage.path);
      controller.selectedImage.value = true;
    }
  }
}
