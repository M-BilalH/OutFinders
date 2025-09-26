import 'package:flutter/material.dart';
import 'package:outfinders/Screens/product_view.dart';
import 'package:outfinders/components/constants.dart';
import 'package:outfinders/components/textfield.dart';
import 'package:outfinders/home_widget/P_Card.dart';
import 'package:outfinders/home_widget/product_card.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> categories = [
    "All",
    "Trending",
    "Fashion",
    "Shirts",
    "Trousers",
    "Baggy Jeans",
    "Old Money",
    "Sports",
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       DrawerHeader(child: Row(
      //         children: [
      //           CircleAvatar(),
      //           Text("User Profile"),
      //         ],
      //       )),
      //       ListTile(
      //         tileColor: Colors.white,
      //         title: Text("Home Page"),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
 leading: Padding(
   padding: const EdgeInsets.only(left: 10),
   child: Image.asset('assets/oflogo.png',color: Colors.black,),
 ),

actions: [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Icon(Icons.notifications_active_outlined),
  ),
  Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Icon(Icons.help_outline_rounded),
  )
],
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 15,right: 15),
              child: CustomTextField(
                hintText: "Search",
                prefix: Icon(Icons.search),
                suffix: Icon(Icons.filter_list),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Container(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  child: Chip(
                    label: Text(categories[index]),
                    backgroundColor: primaryColor,
                  ),
                ),
              );
                      },
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("Popular Products",
                  style: 
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewAll()));
                }, child: Text("View All",style: TextStyle(color: secondaryColor),),)
              ],
            ),
           Container(
            height: 520,
             child: GridView.count(crossAxisCount:2,
             childAspectRatio: 1.0,
             children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(),
              ),
             ],
             ),
           )
          ],
          ),
        ),
      ),
      
       );
  }
}

