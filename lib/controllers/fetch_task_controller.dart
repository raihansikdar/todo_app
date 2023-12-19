import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app/database/databaseHelper.dart';
import 'package:todo_app/model/task_model.dart';

class FetchTaskController extends GetxController{

  @override
  void onInit() {
    fetchTodoTask();
    fetchCompleteTask();
    super.onInit();
  }


  bool _isLoading = false;
  TaskModel _taskModel = TaskModel();
  List<TaskModel>_taskList = [];
  List<TaskModel>_completeTaskList = [];

  bool get isLoading => _isLoading;
  TaskModel get taskModel => _taskModel;
  List<TaskModel>get taskList => _taskList;
  List<TaskModel> get completeTaskList => _completeTaskList;

  Future<bool> fetchTodoTask() async {
    try {
      _isLoading = true;
      update();

      final db = await DatabaseHelper().database;
      final response = await db.query('taskTable', orderBy: "id DESC",where: 'taskProcess = ? ',whereArgs: ['Todo']);

      _isLoading = false;
      if (response.isNotEmpty) {
        _taskList.clear();
        _taskList = response.map((notesData) => TaskModel.fromJson(notesData)).toList();
        log("todo :${_taskList}");
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      log("==============>fetch Data Error: $e");
      return false;
    } finally {
      await DatabaseHelper().closeDatabase();
    }
  }




  Future<bool> fetchCompleteTask() async {
    try {
      _isLoading = true;
      update();

      final db = await DatabaseHelper().database;
      final response = await db.query('taskTable', orderBy: "id DESC",where: 'taskProcess = ? ',whereArgs: ['Completed']);

      _isLoading = false;
      if (response.isNotEmpty) {
        _completeTaskList.clear();
        _completeTaskList = response.map((notesData) => TaskModel.fromJson(notesData)).toList();
        log("Complete :${_completeTaskList}");
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      log("==============>fetch Data Error: $e");
      return false;
    } finally {
      await DatabaseHelper().closeDatabase();
    }
  }
}