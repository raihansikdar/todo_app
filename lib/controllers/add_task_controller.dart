import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app/database/databaseHelper.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/utils/constants.dart';

class AddTaskController extends GetxController{
  bool _isLoading = false;
  TaskModel _taskModel = TaskModel();

  bool get isLoading => _isLoading;
  TaskModel get taskModel => _taskModel;

  Future<bool> addTask({required String title,required String taskDetails,required String taskProcess}) async {
    try {
      _isLoading = true;
      update();
      _taskModel = TaskModel(title: title, taskDetails: taskDetails, taskProcess: taskProcess);

      final db = await DatabaseHelper().database;
      final response = await db.insert('taskTable', _taskModel.toJson());

      _isLoading = false;
      if (response > 0) {
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      log("==============>Insert Data Error: $e");
      return false;
    } finally {
      await DatabaseHelper().closeDatabase();
    }
  }
}