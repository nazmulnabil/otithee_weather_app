import 'package:flutter/material.dart';
import 'package:weather_app_flutter/core/app_colors.dart';



class ElevatedCustomButton extends StatelessWidget {
  String? text;
  double? fontsize;
  double buttonHeight;
  var function;
  ElevatedCustomButton(
      {this.text,
        this.fontsize,
        required this.buttonHeight,
        required this.function,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(


          style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft:Radius.circular(25),
                topRight: Radius.circular(25),
            bottomRight:  Radius.circular(25)),

          ),
          primary: AppColors.colorPrimary,

        ),
        onPressed: function,

        //  Get.to(QuestionPage(), binding: QuestionPageBinding())),

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: buttonHeight),
          child: Text(
            text!,
            style: TextStyle(
                color: Colors.white, fontSize: fontsize),
          ),
        ));
  }
}