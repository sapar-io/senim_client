import 'package:client/logic/general_provider.dart';
import 'package:client/screens/auth/auth_view_model.dart';
import 'package:client/shared/widgets/sm_phone_textfield.dart';
import 'package:client/shared/widgets/sm_social_button.dart';
import 'package:flutter/material.dart';
import 'package:client/shared/widgets/shared.dart';
import 'package:client/constants/sm_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends ConsumerState<SignUpForm> {
  // MARK: - Internal Variables
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // MARK: - Dispose
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // MARK: - Internal Methods

  void _onRememberMeChanged(bool? newValue) => setState(() {
        _rememberMe = newValue ?? false;

        if (_rememberMe) {
          // : Here goes your functionality that remembers the user.
        } else {
          // : Forget the user
        }
      });

  void _loginForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      await ref
          .watch(authRepositoryProvider)
          .signUp(email, password)
          .then((value) {
        Navigator.pop(context);
        _showDialog(name: _emailController.text);
      });
    } else {
      _showMessage(message: "Заполните форму!");
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: SMColors.errorBase,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Registration successful",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          content: Text(
            "$name is now a verified register form",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Verified",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18.0,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  // MARK: - Main Build

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Создай аккаунт Senim",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          SMTextField(
            type: SMTextFieldType.name,
            controller: _nameController,
            focus: true,
          ),
          const SizedBox(height: 24),
          SMPhoneTextField(controller: _phoneController),
          const SizedBox(height: 12),
          SMTextField(
            type: SMTextFieldType.email,
            controller: _emailController,
            focus: true,
          ),
          const SizedBox(height: 24),
          SMTextField(
            type: SMTextFieldType.password,
            controller: _passwordController,
          ),
          const SizedBox(height: 24),
          _acceptTerms(context),
          const SizedBox(height: 32),
          SMButton(
            style: SMButtonStyle.primary,
            title: "Создать аккаунт",
            onPressed: _loginForm,
          ),
          const SizedBox(height: 32),
          _googleAndAppleButtons(
            context: context,
            googleTap: ref.watch(authRepositoryProvider).signInWithGoogle,
            appleTap: ref.watch(authRepositoryProvider).signInWithApple,
          ),
          const SizedBox(height: 32),
          _openLogin(context),
        ],
      ),
    );
  }

  // MARK: - Components

  Widget _acceptTerms(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: _rememberMe,
          onChanged: _onRememberMeChanged,
        ),
        GestureDetector(
          child: const Text("Регистрируясь, вы соглашаетесь с Условиями"),
          onTap: () {
            _onRememberMeChanged(!_rememberMe);
          },
        )
      ],
    );
  }

  Widget _googleAndAppleButtons({
    required BuildContext context,
    required VoidCallback googleTap,
    required VoidCallback appleTap,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1.0,
                color: Theme.of(context).dividerColor,
              ),
            ),
            const SizedBox(width: 24.0),
            Text(
              "Или войти через",
              style: TextStyle(color: SMColors.greyscale.shade600),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Container(
                height: 1.0,
                color: Theme.of(context).dividerColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            SMSocialButton(
              title: "Google",
              iconData: Icons.mail,
              onPressed: googleTap,
            ),
            const SizedBox(width: 16.0),
            FutureBuilder<Object>(
              future: SignInWithApple.isAvailable(),
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Expanded(
                    child: SignInWithAppleButton(
                      height: 56.0,
                      text: 'Apple',
                      style: Theme.of(context).brightness == Brightness.dark
                          ? SignInWithAppleButtonStyle.black
                          : SignInWithAppleButtonStyle.whiteOutlined,
                      onPressed: appleTap,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        )
      ],
    );
  }

  Widget _openLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Уже есть аккаунт?  ",
          style: TextStyle(color: SMColors.greyscale.shade600),
        ),
        Consumer(
          builder: (context, ref, _) {
            return GestureDetector(
              onTap: () {
                ref.watch(authViewModelProvider.notifier).toggle();
              },
              child: Text(
                // "Создать аккаунт",
                "Войти",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
