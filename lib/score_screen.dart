import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController {
  late final double bmiScore;
  late final int age;

  late final String? bmiStatus;
  late final String? bmiInterpretation;
  late final Color? bmiStatusColor;

  @override
  void onInit() {
    bmiScore = Get.arguments['bmiScore'];
    age = Get.arguments['age'];
    setBmiInterpretation();
    super.onInit();
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}

class ScoreScreen extends StatelessWidget {
  final ScoreController controller = Get.put(ScoreController());

  ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Card(
          elevation: 12,
          shape: const RoundedRectangleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Score",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.bmiScore.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.bmiStatus!,
                style:
                    TextStyle(fontSize: 20, color: controller.bmiStatusColor!),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.bmiInterpretation!,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Re-calculate"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
