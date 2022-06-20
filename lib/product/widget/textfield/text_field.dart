import 'package:flutter/material.dart';
import 'package:flutter_booking_application/core/constants/textstyles/textstyles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.focusNode,
      required this.textInputType,
      this.isFocus = false,
      required this.hintText,
      required this.labelText,
      this.controller})
      : super(key: key);
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final bool isFocus;
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      autofocus: isFocus, // otomatik  focus atıyor
      autofillHints: const [AutofillHints.email],
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: TextStyles.labelText,
        ),
        hintText: hintText,
      ),
    );
  }
}
