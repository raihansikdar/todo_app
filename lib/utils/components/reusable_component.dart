import 'package:flutter/material.dart';
import 'package:todo_app/utils/components/color_pallete.dart';
import 'package:todo_app/utils/components/custom_size_extension.dart';
import 'package:todo_app/utils/widgets/text_component.dart';

class AppReusableComponent {
  static titleText(String text){
   return TextComponent(
      text: text,
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      color: AppColors.primaryColor,
      fontSize: 20.rSp,
      fontWeight: FontWeight.w600,
    );
  }

  static customChip(String text){
    return Chip(
      padding: EdgeInsets.zero,
      side: BorderSide(color: AppColors.inputFieldBorderColor),
      label: TextComponent(
        text: text,
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        color: AppColors.primaryColor,
        fontSize: 16.rSp,
        fontWeight: FontWeight.w400,
      ),);
  }

  static cardTitleText(String text){
    return TextComponent(
      text: text,
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      color: AppColors.whiteColor,
      fontSize: 18.rSp,
      fontWeight: FontWeight.w600,
    );
  }

  static cardSubTitleText(String text){
    return TextComponent(
      text: text,
      maxLines: 5,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      color: AppColors.secondaryColor,
      fontSize: 16.rSp,
      fontWeight: FontWeight.w500,
    );
  }



}