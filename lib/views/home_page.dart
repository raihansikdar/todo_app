import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/controllers/update_task_controller.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/utils/color_pallete.dart';
import 'package:todo_app/utils/custom_size_extension.dart';
import 'package:todo_app/views/add_todo_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text("Todo"),
                Spacer(),
                Text("see"),
              ],
            ),
            Expanded(
              child: GetBuilder<FetchTaskController>(
                builder: (_fetchTaskController) {
                  return ListView.builder(
                      itemCount: _fetchTaskController.taskList.length,
                      itemBuilder: (context,index){
                        return TodoListView(todoList: _fetchTaskController.taskList[index],);
                      });
                }
              ),
            ),
            const Row(
              children: [
                Text("complete"),
                Spacer(),
                Text("see"),
              ],
            ),
            Expanded(
              child: GetBuilder<FetchTaskController>(
                builder: (_fetchTaskController) {
                  return ListView.builder(
                      itemCount: _fetchTaskController.completeTaskList.length,
                      itemBuilder: (context,index){
                        return CompleteListView(completeList: _fetchTaskController.completeTaskList[index],);
                      });
                }
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
          onPressed: (){
          Get.to(()=> AddTodoScreen());
          },child: const Icon(Icons.add),),
    );
  } 
}

class CompleteListView extends StatelessWidget {
  const CompleteListView({
    super.key, required this.completeList,
  });
final TaskModel completeList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: AppColors.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Text(completeList.title ?? ''),
                      Spacer(),
                      Card(
                        color: AppColors.completeColor,
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(completeList.taskProcess ?? ''),
                      ),),
                    ],
                  ),
                  SizedBox(height: 16.rSp,),
                   Text(completeList.taskDetails ?? ''),
                ],
              ),
            )
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: FittedBox(
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> AddTodoScreen(id: completeList.id,title: completeList.title,taskDetails: completeList.taskDetails,taskProcess: completeList.taskProcess,),arguments: 'update');
                      },
                      child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(4.rSp),
                            child: const Icon(Icons.edit),
                          )),
                    ),
                    SizedBox(width: 10.rw,),
                    Card(
                        elevation: 4,
                        //color: Colors.amber,
                        child: Padding(
                          padding:  EdgeInsets.all(4.rSp),
                          child: const Icon(Icons.delete,),
                        )),
                    SizedBox(width: 10.rw,),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class TodoListView extends StatelessWidget {
  const TodoListView({
    super.key, required this.todoList,
  });
 final TaskModel todoList;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            color: AppColors.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    children: [
                      Text(todoList.title ?? ''),
                      Spacer(),
                      Card(
                        color: AppColors.todoColor,
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(todoList.taskProcess ?? ''),
                      ),),
                    ],
                  ),
                  SizedBox(height: 16.rSp,),
                   Text(todoList.taskDetails ?? ''),
                ],
              ),
            )
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: FittedBox(
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> AddTodoScreen(id: todoList.id,title: todoList.title,taskDetails: todoList.taskDetails,taskProcess: todoList.taskProcess,),arguments: 'update');
                      },
                      child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.all(4.rSp),
                            child: const Icon(Icons.edit),
                          )),
                    ),
                    SizedBox(width: 10.rw,),
                    Card(
                        elevation: 4,
                        //color: Colors.amber,
                        child: Padding(
                          padding:  EdgeInsets.all(4.rSp),
                          child: const Icon(Icons.delete,),
                        )),
                    SizedBox(width: 10.rw,),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

