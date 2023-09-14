class TaskModel {
  final int? id;
  final String startTime;
  final String endTime;
  final String title;
  final String note;
  final int isCompleted;
  final int color;
  final String date;

  TaskModel(
      {required this.date,
      this.id,
      required this.startTime,
      required this.endTime,
      required this.title,
      required this.note,
      required this.isCompleted,
      required this.color});

  factory TaskModel.fromJson(Map<String, dynamic> jsonData) {
    return TaskModel(
      id: jsonData['id'] as int?,
      date: jsonData['date'] as String? ??
          '', // Provide a default value of an empty string
      startTime: jsonData['startTime'] as String? ??
          '', // Provide a default value of an empty string
      endTime: jsonData['endTime'] as String? ??
          '', // Provide a default value of an empty string
      title: jsonData['title'] as String? ??
          '', // Provide a default value of an empty string
      note: jsonData['note'] as String? ??
          '', // Provide a default value of an empty string
      isCompleted: jsonData['isCompleted'] as int? ??
          0, // Provide a default value (e.g., 0)
      color:
          jsonData['color'] as int? ?? 0, // Provide a default value (e.g., 0)
    );
  }
}
//dummy data
