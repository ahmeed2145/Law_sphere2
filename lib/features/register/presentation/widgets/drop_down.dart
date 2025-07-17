import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key, required this.item, this.hint});
  final List<String> item;
   final  String? hint;
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
       underline: SizedBox(),

      value: selectedValue,
      hint:widget.hint != null ? Text(widget.hint!) : null,
items: widget.item
    .map(
      (value) => DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      ),
    )
    .toList(),      onChanged: (Object? value) {
        setState(() {
          selectedValue = value as String ;
        });
      },
    );
  }
}
