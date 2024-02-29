import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/tabbar/shared/desktop_scaffold.dart';
import 'package:client/screens/tabbar/shared/mobile_scaffold.dart';
import 'package:flutter/material.dart';

class BrokerageScreen extends StatefulWidget {
  const BrokerageScreen({Key? key}) : super(key: key);

  @override
  State<BrokerageScreen> createState() => _BrokerageScreenState();
}

class _BrokerageScreenState extends State<BrokerageScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileScaffold(
        title: "Брокерство",
        content: _mobile(context),
      ),
      desktop: DesktopScaffold(
        title: "Брокерство",
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
          "Добро пожаловать",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20.0),
        const Divider(),
        const SizedBox(height: 20.0),
        const Text("Краткие данные"),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/settings'),
          child: const Text("Настройки"),
        )
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Добро пожаловать",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        const Text("Краткие данные"),
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/settings'),
          child: const Text("Настройки"),
        )
      ],
    );
  }
}
