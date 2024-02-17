import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;

  const HeightWidget({required this.onChange, Key? key}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  RxInt height_ = 150.obs; // Declare height_ here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            const Text(
              "Height",
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                      height_.value.toString(),
                      style: const TextStyle(fontSize: 40),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "cm",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                )
              ],
            ),
            Slider(
              min: 0,
              max: 240,
              value: height_.value.toDouble(),
              thumbColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  height_.value = value.toInt();
                  widget.onChange(height_.value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
