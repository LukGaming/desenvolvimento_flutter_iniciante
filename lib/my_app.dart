import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/router.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = GetIt.instance<ThemeController>();
  @override
  void initState() {
    super.initState();
    themeController.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: Routes.initialRoute,
          routes: routes,
          title: 'Flutter Demo',
          theme: themeController.darkTheme == false ? lightTheme : darkTheme,
        );
      },
    );
  }
}
