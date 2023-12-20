import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/application/state_holder_binder.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/splash_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return GetMaterialApp(
      initialBinding: StateHolderBinder(),
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColors.primaryColor.value, AppColors().color),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 8.rh,horizontal: 16.rw),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputFieldBorderColor,width: 2),
          ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputFieldBorderColor,width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.inputFieldBorderColor,width: 2),
            ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.inputFieldBorderColor,width: 2),
          ),

        ),
      ),
      home: const SplashScreen(),
    );
  }
}