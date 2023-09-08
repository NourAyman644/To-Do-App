import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.height,
      required this.width});

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}
