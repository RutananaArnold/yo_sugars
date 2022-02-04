import 'package:flutter/material.dart';
import 'package:yo_sugars/components/TabLabel.dart';

class FoodCheck extends StatefulWidget {
  const FoodCheck({Key? key}) : super(key: key);

  @override
  _FoodCheckState createState() => _FoodCheckState();
}

class _FoodCheckState extends State<FoodCheck> {
  String selectedItem01 = "Bread";
  List<String> breakfastItems = ["Bread", "Milk", "Casava"];
  String selectedItem02 = "Posho";
  List<String> lunchItems = ["Posho", "beans", "Peas"];
  String selectedItem03 = "Meat";
  List<String> supperItems = ["Meat", "Matooke", "Maize"];

  calcBreakfast() {
    if (selectedItem01 == "Bread") {
      return Text(
        "You have chosen ${selectedItem01} :" + "\n" + "10g of Iron",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem01 == "Milk") {
      return Text(
        "You have chosen ${selectedItem01} :" + "\n" + "No iron consumed",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem01 == "Casava") {
      return Text(
        "You have chosen ${selectedItem01} :" + "\n" + "5g of proteins",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  calcLunch() {
    if (selectedItem02 == "Posho") {
      return Text(
        "You have chosen ${selectedItem02} :" + "\n" + "10g of calcium",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem02 == "beans") {
      return Text(
        "You have chosen ${selectedItem02} :" + "\n" + "50g of proteins",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem02 == "Peas") {
      return Text(
        "You have chosen ${selectedItem02} :" + "\n" + "3g of Carbohydrates",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  calcSupper() {
    if (selectedItem03 == "Meat") {
      return Text(
        "You have chosen ${selectedItem03} :" +
            "\n" +
            "10g of iron and 5g of fats",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem03 == "Matooke") {
      return Text(
        "You have chosen ${selectedItem03} :" + "\n" + "50g of Carbohydrates",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (selectedItem03 == "Maize") {
      return Text(
        "You have chosen ${selectedItem03} :" +
            "\n" +
            "3g of proteins and 5g of carbohydrates",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Calculation session"),
            content: StatefulBuilder(builder: (context, _) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "BreakFast nutrients",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    calcBreakfast(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Lunch Nutrients",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    calcLunch(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Supper Nutients",
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                    calcSupper(),
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
      appBar: AppBar(
        title: const Text("Kinds of Food"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage("assets/food2.jpg"),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const TabLabel(
                label: "Select the kinds of food!",
                align: Alignment.center,
                color: Colors.white,
              ),
              const SizedBox(
                height: 8,
              ),
              const TabLabel(
                label: "Breakfast",
                align: Alignment.center,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Item *",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: selectedItem01,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      hint: const Text(
                        "Select Any Of the food Items",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      iconSize: 24,
                      elevation: 10,
                      style: const TextStyle(
                        color: Colors.orange,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedItem01 = value!;
                        });
                      },
                      items: breakfastItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TabLabel(
                label: "Lunch",
                align: Alignment.center,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose food Item *",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: selectedItem02,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      hint: const Text(
                        "Select Any Of the food Items",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      iconSize: 24,
                      elevation: 10,
                      style: const TextStyle(color: Colors.orange),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedItem02 = value!;
                        });
                      },
                      items: lunchItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TabLabel(
                label: "Supper",
                align: Alignment.center,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 5, 2, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Food Item *",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    DropdownButton<String>(
                      value: selectedItem03,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      hint: const Text(
                        "Select Any Of the Food Items",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      iconSize: 24,
                      elevation: 10,
                      style: const TextStyle(color: Colors.orange),
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedItem03 = value!;
                        });
                      },
                      items: supperItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    createAlert(context);
                  },
                  child: const Text("Submit for Check"))
            ],
          ),
        ),
      ),
    );
  }
}

