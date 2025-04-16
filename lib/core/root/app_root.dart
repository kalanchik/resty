import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:postmanovich/features/test/view/test_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("ru"),
      supportedLocales: const [Locale("ru")],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: TestScreen(),
    );
  }
}
