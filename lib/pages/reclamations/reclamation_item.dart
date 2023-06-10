import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/opinion/ajouter_opinion.dart';

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
                color: Colors.white,
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
                  ClipRect(
                    child: Image.network("https://picsum.photos/200"),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("municipalite",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("adresse",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text("category",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ]),
                  Text("status",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(HandleReclamationPage(),
                                arguments: reclamation);
                          },
                          icon: Icon(Icons.auto_fix_high)),
                    ],
                  ),
                ])));
  }
}
