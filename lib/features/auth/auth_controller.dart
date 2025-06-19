import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

/// Signup Function
Future<String?> signUpUser(String email, String password) async {
  final response = await supabase.auth.signUp(email: email, password: password);
  if (response.user != null) {
    return null; // success
  } else {
    return response.error?.message;
  }
}

extension on AuthResponse {
  get error => null;
}

/// Login Function
Future<String?> loginUser(String email, String password) async {
  final response = await supabase.auth.signInWithPassword(
    email: email,
    password: password,
  );
  if (response.user != null) {
    return null; // success
  } else {
    return response.error?.message;
  }
}

/// Logout Function
Future<void> logoutUser() async {
  await supabase.auth.signOut();
}
