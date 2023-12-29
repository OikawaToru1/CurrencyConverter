import 'package:flutter/material.dart';

class DropDownMenuTo extends StatefulWidget {
  const DropDownMenuTo({super.key});

  @override
  State<StatefulWidget> createState() => _DropDownMenuToState();
}

List<String> list = [
  "Select",
  "United States Dollar",
  "Nepalese Rupee",
  "Indian Rupee",
  "Chineese Yuan",
  "Bhutanese Ngultrum",
  "AED"
];
// ignore: prefer_typing_uninitialized_variables
var to;

class _DropDownMenuToState extends State {
  String? dropdownvalue = list.first;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DropdownMenu(
          width: 200,
          menuHeight: 120,
          initialSelection: list.first,
          onSelected: (String? value) {
            setState(() {
              dropdownvalue = value;
              to = dropdownvalue;
              togetter();
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()),
    );
  }
}

String? togetter() {
  return to;
}
