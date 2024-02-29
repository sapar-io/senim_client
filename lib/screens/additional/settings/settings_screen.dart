import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/tabbar/shared/desktop_scaffold.dart';
import 'package:client/screens/tabbar/shared/mobile_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileScaffold(
        title: "hi settings",
        content: _mobile(context),
      ),
      desktop: DesktopScaffold(
        title: "hi settings",
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
          "Настройки",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20.0),
        const Divider(),
        const SizedBox(height: 20.0),
        const Text("Смени тему"),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Настройки",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        const Text("Смени тему")
      ],
    );
  }
}
