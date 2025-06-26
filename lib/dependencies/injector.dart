import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> injector() async {
  final i = GetIt.instance;

  i.registerSingleton<PessoaController>(PessoaController());
  i.registerSingleton<ThemeController>(ThemeController(
    sharedPreferences: await SharedPreferences.getInstance(),
  ));
}
