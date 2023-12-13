import 'package:flutter/material.dart';
import 'package:montra_app_a1/utils/enums.dart';

class CategoryDropDown extends StatefulWidget {
  final List<CategoryEnum> list;
  final Function(CategoryEnum) onChanged;

  const CategoryDropDown(
      {super.key, required this.list, required this.onChanged});

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  late CategoryEnum dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFF1F1FA))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          DropdownButton<CategoryEnum>(
            value: dropdownValue,
            icon: const SizedBox.shrink(),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: const SizedBox.shrink(),
            onChanged: (CategoryEnum? value) {
              widget.onChanged(value!);
              setState(() {

                dropdownValue = value;
              });
            },
            items: widget.list
                .map<DropdownMenuItem<CategoryEnum>>((CategoryEnum value) {
              return DropdownMenuItem<CategoryEnum>(
                value: value,
                child: Text(value.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
