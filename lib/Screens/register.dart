import 'package:flutter/material.dart';
import 'package:outfinders/Screens/verify_page.dart';
import 'package:outfinders/auth/auth_service.dart';
import 'package:outfinders/components/constants.dart';
import 'package:outfinders/components/primarybutton.dart';
import 'package:outfinders/components/secondarybutton.dart';
import 'package:outfinders/components/textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final authService =AuthService();
  TextEditingController namecontroller =TextEditingController();
  TextEditingController passcontroller =TextEditingController();
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController cnfmpasscontroller =TextEditingController();
  bool isPasswordshow =false;
  void SignUp()async{
final email=emailcontroller.text;
final password=passcontroller.text;
final name=namecontroller.text;
final cnfmpass=cnfmpasscontroller.text;

if(password!=cnfmpass){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password doesnt Match")));
  return;
}try {
  await authService.signUpWithEmailAndPassword(email, password,name);
  goto(context, VerifyPage(email: email));
} catch (e) {
  if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error : $e")));
      }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Registeration",
        style: TextStyle(fontWeight: FontWeight.bold),),
      ),
body: SafeArea(child: SingleChildScrollView(
  child: Column(
    children: [
                 Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 30),
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
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                  child: CustomTextField(
                    hintText: "Username",
                    controller: namecontroller,
                    prefix: Icon(Icons.person),
                    
                  ),
                ),
      Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    hintText: "Email",
                    controller: emailcontroller,
                    prefix: Icon(Icons.email),
                    
                  ),
                ),
      
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                  child: CustomTextField(
                    hintText: "Password",
                    controller: passcontroller,
                    prefix: Icon(Icons.vpn_key),
                    isPassword: isPasswordshow,
                    
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15,),
                  child: CustomTextField(
                    hintText: "Confirm Password",
                    controller: cnfmpasscontroller,
                    prefix: Icon(Icons.vpn_key),
                    isPassword: isPasswordshow,
                    // suffix: IconButton(
                    //                     onPressed: () {
                    //                       setState(() {
                    //                         isPasswordshow = !isPasswordshow;
                    //                       });
                    //                     },
                    //                     icon:
                    //                         isPasswordshow
                    //                             ? Padding(
                    //                               padding: const EdgeInsets.all(
                    //                                 10.0,
                    //                               ),
                    //                               child: Icon(
                    //                                 Icons.visibility_off_outlined,
                    //                               ),
                    //                             )
                    //                             : Padding(
                    //                               padding: const EdgeInsets.all(
                    //                                 10.0,
                    //                               ),
                    //                               child: Icon(
                    //                                 Icons.visibility_outlined,
                    //                               ),
                    //                             ),
                    //                   ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top:25.0,left: 15,right: 15),
                  child: PrimaryButton(title: "Register", onPressed: SignUp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account : "),
                    SecondaryButton(title: 'Login', onPressed: 
                    (){})
                  ],
                ),
    ],
  ),
)),
    );
  }
}