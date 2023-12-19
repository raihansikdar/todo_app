class TaskModel{
  final int? id;
  final String? title;
  final String? dueDate;
  final String? taskDetails;
  final String? taskProcess;


  TaskModel({
    this.id,
    this.title,
    this.dueDate,
    this.taskDetails,
    this.taskProcess,
  });
  factory TaskModel.fromJson(Map<String,dynamic>json){
    return TaskModel(
      id: json['id'],
      title: json['title'],
      dueDate: json['dueDate'],
      taskDetails: json['taskDetails'],
      taskProcess: json['taskProcess'],
    );
  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['dueDate'] = dueDate;
    data['taskDetails'] = taskDetails;
    data['taskProcess'] = taskProcess;

    return data;
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title,dueDate:$dueDate ,taskDetails: $taskDetails, taskProcess: $taskProcess, }';
  }
}