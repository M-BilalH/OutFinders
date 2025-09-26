import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase =Supabase.instance.client;

  Future<AuthResponse> signInWithEmailAndPassword(
    String email,String password
  )async{
    return await _supabase.auth.signInWithPassword(password: password,email: email);
  }

  Future<AuthResponse> signUpWithEmailAndPassword(
    String email,String password,String username,
  )async{
    return await _supabase.auth.signUp(password: password,email: email,data: {
      'displayname': username, // this is stored in user_metadata
    },);
   
  }

  Future<void> signOut()async{
    await _supabase.auth.signOut();
  }


  String? getCurrentUserEmail(){
    final session= _supabase.auth.currentSession;
    final user =session?.user;
    return user?.email;
  }
}