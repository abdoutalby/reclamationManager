import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/home.dart';
import 'package:reclamations/pages/opinion/ajouter_opinion.dart';

import '../../controllers/opinion_controller.dart';
import '../reclamations/reclamation_item.dart';
import 'opinion_item.dart';

class OpinionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OpinionListS();
}

class OpinionListS extends State<OpinionList> {
  late var controller;
  @override
  void initState() {
    super.initState();
    controller = Get.put(OpinionController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my opinions "),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(()=>HomePage());
          },
        ),
      ),
      body: Obx(
         () =>Container(
            child: controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.opinonsList.value.length,
                    itemBuilder: (c, i) => OpinionItem(
                          opinion: controller.opinonsList.value[i],
                        )),
          )
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.add),
            onPressed: () {
              Get.off(() => AjouterOpinion());
            }),
    );
  }
}
