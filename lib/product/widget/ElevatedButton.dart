import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.primary,
      required this.height,
      required this.style})
      : super(key: key);
  final void Function()? onPressed;
  final String text;
  final Color primary;
  final double height;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primary, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
