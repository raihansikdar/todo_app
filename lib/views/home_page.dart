import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropDownValue = 'Select one';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("title"),
              subtitle: Text("title"),
              trailing: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit),
                      Icon(Icons.delete),
                    ],
                  ),
                  
                  DropdownButton(
                      value: dropDownValue,
                      icon: Icon(Icons.arrow_drop_down_circle),
                      items: const[
                        DropdownMenuItem(
                            value: 'one',
                            child: Text('Todo'),
                        ),
                        DropdownMenuItem(
                            value: 'two',
                            child: Text('OnProgress'),
                        ),
                        DropdownMenuItem(
                            value: 'Three',
                            child: Text('Completed'),
                        ),
                      ],
                      onChanged: (String? value){
                        dropDownValue = value!;
                        setState(() {});
                      },
                  )
                ],
              ),
            );
          }),
    );
  }
}
