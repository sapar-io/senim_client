library profile;

import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/additional/profile/widgets/profile_form.dart';
import 'package:client/screens/tabbar/shared/desktop_scaffold.dart';
import 'package:client/screens/tabbar/shared/mobile_scaffold.dart';
import 'package:client/shared/widgets/sm_button.dart';
import 'package:flutter/material.dart';

part 'widgets/profile_avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileScaffold(
        title: "Мой профиль",
        content: _mobile(context),
      ),
      desktop: DesktopScaffold(
        title: "Мой профиль",
        content: _desktop(context),
      ),
    );
  }

  Widget _desktop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Персональные данные",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20.0),
        const Divider(),
        const SizedBox(height: 20.0),
        const _ProfileAvatar(),
        const SizedBox(height: 40.0),
        const ProfileForm(),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Персональные данные",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 32.0),
        const _ProfileAvatar(),
        const ProfileForm(),
      ],
    );
  }
}
