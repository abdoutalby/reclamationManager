import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reclamations/pages/login_page.dart';

import '../controllers/register_controller.dart';
import '../utils/colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageS();
}

class _RegisterPageS extends State<RegisterPage> {
  late RegisterController controller;
  //controllers
  @override
  void initState() {
    controller = Get.put(RegisterController());
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
                "S'inscrire",
                style: TextStyle(fontSize: 25),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.name,
                      decoration: InputDecoration(
                         hintText: "nom",

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
                        controller: controller.lastname,
                        decoration: InputDecoration(


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
                            hintText: 'prenom')),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: controller.adresse,
                        decoration: InputDecoration(


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
                            hintText: 'adresse')),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: controller.tel,
                        decoration: InputDecoration(


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
                            hintText: 'téléphone')),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(


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
                            hintText: 'email')),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(


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
                              : () => {controller.register()},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.ACCENT_COLOR)),
                          child: Center(
                            child: controller.isLoading.value
                                ? CircularProgressIndicator(
                                    color: AppColors.BLACK,
                                  )
                                : Text(
                                    "s'inscrire",
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
                    'vous avez déjà un compte ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => LoginPage());
                    },
                    child: const Text(
                      'connecter',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
