import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color primaryColor = Color.fromARGB(255, 213, 213, 210);
Color secondaryColor =Color(0xff664C36);
Color tercaryColor =   Color(0xffCCBEB1);
Color hoverColor =   Color(0xff331C08);

void goto(BuildContext context, Widget nextScreen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => nextScreen));
}
 Widget progressIndicator(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          color: primaryColor,
          strokeWidth: 7,
        ),
      ),
    );

}
dialogbox(BuildContext context,String text){
showDialog(context: context, builder: (context)=> AlertDialog(
  title: Text(text),
));
}
