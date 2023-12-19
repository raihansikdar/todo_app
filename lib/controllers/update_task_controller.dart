import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/database/databaseHelper.dart';
import 'package:todo_app/model/task_model.dart';

class UpdateTaskController extends GetxController{

  bool _isLoading = false;
  TaskModel _taskModel = TaskModel();

  bool get isLoading => _isLoading;
  TaskModel get taskModel => _taskModel;

  Future<bool>updateTask({required int id, required String title,required String dueDate,required String taskDetails,required String taskProcess}) async{
    try{
      _isLoading = true;
      update();
     // _taskModel = TaskModel(title: title, taskDetails: taskDetails,dueDate: dueDate ,taskProcess: taskProcess);

      final db = await DatabaseHelper().database;

      final response = await db.update('taskTable',{'title':title,'dueDate':dueDate,'taskDetails':taskDetails,'taskProcess': taskProcess},where: 'id = ?',whereArgs: [id]);

      _isLoading = false;
      if (response > 0) {
        update();
        return true;
      } else {
        update();
        return false;
      }
    }catch(e){
      log("==============>Update Data Error: $e");
      return false;
    }finally {
      await DatabaseHelper().closeDatabase();
    }
  }

}