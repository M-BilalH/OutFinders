import 'package:flutter/material.dart';
import 'package:outfinders/components/constants.dart';

class PCard extends StatelessWidget {
  const PCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          width: 180,
           decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.asset("assets/oflogo.png",color: Colors.black,),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}