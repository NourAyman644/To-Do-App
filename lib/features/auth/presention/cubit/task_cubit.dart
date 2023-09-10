import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_state.dart';

import '../../../../core/utils/App_colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime current = DateTime.now();
  String startTime = DateFormat.jm().format(DateTime.now());
  String endTime =
      DateFormat.jm().format(DateTime.now().add(const Duration(minutes: 60)));
  int currIndex = 0;
  void getDate(context) async {
    emit(getDateLoadingState());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      current = pickedDate!;
      emit(getDateSucessState());
    } else {
      print('pickedDate= null');
      emit(getDateErrorState());
    }
  }

  void getStart(context) async {
    emit(getStartTimeLoadingState());
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(current));

    if (startTime != null) {
      startTime = pickedTime!.format(context);
      emit(getStartTimeSucessState());
    } else {
      print(null);
      emit(getStartTimeErrorState());
    }
  }

  void getEnd(context) async {
    emit(getEndTimeLoadingState());
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(current));

    if (endTime != null) {
      endTime = pickedTime!.format(context);
      emit(getEndTimeSucessState());
    } else {
      print(null);
      emit(getEndTimeErrorState());
    }
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.pink;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.color3;
      case 3:
        return AppColors.color4;
      case 4:
        return AppColors.color5;
      case 5:
        return AppColors.color6;
      default:
        return AppColors.primarycolor;
    }
  }

  void ChangeCheckMarkIndex(index) async {
    currIndex = index;
    emit(ChangeCheckMarkIndexState());
  }
}