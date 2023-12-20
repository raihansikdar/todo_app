import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/delete_task_controller.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/utils/components/app_toast_message.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/utils/components/reusable_component.dart';
import 'package:todo_app/utils/widgets/text_component.dart';
import 'package:todo_app/views/add_and_update_todo_screen.dart';

class TodoListViewWidget extends StatelessWidget {
  const TodoListViewWidget({
    super.key, required this.data,
  });
  final TaskModel data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: AppColors.cardColor,
            child: Padding(
              padding: EdgeInsets.all(8.rSp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8.rw,),
                      SizedBox(
                        width: 230.rw,
                      child:  AppReusableComponent.cardTitleText("Task Title: ${data.title ?? ''}"),
                      ),
                      Spacer(),
                      Card(
                        color: AppColors.titleTextColor.withOpacity(0.6),
                        child: Padding(
                          padding: EdgeInsets.all(8.rSp),
                          child: Text(data.taskProcess ?? '',style: TextStyle(color: AppColors.whiteColor),),
                        ),),
                    ],
                  ),
                  SizedBox(height: 1.rSp,),
                  Padding(padding: EdgeInsets.only(left: 8.rw),child: AppReusableComponent.cardTitleText("Due date: ${data.dueDate ?? ''}"),),
                  SizedBox(height: 12.rSp,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.rw),
                    child: AppReusableComponent.cardSubTitleText("Task Description: ${data.taskDetails ?? ''}",
                    ),
                  ),
                  SizedBox(height: 16.rSp,),
                ],
              ),
            )
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: FittedBox(
              child: SizedBox(
                width: 100.rw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> AddAndUpdateTodoScreen(id: data.id,title: data.title,dueDate: data.dueDate,taskDetails: data.taskDetails,taskProcess: data.taskProcess,),arguments: 'update');
                      },
                      child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(4.rSp),
                            child:  Icon(Icons.edit,size: 15.rSp,),
                          )),
                    ),
                    SizedBox(width: 8.rw,),
                    GestureDetector(
                      onTap: (){
                       deleteAlertDialog(context);

                      },
                      child: Card(
                          elevation: 4,
                          //color: Colors.amber,
                          child: Padding(
                            padding:  EdgeInsets.all(4.rSp),
                            child:  Icon(Icons.delete,size: 15.rSp,),
                          )),
                    ),
                    SizedBox(width: 10.rw,),
                  ],
                ),
              ),
            ))
      ],
    );
  }


  void deleteAlertDialog(BuildContext context){
    showDialog(context: context, builder: (context){

      return AlertDialog(
        alignment: Alignment.center,
        backgroundColor: const Color.fromARGB(255, 56, 39, 39),
        titlePadding: EdgeInsets.only(top: 16.rSp,bottom: 8.rSp,left: 16.rSp,right: 16.rSp),
        title: Text("Delete Alert",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.rSp,letterSpacing: 0.6,fontWeight: FontWeight.w600,color: Colors.white,),),
        contentPadding: EdgeInsets.symmetric(vertical:8.rSp,horizontal: 16.rSp),
        content: Text("Are you sure you want to delete task?",textAlign: TextAlign.center,style: TextStyle(fontSize: 14.rSp,fontWeight: FontWeight.w400,color: Colors.yellow),),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Cancel")),
          SizedBox(width: 16.rw,),
          ElevatedButton(onPressed: (){
            Get.find<DeleteTaskController>().deleteTask(id: data.id!).then((value) {
              if(value){
                Get.find<FetchTaskController>().fetchTodoTask();
                AppToastMessage.successToastMessage("Task has been deleted");
              }else{
                AppToastMessage.failedToastMessage("Task not deleted");
              }
            });
            Navigator.pop(context);
          }, child: const Text("Delete")),
          SizedBox(width: 2.rw,),
        ],
      );

    });
  }
}