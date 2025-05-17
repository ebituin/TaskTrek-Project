import 'package:supabase_flutter/supabase_flutter.dart';

void insertUser(String user) async {
  
  final supabase = Supabase.instance.client;

  final response = await supabase.from('users').insert({
    'user': user
  });
  print(response);
}