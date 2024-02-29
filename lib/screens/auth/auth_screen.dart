import 'package:flutter/material.dart';
import 'package:client/screens/auth/auth_view_model.dart';
import 'package:client/screens/auth/login/login_screen.dart';
import 'package:client/screens/auth/signup/signup_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      return ref.watch(authViewModelProvider)
          ? const LoginScreen()
          : const SignUpScreen();
    });
  }
}