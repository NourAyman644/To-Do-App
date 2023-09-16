import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/commonds.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/core/utils/App_colors.dart';
import 'package:to_do_app/core/utils/App_strings.dart';
import 'package:to_do_app/core/widgeths/task_component.dart';
import 'package:to_do_app/features/Task/screens/addTaskScreen/addTaskScreen.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_cubit.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_state.dart';

import '../../../core/widgeths/custom_elevated_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat.yMMMd().format(DateTime.now()),
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 24.sp,
                                ),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<TaskCubit>(context).ChangeTheme();
                        },
                        icon: const Icon(Icons.mode_night),
                        color: BlocProvider.of<TaskCubit>(context).isDark
                            ? AppColors.white
                            : AppColors.backColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Text(
                    AppStrings.today,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 24.sp,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  DatePicker(DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      height: 94.h,
                      selectionColor: AppColors.selectedColor,
                      selectedTextColor: AppColors.white,
                      dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                      monthTextStyle:
                          Theme.of(context).textTheme.displayMedium!,
                      dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                      onDateChange: (date) {
                    BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                  }),

                  SizedBox(
                    height: 24.h,
                  ),
                  BlocProvider.of<TaskCubit>(context).taskList.isEmpty
                      ? noTasks(context: context)
                      : Expanded(
                          child: ListView.separated(
                            itemCount: BlocProvider.of<TaskCubit>(context)
                                .taskList
                                .length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: TaskComponent(
                                  TaskColor: AppColors.pink,
                                  taskmodel: BlocProvider.of<TaskCubit>(context)
                                      .taskList[index],
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          color: AppColors.sheetColor,
                                          width: double.infinity,
                                          height: 240.h,
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BlocProvider.of<TaskCubit>(
                                                              context)
                                                          .taskList[index]
                                                          .isCompleted ==
                                                      1
                                                  ? Container()
                                                  : CustomElevatedButton(
                                                      text: AppStrings.complete,
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    TaskCubit>(
                                                                context)
                                                            .updateTask(BlocProvider
                                                                    .of<TaskCubit>(
                                                                        context)
                                                                .taskList[index]
                                                                .id);
                                                        Navigator.pop(context);
                                                      },
                                                      height: 48.h,
                                                      width: 327.w,
                                                    ),
                                              CustomElevatedButton(
                                                text: AppStrings.delete,
                                                onPressed: () {
                                                  BlocProvider.of<TaskCubit>(
                                                          context)
                                                      .deleteTask(BlocProvider
                                                              .of<TaskCubit>(
                                                                  context)
                                                          .taskList[index]
                                                          .id);
                                                  Navigator.pop(context);
                                                },
                                                height: 48.h,
                                                width: 327.w,
                                                color: AppColors.delColor,
                                              ),
                                              CustomElevatedButton(
                                                text: AppStrings.cancal,
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                height: 48.h,
                                                width: 327.w,
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20.h,
                            ),
                          ),
                        ),
                  // TaskComponent(TaskColor: AppColors.color4),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              navigate(context: context, screen: addTaskScreen());
            },
            backgroundColor: AppColors.primarycolor,
            child: const Icon(
              CupertinoIcons.plus,
            ),
          ),
        ),
      ),
    );
  }
}

Column noTasks({required BuildContext context}) {
  return Column(
    //  mainAxisAlignment: MainAxisAlignment.center,
    //crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(AppAssets.Path5),
      SizedBox(
        height: 10.h,
      ),
      Text(
        AppStrings.screen1Title,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 20.sp,
            ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        AppStrings.screen1SubTitle,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 16.sp,
            ),
      ),
    ],
  );
}
