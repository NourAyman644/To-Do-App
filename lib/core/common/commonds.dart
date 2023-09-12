import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/core/utils/App_colors.dart';

void navigate({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void replace({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

void showToast({required String message, required ToastStates state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { error, sucess, warinings }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColors.red;
    case ToastStates.sucess:
      return AppColors.green;
    case ToastStates.warinings:
      return AppColors.orange;
  }
}
