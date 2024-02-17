import 'package:flutter/material.dart';
import 'package:flutter_application_bmi_calculator/age_weight_widget.dart';

import 'package:flutter_application_bmi_calculator/height_widget.dart';
import 'package:flutter_application_bmi_calculator/score_screen.dart';
import 'package:get/get.dart';
import 'dart:math';

class HomeController extends GetxController {
  RxInt gender = 0.obs;
  RxInt height = 150.obs;
  RxInt age = 30.obs;
  RxInt weight = 50.obs;
  RxBool isFinished = false.obs;
  RxDouble bmiScore = 0.0.obs;

  void calculateBmi() {
    bmiScore.value = weight.value / pow(height.value / 100, 2);
  }
}

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                Image.asset(
                  'assets/8549530.jpg',
                  scale: 1.0,
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    controller.height.value = heightVal;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeightWidget(
                        onChange: (ageVal) {
                          controller.age.value = ageVal;
                        },
                        title: "Age",
                        initValue: 30,
                        min: 0,
                        max: 100),
                    AgeWeightWidget(
                        onChange: (weightVal) {
                          controller.weight.value = weightVal;
                        },
                        title: "Weight(Kg)",
                        initValue: 50,
                        min: 0,
                        max: 200)
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.calculateBmi();
                      Get.to(() => ScoreScreen(), arguments: {
                        'bmiScore': controller.bmiScore.value,
                        'age': controller.age.value,
                      });
                    },
                    child: const Text("CALCULATE"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
