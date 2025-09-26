import 'package:flutter/material.dart';
import 'package:outfinders/components/constants.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
final Function onPressed;
  const SecondaryButton({Key? key,required this.title,required this.onPressed}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: TextButton(onPressed: (){
        onPressed();
      }, child: Text(title,style: 
      TextStyle(
        fontSize: 15,
        color: hoverColor,
        fontWeight: FontWeight.bold,
      )
      ,)),
    );
  }
}