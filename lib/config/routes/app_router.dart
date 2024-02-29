import 'package:client/screens/additional/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const settings = '/settings';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.settings:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SettingsScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      // case AppRoutes.editJobPage:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EditJobPage(job: args as Job?),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      // case AppRoutes.entryPage:
      //   final mapArgs = args as Map<String, dynamic>;
      //   final job = mapArgs['job'] as Job;
      //   final entry = mapArgs['entry'] as Entry?;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EntryPage(job: job, entry: entry),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      default:
        // ignore: todo
        // TODO: Throw
        return null;
    }
  }
}
