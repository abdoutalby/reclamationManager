import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/ajouter_opinion_controller.dart';

import '../../utils/colors.dart';

class AjouterOpinion extends StatefulWidget {
  @override
  State<AjouterOpinion> createState() => AjouterOpinionS();
}
class AjouterOpinionS extends State<AjouterOpinion>{
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
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: ()=>Get.back(),),
      ),
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
             Image.network("https://picsum.photos/200" ,
             height: Get.height*0.4,
               width: Get.width*0.7,
             ) ,

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text( "ajouter opinion ",

                ),
              ),
            Padding(padding: EdgeInsets.all(20),
              child: DropdownButton(
                value: "category",
                items: const [
                    DropdownMenuItem(child: Text("category"),
                      value: "category",
                    ),
                    DropdownMenuItem(child: Text("santer"),
                      value: "santer",
                    ),
                    DropdownMenuItem(child: Text("kayes") ,
                      value: "kayes",
                    ),
                    DropdownMenuItem(child: Text("transport") ,
                      value: "transport",),
              ], onChanged:  (value) =>controller.category = value.toString(),

              ),
            )
,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller.opinion,
                decoration: InputDecoration(

                  hintText: "please write your opinion",
                  fillColor: AppColors.WHITE,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(color: AppColors.TEXT_COLOR)),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: (){}, child: Text("save")),
            )
        ]),
    );
  }
}



