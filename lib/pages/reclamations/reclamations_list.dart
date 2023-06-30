import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/reclamations/ajouter_reclamation.dart';
import 'package:reclamations/pages/reclamations/reclamation_item.dart';
import 'package:reclamations/pages/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/reclamation_controller.dart';

class ReclamationList extends StatefulWidget{
  @override
  State<ReclamationList> createState() =>ReclamationListS();

}

class ReclamationListS extends State<ReclamationList>{


  late ReclamationController controller;


  @override
  void initState() {
    controller = Get.put(ReclamationController());
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title:  Text("reclamation List"),
      actions: [
        IconButton(onPressed: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Get.offAll(()=>SplashScreen());
        } , icon: Icon(Icons.logout),)
        ],
      ),
   /*   floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(()=>AjouterReclamation());
        },
      ),*/
      body: Container(
        child: Obx(
          ()=>controller.isLoading.value?
              Center(child: CircularProgressIndicator())
              :
             ListView.builder(
                itemCount: controller.reclamationsList.value.length,
                itemBuilder: (c, i)=>   ReclamationItem(reclamation:controller.reclamationsList.value.elementAt(i),)
                )
        ),
      ),
    );
  }
}