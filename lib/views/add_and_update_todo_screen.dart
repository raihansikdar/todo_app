import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/add_task_controller.dart';
import 'package:todo_app/controllers/delete_task_controller.dart';
import 'package:todo_app/controllers/fetch_task_controller.dart';
import 'package:todo_app/controllers/update_task_controller.dart';
import 'package:todo_app/utils/components/app_toast_message.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/utils/widgets/text_component.dart';

class AddAndUpdateTodoScreen extends StatefulWidget {
    final int? id;
    final String? title;
    final String? dueDate;
    final String? taskDetails;
    final String? taskProcess;
   const AddAndUpdateTodoScreen({Key? key,this.id, this.title, this.taskDetails, this.taskProcess, this.dueDate}) : super(key: key);

  @override
  State<AddAndUpdateTodoScreen> createState() => _AddAndUpdateTodoScreenState();
}

class _AddAndUpdateTodoScreenState extends State<AddAndUpdateTodoScreen> {
   String dropDownValue = 'Todo';

 final TextEditingController _titleTEController = TextEditingController();
 final TextEditingController _dueDateTEController = TextEditingController();
 final TextEditingController _textDetailsTEController = TextEditingController();
 final TextEditingController _taskTEController = TextEditingController();

 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 bool _argumentKey = false;
@override
  void initState() {
    if(Get.arguments != null){
      _argumentKey = true;
      _titleTEController.text = widget.title!;
      _textDetailsTEController.text = widget.taskDetails!;
      _taskTEController.text = widget.taskProcess!;
      _dueDateTEController.text = widget.dueDate!;
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
          text:_argumentKey ? 'Update Task' :  'Add Task',
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
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller:  _titleTEController,
                  style: const TextStyle(color: AppColors.titleTextColor),
                decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: TextStyle(color: AppColors.inputFieldBorderColor.withOpacity(0.7))
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
                  controller: _dueDateTEController,
                 // enabled: false,
                  style: const TextStyle(color: AppColors.titleTextColor),
                  decoration: InputDecoration(
                      hintText: 'Due Date',
                      hintStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
                      suffixIcon: GestureDetector(onTap: (){
                        _selectDate();
                      }, child: Icon(Icons.calendar_month,size: 30.rSp,)),
                  ),
                  validator: (String? taskProgress){
                    if(taskProgress?.isEmpty ?? true){
                      return 'This field is mandatory';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.rSp,),
                TextFormField(
                  controller: _textDetailsTEController,
                  style: const TextStyle(color: AppColors.titleTextColor),
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Task Details',
                      hintStyle: TextStyle(color: AppColors.inputFieldBorderColor.withOpacity(0.7))
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
                        style: const TextStyle(color: AppColors.titleTextColor),
                        enabled: false,
                        decoration:  InputDecoration(
                            hintText: 'Select Task Progress',
                            hintStyle: TextStyle(color: AppColors.primaryColor.withOpacity(0.5)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8.0)
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
                   _argumentKey ? DropdownButton(
                     dropdownColor: AppColors.secondaryColor,
                     borderRadius:BorderRadius.circular(16.rSp),
                     value: dropDownValue,
                     icon: const Padding(
                       padding: EdgeInsets.only(left: 8.0),
                       child: Icon(Icons.arrow_drop_down_circle,color: AppColors.primaryColor,),
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
                   ) :  DropdownButton(
                      dropdownColor: AppColors.secondaryColor,
                      borderRadius:BorderRadius.circular(16.rSp),
                      value: dropDownValue,
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_drop_down_circle,color: AppColors.primaryColor,),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Todo',
                          child: Text('Todo'),
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
                _argumentKey ?   GetBuilder<UpdateTaskController>(
                    builder: (_updateTaskController) {
                      return ElevatedButton(
                          onPressed: (){
                            if(!_formKey.currentState!.validate()){
                              return;
                            }
                            _updateTaskController.updateTask(id: widget.id!,title: _titleTEController.text.trim(),dueDate: _dueDateTEController.text.trim(), taskDetails: _textDetailsTEController.text.trim(), taskProcess: _taskTEController.text.trim()).then((value) {
                              if(value){
                                AppToastMessage.successToastMessage('Task has been updated.');
                                _titleTEController.clear();
                                _textDetailsTEController.clear();
                                _taskTEController.clear();
                                _dueDateTEController.clear();
                                Future.delayed(const Duration(seconds: 1)).then((value) {
                                  Get.find<FetchTaskController>().fetchCompleteTask();
                                  Get.find<FetchTaskController>().fetchTodoTask();
                                  Navigator.pop(context);
                                });
                              }
                              else{
                                AppToastMessage.failedToastMessage('Task is not updated.');
                              }
                            });
                          }, child: const Text("Update Task"));
                    }
                ) :  GetBuilder<AddTaskController>(
                  builder: (_addTaskController) {
                      return  ElevatedButton(
                        onPressed: (){
                          if(!_formKey.currentState!.validate()){
                            return;
                          }
                           _addTaskController.addTask(title: _titleTEController.text.trim(),dueDate: _dueDateTEController.text.trim(), taskDetails: _textDetailsTEController.text.trim(), taskProcess: _taskTEController.text.trim()).then((value) {
                            if(value){
                              AppToastMessage.successToastMessage('Task has been added.');
                              _titleTEController.clear();
                              _textDetailsTEController.clear();
                              _taskTEController.clear();
                              _dueDateTEController.clear();
                             Future.delayed(const Duration(seconds: 1)).then((value) {
                               Get.find<FetchTaskController>().fetchTodoTask();
                               Get.find<FetchTaskController>().fetchCompleteTask();
                               Navigator.pop(context);
                             });
                            }
                            else{
                              AppToastMessage.failedToastMessage('Task is not added.');
                            }
                          });
                        }, child: const Text("Add Task"),);
                    }
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
   Future<void> _selectDate() async {
     DateTime? _picker = await showDatePicker(
       context: context,
       initialDate: DateTime.now(),
       firstDate: DateTime(2020),
       lastDate: DateTime(2100),
     );
     if (_picker != null) {
       String formattedDate = DateFormat("dd/MMM/yyyy").format(_picker);
       _dueDateTEController.text = formattedDate.toString();

       setState(() {});
     }
   }
}
