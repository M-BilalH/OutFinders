import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outfinders/Screens/home_page.dart';
import 'package:outfinders/auth/verify_email.dart';
import 'package:outfinders/components/constants.dart';
import 'package:pinput/pinput.dart';

class VerifyPage extends StatefulWidget {
  String email;
VerifyPage({super.key, required this.email});
  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final controleer =TextEditingController();
  Timer? _timer;
  int _start = 120; // 2 minutes in seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer(); // Timer starts immediately when page is loaded
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer before starting a new one

    setState(() {
      _canResend = false;
      _start = 120;
    });

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_start == 0) {
          setState(() {
            _canResend = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }


  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _resendOtp() {
    print('Resending OTP...');
    startTimer(); // Restart timer after resend
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.help))
        ],
        backgroundColor: primaryColor,
        title: Center(
          child: const Text(
            "Email Verification",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/emailillus.png")),
                  ),
                ),
              ),
            
              Text(
                "Check Your Email",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We have sent you an email for the verification.\nPlease enter the OTP in the below field.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Pinput(
                  controller: controleer,
                  length: 6,
                  onCompleted: (pin) {
                    print('Completed: $pin');
                  },
                  onChanged: (pin) {
                    print('Changed: $pin');
                  },
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                    decoration: BoxDecoration(
                      border: Border.all(color: secondaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    backgroundColor: primaryColor,
                  
                  ),
                  onPressed: ()async{
                  final email1=widget.email;
                  bool status = await verifyEmailWithToken(email1,controleer.text.trim());
 if (status==true) {
     goto(context, HomePage());
      // navigate to another screen if needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification failed.')),
      );
    }
                }, child: Text("Verify",style: TextStyle(
                  color: Colors.black
                ),)),
                SizedBox(width: 10,),
_start!=0? Text(
                'Resend OTP in: ${_formatTime(_start)}',
                style: const TextStyle(fontSize:15),
              ):TextButton(onPressed: (){
                setState(() {
                  _start=120;
                  startTimer();
                });
              }, child: Text('Resend the OTP',style: const TextStyle(fontSize: 15),)),
              ],
             ),
             
          
              
            ],
          ),
        ),
      ),
    );
  }
}
