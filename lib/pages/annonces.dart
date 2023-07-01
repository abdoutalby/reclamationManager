import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/annonces_controller.dart';

class AnnoncesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnnoncesListS();
}

class AnnoncesListS extends State<AnnoncesList> {
  late AnnoncesController controller;
  @override
  void initState() {
    controller = Get.put(AnnoncesController());
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
        title: Text("annonces "),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : controller.annonces.value.length > 0
              ? ListView.builder(
                  itemCount: controller.annonces.value.length,
                  itemBuilder: (c, i) =>
                      AnnonceItem(controller.annonces.value.elementAt(i)))
              : Center(
                  child: Text(
                    "no annonces for now",
                    style: TextStyle(fontSize: Get.width * 0.1),
                  ),
                )),
    );
  }

  AnnonceItem(annonce) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
          ),
          width: Get.width * 0.8,
          height: Get.height * 0.2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(annonce["title"] , style: TextStyle(
              fontSize: Get.width *0.05,
              fontWeight: FontWeight.bold
            ),) ,
            Text(annonce["dateAjout"]) ,

          ])),
    );
  }
}
