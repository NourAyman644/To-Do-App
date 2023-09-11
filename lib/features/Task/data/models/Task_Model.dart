class TaskModel {
  final String id;
  final String StartTime;

  final String endTime;
  final String title;
  final String note;
  final bool isCompleted;
  final int color;

  TaskModel(
      {required this.id,
      required this.StartTime,
      required this.endTime,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.color});

  static List<TaskModel> tasklist = [
    TaskModel(
        id: '1',
        StartTime: '4:00 pm',
        endTime: '7:00 pm ',
        title: 'flutter',
        note: 'Dart learing',
        isCompleted: true,
        color: 5),
    TaskModel(
        id: '2',
        StartTime: '9:00 pm',
        endTime: '10:00 pm ',
        title: 'Node Js',
        note: 'JavaScript learing',
        isCompleted: true,
        color: 4)
  ];
}
//dummy data
