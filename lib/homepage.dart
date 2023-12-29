import 'package:currency_converter_advanced/dropdownmenu_to.dart';
import './drowdownmenu_from.dart';
import 'package:flutter/material.dart';

double from = 0, to = 0, result = 0;
Map<String, double> currency = {
  "United States Dollar": 1,
  "Nepalese Rupee": 133.16,
  "Indian Rupee": 83.15,
  "Chineese Yuan": 7.05,
  "Bhutanese Ngultrum": 83.62,
  "AED": 3.67
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();
  convert() {
    String? currentCurrency = fromgetter();
    String? convetedCurrency = togetter();

    currency.forEach((key, value) {
      if (key == currentCurrency) {
        from = value;
      }
      if (key == convetedCurrency) {
        to = value;
      }
    });
    double rate = to / from;

    result = double.parse(textEditingController.text) * rate;
    setState(() {
      result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pixRatio = MediaQuery.of(context).devicePixelRatio;
    double screenWidth = MediaQuery.of(context).size.width * pixRatio;
    double center = screenWidth / 2;
    togetter();
    fromgetter();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Currency Converter App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            fontStyle: FontStyle.normal,
            color: Colors.blueGrey.shade100,
          ),
        ),
        elevation: 8,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              result != 0
                  ? result.toStringAsFixed(2)
                  : result.toStringAsFixed(0),
            ),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: EdgeInsets.only(left: center / 1.7),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const DropDownMenuFrom(),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      print("exchange button");
                    },
                    icon: const Icon(Icons.swap_horiz_sharp),
                    iconSize: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const DropDownMenuTo(),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 400, end: 400, bottom: 40, top: 40),
                child: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                      hintText: "Enter the amount",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                )),
            TextButton(
              onPressed: () {
                convert();
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                elevation: MaterialStatePropertyAll(10),
                minimumSize: MaterialStatePropertyAll(
                  Size(200, 50),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
