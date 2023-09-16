import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/App_colors.dart';

import '../../features/auth/presention/cubit/task_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.height,
    required this.width,
    this.suffixIcon, // Make suffixIcon parameter optional
    this.onPressed,
    this.controller,
    this.readOnly = false,
    this.valid, // Make onPressed parameter optional
  }) : super(key: key);

  final String hint;
  final double height;
  final double width;
  final IconData? suffixIcon; // Make suffixIcon nullable
  final VoidCallback? onPressed; // Make onPressed nullable
  final TextEditingController? controller;
  final bool readOnly;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          //  fillColor: AppColors.backColor,
          //  filled: true,
          suffixIcon: suffixIcon != null // Check if suffixIcon is provided
              ? IconButton(
                  icon: Icon(
                    suffixIcon!,
                    color: BlocProvider.of<TaskCubit>(context).isDark
                        ? AppColors.white
                        : AppColors.backColor,
                  ),
                  onPressed: onPressed,
                )
              : null, // Set suffixIcon to null if not provided

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: Theme.of(context).textTheme.displayMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
            ),
          ),
        ),
        validator: valid,
      ),
    );
  }
}
