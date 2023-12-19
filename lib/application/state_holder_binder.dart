import 'package:get/get.dart';
import 'package:todo_app/controllers/add_task_controller.dart';
import 'package:todo_app/controllers/delete_task_controller.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/controllers/update_task_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
   Get.put(AddTaskController());
   Get.put(FetchTaskController());
   Get.put(UpdateTaskController());
   Get.put(DeleteTaskController());
  }
}
