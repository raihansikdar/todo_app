import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/delete_task_controller.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/utils/components/app_toast_message.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/utils/components/reusable_component.dart';
import 'package:todo_app/utils/widgets/text_component.dart';
import 'package:todo_app/utils/widgets/todo_list_view_widget.dart';
import 'package:todo_app/views/add_and_update_todo_screen.dart';
import 'package:todo_app/views/details_task_screen.dart';

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
        title: TextComponent(
            text: "Todo App",
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            color: AppColors.secondaryColor,
            fontSize: 24.rSp,
            fontWeight: FontWeight.w600,
            ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: (){
                Get.find<FetchTaskController>().taskList.isEmpty && Get.find<FetchTaskController>().completeTaskList.isEmpty ?  AppToastMessage.failedToastMessage('There is no task exists.') :
                Get.find<DeleteTaskController>().clearData().then((value) {
                  if(value){
                    AppToastMessage.successToastMessage('All Tasks have been deleted.');
                    Get.find<FetchTaskController>().fetchTodoTask();
                    Get.find<FetchTaskController>().fetchCompleteTask();
                  }else{
                    AppToastMessage.failedToastMessage('Tasks not deleted.');
                  }
                });
              },
              child: Icon(Icons.delete_sweep,size: 30.rSp,color: AppColors.secondaryColor,)),
          SizedBox(width: 16.rw),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rSp,vertical: 6.rSp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppReusableComponent.titleText("Completed List"),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>DetailsTaskScreen(),arguments: true);
                  },
                  child:   AppReusableComponent.customChip("See All"),
                )
              ],
            ),
            Expanded(
              child: GetBuilder<FetchTaskController>(
                  builder: (_fetchTaskController) {
                    if(_fetchTaskController.isLoading){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if(_fetchTaskController.completeTaskList.isEmpty){
                      return  Center(
                        child: TextComponent(
                          text: "Empty",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.primaryColor,
                          fontSize: 24.rSp,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: _fetchTaskController.completeTaskList.length,
                        itemBuilder: (context,index){
                          return TodoListViewWidget(data: _fetchTaskController.completeTaskList[index],);
                        });
                  }
              ),
            ),


             const Divider(thickness: 5,color: AppColors.primaryColor,),
            Row(
              children: [
                AppReusableComponent.titleText("Todo List"),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>DetailsTaskScreen());
                  },
                  child:   AppReusableComponent.customChip("See All"),
                )
              ],
            ),
            Expanded(
              child: GetBuilder<FetchTaskController>(
                  builder: (_fetchTaskController) {
                    if(_fetchTaskController.isLoading){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if(_fetchTaskController.taskList.isEmpty){
                      return  Center(
                        child: TextComponent(
                          text: "Empty",
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.primaryColor,
                          fontSize: 24.rSp,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: _fetchTaskController.taskList.length,
                        itemBuilder: (context,index){
                          return TodoListViewWidget(data: _fetchTaskController.taskList[index],);
                        });
                  }
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
          onPressed: (){
          Get.to(()=> const AddAndUpdateTodoScreen());
          },child: const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  } 
}





