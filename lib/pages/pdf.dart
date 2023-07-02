
import 'dart:async';

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';
import 'package:reclamations/utils/apis.dart';

class PDFScreen extends StatefulWidget{

  @override
  State createState() =>PDFScreenS();
}

class PDFScreenS extends State<PDFScreen>{


  late PdfController controller ;
  @override
  void initState() {
    super.initState();
    print(Get.arguments["pdfFile"]);
    print(Get.arguments);
    print("url to file : "+AppApis.baseUrl+AppApis.getAnnonceFile+Get.arguments["_id"]);
    controller = PdfController(document: PdfDocument.openData(InternetFile.get(AppApis.baseUrl+AppApis.getAnnonceFile+Get.arguments["_id"])) );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text(
          Get.arguments["title"]
        ),),
      ),
      body: Center(
        child: PdfView(controller: controller,),
      ),
    );
  }


}