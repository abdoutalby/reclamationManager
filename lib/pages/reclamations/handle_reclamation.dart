import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HandleReclamationPage extends StatefulWidget{
  @override
  State<HandleReclamationPage> createState()  =>HandleReclamationPageS();

}

class HandleReclamationPageS  extends State<HandleReclamationPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("handle Reclamation "),
       leading: IconButton(icon: Icon(Icons.arrow_back) , onPressed: ()=>Get.back(),),
       ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
        ClipRect(
          clipBehavior: Clip.hardEdge,
            child: Image.network(
                "https://picsum.photos/200",
                width: Get.width,
              height: Get.height*0.4,
             )),
        Text("${Get.arguments}"),
        Text("manicupilite"),
        Text("adress rue foulenin "),
        Text("category "),
        ElevatedButton(onPressed: (){}, child: Text("add an image"))
      
      ]),
    );
  }
}