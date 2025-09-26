import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:outfinders/Screens/home_page.dart';
import 'package:outfinders/Screens/register.dart';
import 'package:outfinders/auth/auth_service.dart';
import 'package:outfinders/components/constants.dart';
import 'package:outfinders/components/primarybutton.dart';
import 'package:outfinders/components/secondarybutton.dart';
import 'package:outfinders/components/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authService =AuthService();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController passcontroller =TextEditingController();
  bool isPasswordshow =false;

  void login()async{
    final email=namecontroller.text.trim();
    final pass = passcontroller.text.trim();
    try{
await authService.signInWithEmailAndPassword(email, pass);
goto(context, HomePage());
    }catch(e){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error : $e")));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor,
                        image:DecorationImage(image: AssetImage('assets/oflogo.png',),invertColors: true)
                      ),
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("OutFinders",style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text("Search Any Fashion Here!",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: secondaryColor
                        ),)
                      ],
                    )
                  ],
                ),
              ),
             
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomTextField(
                  hintText: "Email",
                  controller: namecontroller,
                  prefix: Icon(Icons.person),
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15,),
                child: CustomTextField(
                  hintText: "Password",
                  controller: passcontroller,
                  prefix: Icon(Icons.vpn_key),
                  isPassword: isPasswordshow,
                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordshow = !isPasswordshow;
                                        });
                                      },
                                      icon:
                                          isPasswordshow
                                              ? Padding(
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                child: Icon(
                                                  Icons.visibility_off_outlined,
                                                ),
                                              )
                                              : Padding(
                                                padding: const EdgeInsets.all(
                                                  10.0,
                                                ),
                                                child: Icon(
                                                  Icons.visibility_outlined,
                                                ),
                                              ),
                                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0,left: 15,right: 15),
                child: PrimaryButton(title: "Login", onPressed: login),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont Have an Account : "),
                  SecondaryButton(title: 'Register', onPressed: 
                  (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                  })
                ],
              ),
                        Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                           Divider(
                                            color: tercaryColor,
                                          ), // The horizontal line
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding around the text
                                            decoration: BoxDecoration(
                                              color: primaryColor, // Background color to hide the divider behind the text
                                            ),
                                            child: const Text(
                                              'Or Sign In With', // Your desired text
                                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              Fluttertoast.showToast(msg: 'Coming Soon');
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: primaryColor
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                radius: 30,
                                                child: Image.asset('assets/googleicon.png'),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Fluttertoast.showToast(msg: 'Coming Soon');
                                            },
                                            child: Container(
                                            height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: primaryColor
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                radius: 10,
                                                child: Image.asset('assets/twittericon.png'),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Fluttertoast.showToast(msg: 'Coming Soon');
                                            },
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: primaryColor
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                radius: 30,
                                                child: Image.asset('assets/discordicon.png'),
                                              ),
                                            ),
                                          ),
                                          
                                        ],
                                      ),
                                    ),

                                  ],),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25.0),
                                    child: InkWell(
                                      onTap:(){ Fluttertoast.showToast(msg: "New Version : App Crashes Fixed");},
                                      child: Text("App Version : 1.0.0",style: TextStyle(
                                                            fontWeight: FontWeight.w100,
                                                            color: Colors.grey[500]
                                                           ),),
                                    )
                                  )
                                  
            ],
          ),
          
        ),
      )),
    );
  }
}