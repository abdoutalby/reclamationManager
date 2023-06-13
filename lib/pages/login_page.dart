import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/controllers/login_controller.dart';
import 'package:reclamations/pages/home.dart';
import 'package:reclamations/pages/reclamations/reclamations_list.dart';
import 'package:reclamations/pages/register_page.dart';

import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;
  //controllers
  @override
  void initState() {
    controller = Get.put(LoginController());
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // SvgPicture.asset(
              //   'login.svg',
              //   height: 200,
              // ),
              const SizedBox(
                height: 65,
              ),
              Text(
                "Reclamations",
               ),
              Text(
                "Pour le rendre meilleure",
               ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        prefix: const Icon(Icons.person),
                        prefixIconColor: AppColors.WHITE,
                        hintText: "Email",
                        fillColor: AppColors.WHITE,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: AppColors.SECONDARY_COLOR),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                            BorderSide(color: AppColors.TEXT_COLOR)),
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                        controller:
                        controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefix: Icon(Icons.lock),
                            fillColor: AppColors.WHITE,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.SECONDARY_COLOR),
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                BorderSide(color: AppColors.TEXT_COLOR)),
                            filled: true,
                            hintText: 'mot de passe')),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: Obx(
                            () => OutlinedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => {
                            Get.to(HomePage())
                            //controller.Login()},
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.ACCENT_COLOR)),
                          child: Center(
                            child: controller.isLoading.value
                                ? CircularProgressIndicator(
                              color: AppColors.BLACK,
                            )
                                : Text(
                              "se connecter",
                              style: TextStyle(color: AppColors.WHITE),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "vous n'avez pas du compte ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterPage());
                    },
                    child: const Text(
                      ' nous rejoindre',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

}