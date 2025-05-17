import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postmanovich/core/inherited/app_colors.dart';
import 'package:postmanovich/core/root/root_inherited.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key, required this.router});

  final GoRouter router;

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return RootInherited(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: widget.router,
            debugShowCheckedModeBanner: false,
            locale: const Locale("ru"),
            supportedLocales: const [
              Locale("ru"),
            ],
            themeMode: ThemeMode.system,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.of(context).bs.background,
              primaryColor: AppColors.of(context).bs.brand,
              textTheme: GoogleFonts.jetBrainsMonoTextTheme(),
              brightness: Brightness.dark,
              visualDensity: VisualDensity.standard,
            ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
