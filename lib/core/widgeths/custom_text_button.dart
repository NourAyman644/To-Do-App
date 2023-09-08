import 'package:flutter/material.dart';

import '../utils/App_colors.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({Key? key, required this.text, required this.Onpressed});
  final String text;
  final VoidCallback Onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: Onpressed,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: AppColors.white.withOpacity(0.44)),
      ),
    );
  }
}
