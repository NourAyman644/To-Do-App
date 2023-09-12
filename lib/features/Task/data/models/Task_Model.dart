class TaskModel {
  final String id;
  final String StartTime;

  final String endTime;
  final String title;
  final String note;
  final bool isCompleted;
  final int color;
  final String Date;

  TaskModel(
      {required this.id,
      required this.Date,
      required this.StartTime,
      required this.endTime,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.color});
}
//dummy data
