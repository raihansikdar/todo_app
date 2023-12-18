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
      title: json['title'],
      taskDetails: json['taskDetails'],
      taskProcess: json['taskProcess'],
    );
  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['taskDetails'] = taskDetails;
    data['taskProcess'] = taskProcess;

    return data;
  }

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title,taskDetails: $taskDetails, taskProcess: $taskProcess, }';
  }
}