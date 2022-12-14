import 'package:flutter/material.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/pages/Login/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: colPrimaryBase,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
