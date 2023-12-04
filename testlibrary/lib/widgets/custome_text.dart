import 'package:flutter/material.dart';
class CustomText extends Text {
  String data ;
  CustomText( this.data,
       {super.key, double? size,
        Color? color,
        TextAlign? textAlign,
        FontWeight weight = FontWeight.w300,
        String ?fontFamily = "Montserrat",
        double ?letterSpace,
        List<Shadow>? shadow,
        TextHeightBehavior? heightBehavior,
        double? textHeight,

      })
      : super(data,textScaleFactor: 1.0, style: TextStyle(fontWeight: weight, fontSize: size, color: color, fontFamily:fontFamily ,letterSpacing: letterSpace , shadows: shadow,height:textHeight,));
}