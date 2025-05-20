import 'package:supabase_flutter/supabase_flutter.dart';

Future<bool> logInUser({
  required String email,
  required String password,
}) async {
  final supabase = Supabase.instance.client;
  try {
    final logInResponse = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return logInResponse.user != null;
  } catch (e) {
    print('Error during log in: $e');
    return false;
  }
}

Future<void> logOutUser() async {
  final supabase = Supabase.instance.client;
  try {
    await supabase.auth.signOut();
  } catch (e) {
    print('Error during log out: $e');
  }
}

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

Future<Map<String, String>> fetchUserData() async {
  final supabase = Supabase.instance.client;
  final user = supabase.auth.currentUser;

  if (user == null) {
    throw Exception("User not logged in");
  }

  try {
    final response =
        await supabase
            .from('users')
            .select(
              'first_name, last_name, birth_date, contact_number, address',
            )
            .eq('user_id', user.id)
            .single();

    return {
      'firstName': response['first_name']?.toString() ?? '',
      'lastName': response['last_name']?.toString() ?? '',
      'birthDate': response['birth_date']?.toString() ?? '',
      'contactNumber': response['contact_number']?.toString() ?? '',
      'address': response['address']?.toString() ?? '',
      'email': user.email ?? '',
    };
  } catch (e) {
    print('Error during fetch user data: $e');
    throw Exception('Error fetching user data: $e');
  }
}
