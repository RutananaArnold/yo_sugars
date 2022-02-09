// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:yo_sugars/components/RoundedInputField.dart';
import 'dart:math' as math;
import 'package:another_flushbar/flushbar.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final heightController = TextEditingController();
  final weight = TextEditingController();

  calcBMI() {
    double result = (double.parse(weight.text) /
        math.pow(double.parse(heightController.text), 1 / 2));
    if (result > 18.5 || result < 25) {
      return Text(result.toString() + "\n" + "\n" + "Your weight is normal");
    } else if (result < 18.5) {
      return Text(result.toString() + "\n" + "\n" + "You are underweight");
    } else {
      return const Text("You are obese");
    }
  }

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("BMI results"),
            content: StatefulBuilder(builder: (context, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    calcBMI(),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("BMI calculation"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage("assets/scale.jpeg"),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter your height and weight to calculate your BMI",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.orange,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedInputField(
                  hintText: "Enter height" + "(meters)",
                  icon: Icons.height,
                  field: heightController,
                  keyboard: TextInputType.number,
                  fcolor: Colors.orange,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedInputField(
                  hintText: "Enter Weight" + "(Kg)",
                  icon: Icons.bedroom_baby,
                  field: weight,
                  keyboard: TextInputType.number,
                  fcolor: Colors.orange,
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (heightController == null || weight == null) {
                        await Flushbar(
                          message: "Empty field\s found!",
                          icon: const Icon(Icons.info_outline,
                              size: 25.0, color: Colors.red),
                          duration: const Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.red,
                        ).show(context);
                      } else if (heightController != null || weight != null) {
                        createAlert(context);
                        print("yes");
                      }
                      // else if (heightController != null || weight != null) {
                      //   double result = (double.parse(weight.text) /
                      //       math.pow(
                      //           double.parse(heightController.text), 1 / 2));
                      //   if (result > 25) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             duration: Duration(seconds: 5),
                      //             behavior: SnackBarBehavior.floating,
                      //             content: Text("To reduce weight: " +
                      //                 "\n" +
                      //                 " Please do alot of exercises")));
                      //   } else if (result < 18.5) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             duration: Duration(seconds: 5),
                      //             behavior: SnackBarBehavior.floating,
                      //             content: Text("To gain weight: " +
                      //                 "\n" +
                      //                 " Please eat lots of carbohydrates")));
                      //   } else if (result > 18.5 && result < 25) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             duration: Duration(seconds: 5),
                      //             behavior: SnackBarBehavior.floating,
                      //             content: Text("To maintain weight: " +
                      //                 "\n" +
                      //                 " Please drink lots of water")));
                      //   }
                      // }
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
