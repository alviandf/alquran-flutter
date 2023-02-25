import 'package:flutter/material.dart';
import 'package:alquran/app/constant/color.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('IntroductionView'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Al-Quran Apps",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Sesibuk itukah kamu sampai lupa membaca alquran? Jangan sampai lupa membaca yaa!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 250,
                  height: 250,
                  child: Lottie.asset("assets/lotties/animasi-quran.json"),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: Text("Get Started"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
