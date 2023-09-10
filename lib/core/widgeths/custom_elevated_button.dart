import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/App_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
    this.color = AppColors.primarycolor,
  });

  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                backgroundColor: MaterialStatePropertyAll(color),
              ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          )),
    );
  }
}
