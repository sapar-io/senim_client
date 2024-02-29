import 'package:client/config/themes/app_custom_theme.dart';
import 'package:client/constants/sm_colors.dart';
import 'package:client/screens/tabbar/shared/popup_avatar.dart';
import 'package:flutter/material.dart';

class DesktopScaffold extends StatefulWidget {
  final String title;
  final Widget content;

  const DesktopScaffold({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Страница",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: SMColors.greyscale.shade500,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(widget.title),
            ],
          ),
        ),
        actions: const [PopupAvatar(isMobile: false)],
        toolbarHeight: 96.0,
      ),
      body: Container(
        color: Theme.of(context).own().dashboardBackground,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).own().dashboardBackground,
            ),
            Container(
              padding: const EdgeInsets.all(32.0),
              width: double.infinity,
              margin: const EdgeInsets.all(32.0),
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
