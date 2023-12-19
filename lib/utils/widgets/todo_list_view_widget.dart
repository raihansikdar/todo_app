import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/delete_task_controller.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/utils/components/AppToastMessage.dart';
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
                    child: AppReusableComponent.cardSubTitleText(
                        "Task Description: ${data.taskDetails ?? ''}",
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
                        Get.find<DeleteTaskController>().deleteTask(id: data.id!).then((value) {
                          if(value){
                            Get.find<FetchTaskController>().fetchTodoTask();
                            AppToastMessage.successToastMessage("Task has been deleted");
                          }
                        });

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
}