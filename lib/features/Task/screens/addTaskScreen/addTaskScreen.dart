import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/commonds.dart';
import 'package:to_do_app/core/utils/App_strings.dart';
import 'package:to_do_app/core/widgeths/custom_elevated_button.dart';
import 'package:to_do_app/core/widgeths/custom_text_form_field.dart';
import 'package:to_do_app/features/Task/data/models/Task_Model.dart';
import 'package:to_do_app/features/Task/screens/home.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_cubit.dart';
import 'package:to_do_app/features/auth/presention/cubit/task_state.dart';

import '../../../../core/utils/App_colors.dart';

class addTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.screen2Title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 32,
                ),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () {
              navigate(context: context, screen: const HomeScreen());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<TaskCubit, TaskState>(
              listener: (context, state) {
                if (state is InsertTaskSucessState) {
                  showToast(message: 'Add Sucess', state: ToastStates.sucess);
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Form(
                  key: BlocProvider.of<TaskCubit>(context).formKey,
                  child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        AppStrings.title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hint: AppStrings.titleHint,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Enter valid Title';
                          }
                          return null;
                        },
                        height: 48,
                        width: double.infinity,
                        controller:
                            BlocProvider.of<TaskCubit>(context).titleController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppStrings.note,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        hint: AppStrings.noteHint,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return 'Enter valid Note';
                          }
                          return null;
                        },
                        height: 48,
                        width: double.infinity,
                        controller:
                            BlocProvider.of<TaskCubit>(context).noteController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        AppStrings.date,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                        readOnly: true,
                        hint: DateFormat.yMd()
                            .format(BlocProvider.of<TaskCubit>(context).current)
                            .toString(),
                        height: 48,
                        width: double.infinity,
                        suffixIcon: Icons.calendar_month_outlined,
                        onPressed: () async {
                          BlocProvider.of<TaskCubit>(context).getDate(context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.startTime,
                                textAlign: TextAlign.start,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomTextFormField(
                                readOnly: true,
                                hint: BlocProvider.of<TaskCubit>(context)
                                    .startTime,
                                height: 48,
                                width: 170,
                                suffixIcon: Icons.timer_outlined,
                                onPressed: () async {
                                  BlocProvider.of<TaskCubit>(context)
                                      .getStart(context);
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.endTime,
                                // textAlign: TextAlign.start,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CustomTextFormField(
                                  readOnly: true,
                                  hint: BlocProvider.of<TaskCubit>(context)
                                      .endTime,
                                  height: 48,
                                  width: 170,
                                  suffixIcon: Icons.timer_outlined,
                                  onPressed: () async {
                                    BlocProvider.of<TaskCubit>(context)
                                        .getEnd(context);
                                  }),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        AppStrings.color,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 70,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<TaskCubit>(context)
                                    .ChangeCheckMarkIndex(index);
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    BlocProvider.of<TaskCubit>(context)
                                        .getColor(index),
                                child: index ==
                                        BlocProvider.of<TaskCubit>(context)
                                            .currIndex
                                    ? const Icon(Icons.check)
                                    : null,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(
                        height: 95,
                      ),
                      state is InsertTaskLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primarycolor,
                              ),
                            )
                          : CustomElevatedButton(
                              text: AppStrings.create,
                              onPressed: () {
                                if (BlocProvider.of<TaskCubit>(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  BlocProvider.of<TaskCubit>(context)
                                      .insertTask();
                                }
                              },
                              height: 48,
                              width: double.infinity),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
