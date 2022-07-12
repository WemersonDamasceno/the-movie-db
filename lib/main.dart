import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movies_db/app/utils/custom_colors.dart';
import 'package:the_movies_db/app/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movies DB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro",
        primaryColor: CustomColors.tmdbDarkBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: CustomColors.tmdbDarkBlue,
          secondary: CustomColors.tmdbLighterGreen,
        ),
      ),
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      home: const HomePage(),
    );
  }
}
