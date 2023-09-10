import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/common/commonds.dart';
import 'package:to_do_app/core/utils/App_strings.dart';
import 'package:to_do_app/core/widgeths/custom_elevated_button.dart';
import 'package:to_do_app/core/widgeths/custom_text_form_field.dart';
import 'package:to_do_app/features/Task/screens/home.dart';

import '../../../../core/utils/App_colors.dart';

class addTaskScreen extends StatefulWidget {
  addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  late TextEditingController titleController = TextEditingController();

  late TextEditingController noteController = TextEditingController();

  DateTime current = DateTime.now();
  String startTime = DateFormat.jm().format(DateTime.now());
  String endTime =
      DateFormat.jm().format(DateTime.now().add(const Duration(minutes: 60)));
  int currIndex = 0;

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
                  height: 48,
                  width: double.infinity,
                  controller: titleController,
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
                  height: 48,
                  width: double.infinity,
                  controller: noteController,
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
                  hint: DateFormat.yMd().format(current).toString(),
                  height: 48,
                  width: double.infinity,
                  suffixIcon: Icons.calendar_month_outlined,
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      current = pickedDate!;
                    });
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
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          readOnly: true,
                          hint: startTime,
                          height: 48,
                          width: 170,
                          suffixIcon: Icons.timer_outlined,
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(current));
                            setState(() {
                              if (startTime != null)
                                startTime = pickedTime!.format(context);
                              else
                                print(null);
                            });
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
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            readOnly: true,
                            hint: endTime,
                            height: 48,
                            width: 170,
                            suffixIcon: Icons.timer_outlined,
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(current));
                              setState(() {
                                if (endTime != null)
                                  endTime = pickedTime!.format(context);
                                else
                                  print(null);
                              });
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

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: getColor(index),
                          child: index == currIndex
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
                CustomElevatedButton(
                    text: AppStrings.create,
                    onPressed: () {},
                    height: 48,
                    width: double.infinity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
