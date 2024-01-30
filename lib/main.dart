import 'package:film_q/constants/colors.dart';
import 'package:film_q/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FilmQ());
}

class FilmQ extends StatefulWidget {
  const FilmQ({super.key});

  @override
  State<FilmQ> createState() => _FilmQState();
}

class _FilmQState extends State<FilmQ> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const WelcomeScreen(),
    );
  }
}

ThemeData darkTheme = ThemeData(
  primaryColor: white,

  fontFamily: "Shabnam",
  hintColor: darkGray,
  scaffoldBackgroundColor: primaryBlack,
  iconTheme: const IconThemeData(color: Colors.black),
  dividerColor: darkGray,
  dividerTheme: const DividerThemeData(color: darkGray),

  appBarTheme: const AppBarTheme(
    backgroundColor: primaryBlack,
    surfaceTintColor: Colors.transparent,
  ),

  colorScheme: const ColorScheme.dark(
    shadow: primaryBlack,
    primary: white,
    primaryContainer: secondaryBlack,
  ),
  // -------------------------------------------------------
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: white,
      backgroundColor: yellow,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  cardTheme: const CardTheme(
    color: secondaryBlack,
    surfaceTintColor: Colors.transparent,
    shadowColor: primaryBlack,
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: white,
  )),
);
