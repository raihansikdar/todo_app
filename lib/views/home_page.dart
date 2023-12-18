import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/color_pallete.dart';
import 'package:todo_app/utils/custom_size_extension.dart';
import 'package:todo_app/views/add_todo_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<String> dropDownValues = List.filled(5, 'one');
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
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context,index){
                    return Stack(
                      children: [
                        Card(
                            color: AppColors.cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Title"),
                                      Spacer(),
                                      Card(child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Complete"),
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 16.rSp,),
                                  const Text("Sub-Title"),
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
                                    Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: EdgeInsets.all(4.rSp),
                                          child: const Icon(Icons.edit),
                                        )),
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
                  }),
            ),
            const Row(
              children: [
                Text("complete"),
                Spacer(),
                Text("see"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context,index){
                    return Stack(
                      children: [
                        Card(
                            color: AppColors.cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text("Title"),
                                      Spacer(),
                                      Card(child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Complete"),
                                      ),),
                                    ],
                                  ),
                                  SizedBox(height: 16.rSp,),
                                  const Text("Sub-Title"),
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
                                    Card(
                                        elevation: 4,
                                        child: Padding(
                                          padding: EdgeInsets.all(4.rSp),
                                          child: const Icon(Icons.edit),
                                        )),
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
                  }),
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

