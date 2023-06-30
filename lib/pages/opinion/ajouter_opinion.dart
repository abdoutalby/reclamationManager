import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/ajouter_opinion_controller.dart';
import 'package:reclamations/pages/opinion/opinion_list.dart';

import '../../utils/colors.dart';

class AjouterOpinion extends StatefulWidget {
  @override
  State<AjouterOpinion> createState() => AjouterOpinionS();
}

class AjouterOpinionS extends State<AjouterOpinion> {
  late AjouterOpinionController controller;

  @override
  void initState() {
    controller = Get.put(AjouterOpinionController());
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
        title: Text("ajouter opinion"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.to(()=>OpinionList()),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width ,
          height: Get.height *0.877,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          "Votre opinion  ",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      maxLines: 10,
                      controller: controller.opinion,
                      decoration: InputDecoration(
                        hintText: "Veuillez saisir votre opinion",
                        fillColor: AppColors.WHITE,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppColors.TEXT_COLOR)),
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() => ElevatedButton(
                        onPressed: () {
                          controller.isLoading.value ? () {} : controller.save();
                        },
                        child: controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text("Enregistrer"))),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
