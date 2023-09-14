import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/commonds.dart';
import 'package:to_do_app/core/utils/App_assetes.dart';
import 'package:to_do_app/core/utils/App_colors.dart';
import 'package:to_do_app/core/utils/App_strings.dart';
import 'package:to_do_app/core/widgeths/task_component.dart';
import 'package:to_do_app/features/Task/data/models/Task_Model.dart';
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
          padding: EdgeInsets.all(24.0),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 24,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    AppStrings.today,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 24,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DatePicker(DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      height: 94,
                      selectionColor: AppColors.selectedColor,
                      selectedTextColor: AppColors.white,
                      dateTextStyle: Theme.of(context).textTheme.displayMedium!,
                      monthTextStyle:
                          Theme.of(context).textTheme.displayMedium!,
                      dayTextStyle: Theme.of(context).textTheme.displayMedium!,
                      onDateChange: (date) {
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                  }),

                  const SizedBox(
                    height: 24,
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
                                  showBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          color: AppColors.sheetColor,
                                          width: double.infinity,
                                          height: 240,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CustomElevatedButton(
                                                text: AppStrings.complete,
                                                onPressed: () {},
                                                height: 48,
                                                width: 327,
                                              ),
                                              CustomElevatedButton(
                                                text: AppStrings.delete,
                                                onPressed: () {},
                                                height: 48,
                                                width: 327,
                                                color: AppColors.delColor,
                                              ),
                                              CustomElevatedButton(
                                                text: AppStrings.cancal,
                                                onPressed: () {},
                                                height: 48,
                                                width: 327,
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                          ),
                        ),
                  // TaskComponent(TaskColor: AppColors.color4),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen: addTaskScreen());
          },
          backgroundColor: AppColors.primarycolor,
          child: const Icon(
            CupertinoIcons.plus,
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
      const SizedBox(
        height: 10,
      ),
      Text(
        AppStrings.screen1Title,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 20,
            ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        AppStrings.screen1SubTitle,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 16,
            ),
      ),
    ],
  );
}
