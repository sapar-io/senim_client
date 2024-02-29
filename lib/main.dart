import 'package:client/config/routes/app_router.dart';
import 'package:client/logic/shared_preferences_service.dart';
import 'package:client/screens/auth/auth_screen.dart';
import 'package:client/screens/auth/widgets/auth_widget.dart';
import 'package:client/screens/tabbar/shared/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/utils/app_scrollable.dart';
import 'package:client/config/themes/app_dark_theme.dart';
import 'package:client/config/themes/app_theme.dart';
import 'package:client/shared/utils/utils.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:client/firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  // Ждем инициализации Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализируем главный метод Firebase в проекте
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Служба общих настроек - локальные данные
  final sharedPreferences = await SharedPreferences.getInstance();

  // Запускаем приложение в обертке с провайдером Riverpod
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      )
    ],
    child: const SenimApp(),
  ));
}

class SenimApp extends StatelessWidget {
  const SenimApp({Key? key}) : super(key: key);

  // Создаем уведомителя - который будет вызываться при смене темы (темной - светлой)
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Senim.me',
          theme: SMLightThemeData,
          darkTheme: SMDarkThemeData,
          themeMode: currentMode,
          scrollBehavior: SMAppScrollBehavior(),
          scaffoldMessengerKey: Utils.messengerKey,
          home: AuthWidget(
            nonSignedInBuilder: (_) => const AuthScreen(),
            signedInBuilder: (_) => const DashboardScreen(),
          ),
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        );
      },
    );
  }
}
