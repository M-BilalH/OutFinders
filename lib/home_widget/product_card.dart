import 'package:flutter/material.dart';
import 'package:outfinders/components/constants.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor, // Light blue background
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Vertical label
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              height: 200,
              child: RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Text(
                    'AIR ZOOM PEGASUS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Product content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.favorite_border, size: 20),
                      SizedBox(width: 35,),
                      Icon(Icons.shopping_cart_outlined, size: 20),
                    ],
                  ),
                SizedBox(height: 10,),
                  // Image.network(
                  //   // 'https://static.nike.com/a/images/t_default/9eb6c1a7-3487-4cfb-bb25-8f29c104bd84/air-zoom-pegasus-38-road-running-shoes-KlvDcj.png',
                  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3EE1niDqJJ-71jJYjeMVsP79F2dlOh2_NzA&s',
                  //   height: 90,
                  //   fit: BoxFit.contain,
                  // ),
                  Image.asset('assets/P1.png'),
                  SizedBox(height: 10,),

                  // Price section
                  Column(
                    children: [
                      Text(
                        '\Rs.9990',
                        style: TextStyle(
                          color: Colors.redAccent,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '\Rs.7490',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                 

                  // Icons row
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}