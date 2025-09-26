import 'package:flutter/material.dart';
import 'package:outfinders/components/constants.dart';

class PrimaryButton extends StatelessWidget {
  // const PrimaryButton({super.key});
final String title;
final Function onPressed;
bool loading;
PrimaryButton({required this.title,required this.onPressed,this.loading=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(onPressed: (){
        onPressed();
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
      child: Text(title,style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),),
      ),
    );
  }
}