import 'package:client/config/themes/app_custom_theme.dart';
import 'package:client/screens/tabbar/shared/popup_avatar.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatefulWidget {
  final String title;
  final Widget content;

  const MobileScaffold({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [PopupAvatar(isMobile: true)],
      ),
      body: Container(
        color: Theme.of(context).own().dashboardBackground,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).own().dashboardBackground,
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).own().dashboardSidebarBackground,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: widget.content,
            ),
          ],
        ),
      ),
    );
  }
}
