import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:outfinders/Screens/login.dart';
import 'package:outfinders/components/constants.dart';

class INTROScreen extends StatelessWidget {
  const INTROScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages =[
      PageViewModel(

  decoration: PageDecoration(
    pageColor: Colors.grey[200]
  ),
        title: "",
        bodyWidget: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 420,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: secondaryColor.withOpacity(0.2),
                ),
                child: Image.asset('assets/intro1.png',)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('Welcome to the',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                Text('Another World of Fashion',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text('( Dont Get Lost In this World )',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor
                ),),
                // Text('OutFinders-The Ultimate Fashion Search Platform',style: TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold
                // ),),
              ],
            ),
            
          ],
        )
      ),
      
      PageViewModel(

  decoration: PageDecoration(
    pageColor: Colors.grey[200]
  ),
        title: "",
        bodyWidget: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 420,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: secondaryColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset('assets/intro2.png',),
                )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('OutFinders',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                Text('The Ultimate Search Platform',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text('( The Urge to Search Fashion )',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor
                ),),
                // Text('OutFinders-The Ultimate Fashion Search Platform',style: TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold
                // ),),
              ],
            ),
            
          ],
        )
      ),
      
      PageViewModel(

  decoration: PageDecoration(
    pageColor: Colors.grey[200]
  ),
        title: "",
        bodyWidget: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 420,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  // color: secondaryColor.withOpacity(0.2),
                ),
                child: Image.asset('assets/intro3.png',)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text('Is This Annoying ?',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                Text('To find the Same Aticle',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text('( Lets Make it Easy With OutFInders )',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor
                ),),
                // Text('OutFinders-The Ultimate Fashion Search Platform',style: TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold
                // ),),
              ],
            ),
            
          ],
        )
      ),
      
     

    ];
    return IntroductionScreen(
      autoScrollDuration: 5000,
      infiniteAutoScroll: true,
      pages: pages,
      globalBackgroundColor: Colors.grey[200],
      dotsDecorator: DotsDecorator(
        activeColor: hoverColor,
      ),
showSkipButton: true,
showBackButton: true,
skip: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Text('Skip',style: TextStyle(
      fontSize: 17,
      color: hoverColor
    ),),
    SizedBox(width: 10,),
    Icon(Icons.double_arrow_sharp,size: 20,color: Colors.black,)
  ],
),
back: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Icon(Icons.arrow_back_sharp,size: 25,color: Colors.black,),
     SizedBox(width: 10,),
     Text('Back',style: TextStyle(
      fontSize: 15,
      color: hoverColor
    ),),
   
    
  ],
),
next: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
     Text('Next',style: TextStyle(
      fontSize: 15,
      color: hoverColor
    ),),
    SizedBox(width: 10,),
    Icon(Icons.arrow_forward_sharp,size: 25,color: Colors.black,)
  ],
),
done: Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
     Text('Done',style: TextStyle(
      fontSize: 15,
      color: hoverColor
    ),),
    SizedBox(width: 10,),
    Icon(Icons.done,size: 25,color: Colors.black,)
  ],
),
onDone: (){goto(context, LoginScreen());},
    );
  }
}