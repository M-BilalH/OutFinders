import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> verifyEmailWithToken(
  String email,
  String? token,
) async {
  // Add your function code here!
  // instantiate Supabase client
  final supabase = Supabase.instance.client;

  try {
    // call the supabase verifyOTP function
    // if successful, a response with the user and session is returned
    final AuthResponse res = await supabase.auth.verifyOTP(
      type: OtpType.signup,
      token: token,
      email: email,
    );

    // return true if session is not null (i.e. user has signed in)
    return true;
  } on AuthException catch (e) {
    // catch any authenticatino errors and print them to the console
    print(e.message);
    return false;
  } catch (error) {
    // catch any other errors
    print(error);
    return false;
  }}