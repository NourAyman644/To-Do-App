abstract class TaskState {}

class TaskInitial extends TaskState {}

class getDateLoadingState extends TaskState {}

class getDateSucessState extends TaskState {}

class getDateErrorState extends TaskState {}

class getStartTimeLoadingState extends TaskState {}

class getStartTimeSucessState extends TaskState {}

class getStartTimeErrorState extends TaskState {}

class getEndTimeLoadingState extends TaskState {}

class getEndTimeSucessState extends TaskState {}

class getEndTimeErrorState extends TaskState {}

class ChangeCheckMarkIndexState extends TaskState {}

class InsertTaskLoadingState extends TaskState {}

class InsertTaskSucessState extends TaskState {}

class InsertTaskErrorState extends TaskState {}
