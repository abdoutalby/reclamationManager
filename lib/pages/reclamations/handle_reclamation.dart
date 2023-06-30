import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/handle_reclamation.dart';
import 'package:reclamations/pages/reclamations/reclamations_list.dart';

class HandleReclamationPage extends StatefulWidget {
  @override
  State<HandleReclamationPage> createState() => HandleReclamationPageS();
}

class HandleReclamationPageS extends State<HandleReclamationPage> {
  late HandleReclamationController controller;

  @override
  void initState() {
    controller = Get.put(HandleReclamationController());
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
        title: Text("handle Reclamation "),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.off(() => ReclamationList()),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              "https://picsum.photos/200",
              width: Get.width,
              height: Get.height * 0.4,
            )),
        Text("${controller.reclamation["municipalite"]}"),
        Text("${controller.reclamation["adresse"]}"),
        Text("${controller.reclamation["status"]}"),
        Container(
          width: Get.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () => controller.getFromCamera(),
                  child: Text("Take a picture")),
              ElevatedButton(
                  onPressed: () => controller.getFromGallery(),
                  child: Text("Upload a picture"))
            ],
          ),
        ),
        Container(
            width: Get.width * 0.8,
            height: Get.height * 0.08,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[300])),
              onPressed: () => controller.handleReclamation(),
              child: Obx(() => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Text("Save")),
            ))
      ]),
    );
  }
}
