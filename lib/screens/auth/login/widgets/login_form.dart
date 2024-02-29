part of login;

class _LoginForm extends ConsumerStatefulWidget {
  final Function({
    required String email,
    required String password,
  }) loginWithEmailTapped;
  final VoidCallback loginWithAppleTapped;
  final VoidCallback loginWithGoogleTapped;

  const _LoginForm({
    required this.loginWithEmailTapped,
    required this.loginWithAppleTapped,
    required this.loginWithGoogleTapped,
    Key? key,
  }) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<_LoginForm> {
  // -- Variables --
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // -- Dispose --
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // -- Methods --
  void _loginForm(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      widget.loginWithEmailTapped(email: email, password: password);
    } else {
      Utils.showSnackBar("Заполните форму!");
    }
  }

  void _onRememberMeChanged(bool? newValue) => setState(
        () {
          _rememberMe = newValue ?? false;

          // if (_rememberMe) {
          //   // : Here goes your functionality that remembers the user.
          // } else {
          //   // : Forget the user
          // }
        },
      );

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Вход в свой аккаунт",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
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
          _rememberMeCheckBox(context),
          const SizedBox(height: 32),
          SMButton(
            style: SMButtonStyle.primary,
            title: "Войти через почту",
            onPressed: () => _loginForm(context),
          ),
          const SizedBox(height: 32),
          _googleAndAppleButtons(
            context: context,
            googleTap: widget.loginWithGoogleTapped,
            appleTap: widget.loginWithAppleTapped,
          ),
          const SizedBox(height: 32),
          _openSignUp(context),
        ],
      ),
    );
  }

  // -- Widgets --
  Widget _rememberMeCheckBox(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          value: _rememberMe,
          onChanged: _onRememberMeChanged,
        ),
        GestureDetector(
          child: const Text("Запомнить меня"),
          onTap: () {
            _onRememberMeChanged(!_rememberMe);
          },
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Забыли пароль?",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
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

  Widget _openSignUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Нет аккаунта?  ",
          style: TextStyle(color: SMColors.greyscale.shade600),
        ),
        Consumer(
          builder: (context, ref, _) {
            return GestureDetector(
              onTap: () {
                ref.watch(authViewModelProvider.notifier).toggle();
              },
              child: Text(
                "Создать аккаунт",
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
