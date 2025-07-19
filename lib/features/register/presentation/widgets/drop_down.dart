import 'package:flutter/material.dart';

class DropDownItem<T> {
  final String label;
  final T value;

  DropDownItem({required this.label, required this.value});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownItem<T> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

class DropDown<T> extends StatefulWidget {
  const DropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
  });

  final List<DropDownItem<T>> items;
  final String? hint;
  final void Function(T value) onChanged;

  @override
  State<DropDown<T>> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  DropDownItem<T>? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<DropDownItem<T>>(
      isExpanded: true,
      underline: const SizedBox(),
      value: selectedItem,
      hint: widget.hint != null ? Text(widget.hint!) : null,
      items: widget.items.map((item) {
        return DropdownMenuItem<DropDownItem<T>>(
          value: item,
          child: Text(item.label),
        );
      }).toList(),
      onChanged: (DropDownItem<T>? item) {
        if (item == null) return;
        setState(() {
          selectedItem = item;
        });
        widget.onChanged(item.value);
      },
    );
  }
}
