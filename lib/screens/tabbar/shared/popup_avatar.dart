import 'package:client/main.dart';
import 'package:client/logic/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupAvatar extends ConsumerStatefulWidget {
  const PopupAvatar({Key? key, required this.isMobile}) : super(key: key);

  final bool isMobile;
  
  @override
  PopupAvatarState createState() => PopupAvatarState();
}

class PopupAvatarState extends ConsumerState<PopupAvatar> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // Avatar Container
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CircleAvatar(
          radius: widget.isMobile ? 16 : 24,
          backgroundImage: const NetworkImage(
              'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
        ),
      ),
      // Menu Start
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        // Dark / Light Mode
        PopupMenuItem(
          child: ListTile(
            leading: Icon(SenimApp.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            title: Text(SenimApp.themeNotifier.value == ThemeMode.light
                ? 'Темная тема'
                : 'Светлая тема'),
            onTap: () {
              SenimApp.themeNotifier.value =
                  SenimApp.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
              Navigator.pop(context);
            },
          ),
        ),
        const PopupMenuDivider(),
        // Logout
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Выйти'),
            onTap: () {
              ref.read(authRepositoryProvider).signOut();
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
