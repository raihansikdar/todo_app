import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/utils/components/color_pallete.dart';

class AppToastMessage{
  AppToastMessage._();
  static void successToastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.successFulToastColor,
    );
  }
  static void failedToastMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.deleteIconColor,
    );
  }
}