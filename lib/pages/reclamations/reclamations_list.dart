import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/reclamations/ajouter_reclamation.dart';
import 'package:reclamations/pages/reclamations/reclamation_item.dart';

class ReclamationList extends StatefulWidget{
  @override
  State<ReclamationList> createState() =>ReclamationListS();

}

class ReclamationListS extends State<ReclamationList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title:  Text("reclamation List")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(()=>AjouterReclamation());
        },
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (c, i)=>   ReclamationItem(reclamation:i.toString(),)
            ),
      ),
    );
  }
}