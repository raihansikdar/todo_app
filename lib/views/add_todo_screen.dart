import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/add_task_controller.dart';
import 'package:todo_app/controllers/update_task_controller.dart';
import 'package:todo_app/utils/color_pallete.dart';
import 'package:todo_app/utils/custom_size_extension.dart';

class AddTodoScreen extends StatefulWidget {
    final int? id;
    final String? title;
    final String? taskDetails;
    final String? taskProcess;
   AddTodoScreen({Key? key,this.id, this.title, this.taskDetails, this.taskProcess}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
   String dropDownValue = 'Todo';

TextEditingController _titleTEController = TextEditingController();

TextEditingController _textDetailsTEController = TextEditingController();
TextEditingController _taskTEController = TextEditingController();

 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 bool _argumentKey = false;
@override
  void initState() {
    if(Get.arguments != null){
      _argumentKey = true;
      _titleTEController.text = widget.title!;
      _textDetailsTEController.text = widget.taskDetails!;
      _taskTEController.text = widget.taskProcess!;
    }
    print(widget.id);
    print(widget.title);
    print(widget.taskDetails);
    print(widget.taskProcess);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        title:  Text(_argumentKey ? 'Update Task' : "Add Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller:  _titleTEController,
                decoration: InputDecoration(
                    hintText: 'title',
                    hintStyle: TextStyle(color: AppColors.primaryColor)
                ),
                  validator: (String? title){
                    if(title?.isEmpty ?? true){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.rSp,),
                TextFormField(
                  controller: _textDetailsTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      hintText: 'Task Details',
                      hintStyle: TextStyle(color: AppColors.primaryColor)
                  ),
                  validator: (String? taskDetails){
                    if(taskDetails?.isEmpty ?? true){
                     return 'This field is mandatory';
                    }
                    return null;
                  },
            
                ),
                SizedBox(height: 16.rSp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _taskTEController,
                        enabled: false,
                        decoration: InputDecoration(
                            hintText: 'Select Task Progress',
                            hintStyle: TextStyle(color: AppColors.primaryColor),
                          contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 8.0)
                        ),
                        validator: (String? taskProgress){
                          if(taskProgress?.isEmpty ?? true){
                            return 'This field is mandatory';
                          }
                          return null;
                        },
                      ),
            
                    ),
                    SizedBox(width: 8.rSp,),
                    DropdownButton(
                      value: dropDownValue,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_drop_down_circle),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Todo',
                          child: Text('Todo'),
                        ),
                        DropdownMenuItem(
                          value: 'Completed',
                          child: Text('Completed'),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        dropDownValue = newValue ?? 'Todo';
                        _taskTEController.text = dropDownValue;
                        setState(() {});
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.rSp,),
                // GetBuilder(
                //   builder: (controller) {
                //     if(_argumentKey){
                //       return ElevatedButton(
                //         onPressed: (){
                //           if(!_formKey.currentState!.validate()){
                //             return;
                //           }
                //           UpdateTaskController().updateTask(/*id: widget.id!,*/title: _titleTEController.text.trim(), taskDetails: _textDetailsTEController.text.trim(), taskProcess: _taskTEController.text.trim()).then((value) {
                //             if(value){
                //               Fluttertoast.showToast(msg: "Task has been updated");
                //               Navigator.pop(context);
                //             }
                //             else{
                //               Fluttertoast.showToast(msg: "Task is not updated",backgroundColor: AppColors.deleteIconColor);
                //             }
                //           });
                //         }, child: Text("Update Task"));
                //     }else{
                //       return  ElevatedButton(
                //         onPressed: (){
                //           if(!_formKey.currentState!.validate()){
                //             return;
                //           }
                //           AddTaskController().addTask(title: _titleTEController.text.trim(), taskDetails: _textDetailsTEController.text.trim(), taskProcess: _taskTEController.text.trim()).then((value) {
                //             if(value){
                //               Fluttertoast.showToast(msg: "Task has been added");
                //               Navigator.pop(context);
                //             }
                //             else{
                //               Fluttertoast.showToast(msg: "Task is not added",backgroundColor: AppColors.deleteIconColor);
                //             }
                //           });
                //         }, child: Text("Add Task"),);
                //     }
                //   }
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
