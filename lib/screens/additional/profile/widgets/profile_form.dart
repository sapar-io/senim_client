import 'package:client/shared/utils/responsive.dart';
import 'package:client/shared/widgets/sm_button.dart';
import 'package:client/shared/widgets/sm_phone_textfield.dart';
import 'package:client/shared/widgets/sm_textfield.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _loginForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      // _showMessage(message: "Заполните форму!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _mobile(context),
      desktop: _desktop(context),
    );
  }

  Widget _mobile(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          SMTextField(
            type: SMTextFieldType.name,
            controller: _nameController,
            focus: true,
          ),
          const SizedBox(height: 24),
          SMTextField(
            type: SMTextFieldType.surname,
            controller: _surnameController,
            focus: true,
          ),
          const SizedBox(height: 24),
          SMPhoneTextField(controller: _phoneController),
          const SizedBox(height: 24),
          SMTextField(
            type: SMTextFieldType.email,
            controller: _emailController,
            focus: true,
          ),
          const SizedBox(height: 32),
          SMButton(
            style: SMButtonStyle.primary,
            title: "Сохранить",
            onPressed: _loginForm,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: SMTextField(
                  type: SMTextFieldType.name,
                  controller: _nameController,
                  focus: true,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SMTextField(
                  type: SMTextFieldType.surname,
                  controller: _surnameController,
                  focus: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SMTextField(
                  type: SMTextFieldType.email,
                  controller: _emailController,
                  focus: true,
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: SMPhoneTextField(controller: _phoneController),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SMButton(
            style: SMButtonStyle.primary,
            width: SMButtonWidth.content,
            title: "Сохранить",
            onPressed: _loginForm,
          ),
          // const SizedBox(height: 32),
        ],
      ),
    );
  }
}
