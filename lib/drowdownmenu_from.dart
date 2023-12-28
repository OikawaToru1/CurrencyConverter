import 'package:flutter/material.dart';

class DropDownMenuFrom extends StatefulWidget {
  const DropDownMenuFrom({super.key});

  @override
  State<StatefulWidget> createState() => _DropDownMenuFromState();
}

List<String> list = [
  "Nepalese Rupee ",
  "Indian Rupee",
  "Chineese Yuan",
  "Bhutanese Ngultrum"
];

var From;

class _DropDownMenuFromState extends State {
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
              From = dropdownvalue;
              print("From : ${From}");
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()),
    );
  }
}
