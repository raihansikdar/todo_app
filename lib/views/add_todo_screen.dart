import 'package:flutter/material.dart';
import 'package:todo_app/utils/color_pallete.dart';
import 'package:todo_app/utils/custom_size_extension.dart';

class AddTodoScreen extends StatefulWidget {
   AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
   String dropDownValue = 'Todo';

TextEditingController _titleTEController = TextEditingController();

TextEditingController _textDetailsTEController = TextEditingController();
TextEditingController _taskTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.primaryColor,
        title: const Text("Add Todo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.rSp),
        child: Column(
          children: [
            TextFormField(
              controller: _titleTEController,
            decoration: InputDecoration(
                hintText: 'title',
                hintStyle: TextStyle(color: AppColors.primaryColor)
            ),
            ),
            SizedBox(height: 16.rSp,),
            TextFormField(
              controller: _titleTEController,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'Task Details',
                  hintStyle: TextStyle(color: AppColors.primaryColor)
              ),

            ),
            SizedBox(height: 16.rSp,),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _taskTEController,
                    decoration: InputDecoration(
                        hintText: 'task',
                        hintStyle: TextStyle(color: AppColors.primaryColor)
                    ),
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
            ElevatedButton(
              onPressed: (){}, child: Text("Add task"),),
          ],
        ),
      ),
    );
  }
}
