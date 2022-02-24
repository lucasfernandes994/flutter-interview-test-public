import 'package:core/resources/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/character_list/character_list_view.dart';

import 'module/module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.black,
      ),
    );
    return MaterialApp(
      title: 'Rick and Morty',
      navigatorKey: navigatorKey,
      theme: Themes.appTheme(context),
      home: locator.get<CharacterListView>(),
    );
  }
}
