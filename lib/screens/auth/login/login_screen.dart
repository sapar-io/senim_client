library login;

import 'package:client/logic/general_provider.dart';
import 'package:client/screens/auth/auth_view_model.dart';
import 'package:client/screens/auth/login/login_view_model.dart';
import 'package:client/constants/sm_colors.dart';
import 'package:client/shared/utils/utils.dart';
import 'package:client/shared/widgets/sm_button.dart';
import 'package:client/shared/widgets/sm_social_button.dart';
import 'package:client/shared/widgets/sm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/auth/onboarding/onboarding_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // -- Methods --
  _loginTapped(
    BuildContext context,
    WidgetRef ref,
    String email,
    String password,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    await ref
        .watch(loginViewModelProvider)
        .signInWithEmail(email: email, password: password)
        .then((value) {
      Navigator.pop(context);
    });
  }

  _loginWithAppleTapped(WidgetRef ref) async {
    // await ref.read(loginViewModelProvider).signInWithApple();
  }

  _loginWithGoogleTapped(WidgetRef ref) async {
    // await ref.read(loginViewModelProvider).signInWithGoogle();
  }

  // -- Build --
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Responsive(
            mobile: _mobile(context, ref),
            desktop: _desktop(context, ref),
          ),
        ),
      ),
    );
  }

  // -- Widgets --
  Widget _mobile(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: _LoginForm(
          loginWithEmailTapped: ({
            required String email,
            required String password,
          }) =>
              _loginTapped(context, ref, email, password),
          loginWithAppleTapped: () => _loginWithAppleTapped(ref),
          loginWithGoogleTapped: () => _loginWithGoogleTapped(ref),
        ),
      ),
    );
  }

  Widget _desktop(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 450,
                child: _LoginForm(
                  loginWithEmailTapped: ({
                    required String email,
                    required String password,
                  }) =>
                      _loginTapped(context, ref, email, password),
                  loginWithAppleTapped:() => _loginWithAppleTapped(ref),
                  loginWithGoogleTapped: ()=> _loginWithGoogleTapped(ref),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: const OnboardingScreen(hideButtons: true),
          ),
        ),
      ],
    );
  }
}
