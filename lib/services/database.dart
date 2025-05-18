import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> signUpAndInsertUser({
  required String email,
  required String password,
  required String firstName,
  required String lastName,
  required String contactNumber,
  required String address,
  required String birthDate,
}) async {
  final supabase = Supabase.instance.client;

  try {
    final signUpResponse = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    print('Sign up response: $signUpResponse');
    final user = signUpResponse.user;
    // Check if signup succeeded before inserting user info
    if (signUpResponse.user != null) {
      final insertResponse = await supabase.from('users').insert({
        'user_id': user!.id,
        'first_name': firstName,
        'last_name': lastName,
        'contact_number': contactNumber,
        'address': address,
        'birth_date': birthDate,
      });
      print('Insert user response: $insertResponse');
      return true;
    } else {
      print('Sign up failed, user is null');
      return false;
    }
  } catch (e) {
    print('Error during sign up and insert: $e');
    return false;
  }
}
