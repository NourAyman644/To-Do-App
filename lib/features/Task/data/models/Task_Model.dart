class TaskModel {
  final int? id;
  final String startTime;
  final String endTime;
  final String title;
  final String note;
  final int? isCompleted;
  final int color;
  final String date;

  TaskModel(
      {this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.title,
      required this.note,
      this.isCompleted,
      required this.color});

  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'],
      date: jsonData['date'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      title: jsonData['title'],
      note: jsonData['note'],
      isCompleted: jsonData['isCompleted'],
      color: jsonData['color'],
    );
  }
}
