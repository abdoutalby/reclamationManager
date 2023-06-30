import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/opinion_controller.dart';


class OpinionItem extends StatelessWidget {
  var opinion;
  OpinionItem({super.key, required this.opinion});
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                        Container(
                          width: Get.width*0.8,
                          child: Center(
                            child: Text("${opinion["opinion"]}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                  IconButton(onPressed: (){
                    Get.find<OpinionController>().deleteOpinion(opinion["_id"]);
                  }, icon:Icon(Icons.delete))

  ])
    ));
  }
}
