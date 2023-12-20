import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/utils/widgets/text_component.dart';
import 'package:todo_app/utils/widgets/todo_list_view_widget.dart';

class DetailsTaskScreen extends StatefulWidget {
   const DetailsTaskScreen({Key? key}) : super(key: key);

  @override
  State<DetailsTaskScreen> createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {
   bool argumentKey = false;
  @override
  void initState() {
    if(Get.arguments != null){
      argumentKey = Get.arguments;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        title: TextComponent(
        text: argumentKey ? "Completed Task" :  "Todo Task",
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        color: AppColors.secondaryColor,
        fontSize: 24.rSp,
        fontWeight: FontWeight.w600,
      ),
        centerTitle: true,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new,color: AppColors.secondaryColor,))
      ),
      body:Padding(
        padding:  EdgeInsets.all(16.rSp),
        child: argumentKey ?  GetBuilder<FetchTaskController>(
            builder: (_fetchTaskController) {
              if(_fetchTaskController.isLoading){
                return const CircularProgressIndicator();
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
        ) : GetBuilder<FetchTaskController>(
            builder: (_fetchTaskController) {
              if(_fetchTaskController.isLoading){
                return const CircularProgressIndicator();
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
    );
  }
}
