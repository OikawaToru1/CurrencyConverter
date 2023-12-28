import 'package:currency_converter_advanced/dropdownmenu.dart';
import 'package:flutter/material.dart';

double from = 0, to = 0;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 90,
            ),
            const Text("Result"),
            const SizedBox(
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 300),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text("From"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  DropDownMenu(),
                  SizedBox(
                    width: 50,
                  ),
                  Column(children: [
                    Icon(Icons.arrow_forward),
                    Icon(Icons.arrow_back),
                  ]),
                  SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 50,
                    child: Text("To"),
                  ),
                  DropDownMenu()
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 400, end: 400, bottom: 40, top: 40),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the amount",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                )),
            TextButton(
              onPressed: () {
                print("Clicked");
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
              child: const Text("CLick me"),
            ),
          ],
        ),
      ),
    );
  }
}
