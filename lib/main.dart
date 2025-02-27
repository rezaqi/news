import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news/core/class/check_net.dart';
import 'package:news/core/static/app_theme.dart';
import 'package:news/model/source_model_hive.dart';
import 'package:news/provider/myprovider.dart';
import 'package:news/screen/home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CheckNet().init();
  Hive.initFlutter();
  Hive.registerAdapter(SourceModelHiveAdapter());
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: Locale("en"),
    child: ChangeNotifierProvider(
        create: (context) => MyProvider(), child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      darkTheme: themeDark,
      themeMode: provider.themeMode,
      home: Home(),
    );
  }
}
