import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> insertUser(
  String firstName,
  String lastName,
  String contactNumber,
  String address,
  String birthDate,
) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.from('users').insert({
      'first_name': firstName,
      'last_name': lastName,
      'contact_number': contactNumber,
      'address': address,
      'birth_date': birthDate,
    });
    print('Insert user response: $response');
  } catch (e) {
    print('Error inserting user: $e');
  }
}

Future<void> insertAuth(String email, String password) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
    print('Sign up response: $response');
  } catch (e) {
    print('Error signing up: $e');
  }
}
