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
  convert(String? current, String? next) {
    String? currentCurrency = current;
    String? convetedCurrency = next;

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

  void swap() {
    String? newcurrent = togetter();
    String? newnext = fromgetter();
    setState(() {
      convert(newcurrent, newnext);
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
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DropDownMenuFrom(),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      swap();
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
                convert(fromgetter(), togetter());
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white70),
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
