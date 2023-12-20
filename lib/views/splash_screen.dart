import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/components/assets_path.dart';
import 'package:todo_app/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(()=>const HomePage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsPath.logoPNG,fit: BoxFit.cover,)),
    );
  }
}
