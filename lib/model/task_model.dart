class TaskModel{
  final int? id;
  final String? title;
  final String? taskDetails;
  final String? taskProcess;


  TaskModel({
    this.id,
    this.title,
    this.taskDetails,
    this.taskProcess,
  });
  factory TaskModel.fromJson(Map<String,dynamic>json){
    return TaskModel(
      id: json['id'],
      title: json['date'],
      taskDetails: json['title'],
      taskProcess: json['note'],
    );
  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id;
    data['date'] = title;
    data['title'] = taskDetails;
    data['note'] = taskProcess;

    return data;
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, date: $title,title: $taskDetails, note: $taskProcess, }';
  }
}