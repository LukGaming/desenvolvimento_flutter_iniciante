import 'package:desenvolvimento_flutter_iniciante/dependencies/injector.dart';
import 'package:desenvolvimento_flutter_iniciante/my_app.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(const MyApp());
}
