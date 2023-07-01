import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/annonces.dart';
import 'package:reclamations/pages/opinion/ajouter_opinion.dart';
import 'package:reclamations/pages/opinion/opinion_list.dart';
import 'package:reclamations/pages/reclamations/ajouter_reclamation.dart';
import 'package:reclamations/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageS();
}

class HomePageS extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil"),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Get.offAll(() => SplashScreen());
              },
              icon: Icon(Icons.login_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => OpinionList());
              },
              child: Container(
                height: Get.height * 0.09,
                width: Get.width * 0.91,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lightbulb,
                      size: 35,
                    ),
                    Text(
                      "une Idee",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(AjouterReclamation());
                },
                child: Container(
                  height: Get.height * 0.09,
                  width: Get.width * 0.91,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assistant,
                        size: 35,
                      ),
                      Text(
                        "Reclamation",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                onPressed: () {
                  Get.to(AnnoncesList());
                },
                child: Container(
                  height: Get.height * 0.09,
                  width: Get.width * 0.91,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list_alt,
                        size: 35,
                      ),
                      Text(
                        "Annonces",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
