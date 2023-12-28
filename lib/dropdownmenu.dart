import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<StatefulWidget> createState() => _DropDownMenuState();
}

List<String> list = [
  "Nepalese Rupee ",
  "Indian Rupee",
  "Chineese Yuan",
  "Bhutanese Ngultrum"
];

class _DropDownMenuState extends State {
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
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()),
    );
  }
}
