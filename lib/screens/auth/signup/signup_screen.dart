import 'package:flutter/material.dart';
import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/auth/signup/widgets/signup_form.dart';
import 'package:client/screens/auth/onboarding/onboarding_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Responsive(
            mobile: _mobile(),
            desktop: _desktop(context),
          ),
        ),
      ),
    );
  }

  Widget _mobile() {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
        child: SignUpForm(),
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 450,
                child: SignUpForm(),
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
