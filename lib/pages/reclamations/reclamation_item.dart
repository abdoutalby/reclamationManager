import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/opinion/ajouter_opinion.dart';
import 'package:reclamations/utils/apis.dart';

import 'handle_reclamation.dart';

class ReclamationItem extends StatelessWidget {
  var reclamation;
  ReclamationItem({super.key, required this.reclamation});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: Get.height * 0.18,
            width: Get.width * 0.95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: reclamation["status"] ?  Colors.green[100] : Colors.red[100],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(4, 4))
                ]),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: Get.width * 0.12,
                      height: Get.height * 0.17,
                      child: ClipRect(
                        child: Image.network(
                          AppApis.baseUrl +
                              AppApis.uploads +
                              reclamation["_id"],
                        //   errorBuilder: (c, exception, stackTrace) {
                        //     return Center(
                        //         child: Icon(
                        //       Icons.error_outline,
                        //       color: Colors.red[300],
                        //       size: Get.width * 0.12,
                        //     ));
                        //   },
                        ),
                      )),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${reclamation["municipalite"]}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("${reclamation["adresse"]}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ]),
                  Text("${reclamation["status"]}",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.off(() => HandleReclamationPage(),
                                arguments: reclamation);
                          },
                          icon: Icon(Icons.auto_fix_high)),
                    ],
                  ),
                ])));
  }
}
