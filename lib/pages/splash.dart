import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:reclamations/pages/login_page.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>SplashScreenS();

}

class SplashScreenS extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                width: Get.width*0.4,
                height: Get.height * 0.2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all( Colors.blueGrey),
                    elevation: MaterialStateProperty.all(2)
                  ),
                    onPressed: (){
                  Get.to(()=>LoginPage() , arguments: "citoyen");
                }, child:const Text(
                    "Citoyen",
                  style: TextStyle(fontSize: 25),
                )),
              ),
              Container(
                width: Get.width*0.4,
                height: Get.height * 0.2,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all( Colors.greenAccent),
                        elevation: MaterialStateProperty.all(2)
                    ),
                    onPressed: (){
                  Get.to(()=>LoginPage() , arguments: "agent");
                }, child:Text(
                    "Agent",
                  style: TextStyle(fontSize: 25),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}