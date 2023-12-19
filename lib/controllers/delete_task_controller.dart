import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/database/databaseHelper.dart';
import 'package:todo_app/model/task_model.dart';

class DeleteTaskController extends GetxController{


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> deleteTask({required int id}) async {
    try {
      _isLoading = true;
      update();

      final db = await DatabaseHelper().database;

      final response = await db.query('taskTable', where: 'id = ?', whereArgs: [id]);

      if (response.isNotEmpty) {
        TaskModel _taskModel = TaskModel.fromJson(response.first);

        final deleteResponse = await db.delete('taskTable', where: 'id = ?', whereArgs: [id]);
        Get.find<FetchTaskController>().taskList.removeWhere((element) => element.id == id);
        Get.find<FetchTaskController>().completeTaskList.removeWhere((element) => element.id == id);

        _isLoading = false;
        update();
        return true;
      } else {
        _isLoading = false;
        update();
        return false;
      }
    } catch (e) {
      log("==============>Delete Data Error: $e");
      return false;
    } finally {
      await DatabaseHelper().closeDatabase();
    }
  }

  Future<bool> clearData() async {
    try {
      _isLoading = true;
      update();

      final db = await DatabaseHelper().database;
      final response = await db.rawDelete("DELETE FROM taskTable");

      _isLoading = false;
      if (response > 0) {
        Get.find<FetchTaskController>().taskList.clear();
        Get.find<FetchTaskController>().completeTaskList.clear();
        update();
        return true;
      } else {
        update();
        return false;
      }
    } catch (e) {
      log("==============>Clear Data Error: $e");
      return false;
    } finally {
      await DatabaseHelper().closeDatabase();
    }
  }

}