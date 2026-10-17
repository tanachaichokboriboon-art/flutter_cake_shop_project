import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(

    FlutterCakeShopProject(),
  );
}

class FlutterCakeShopProject extends StatefulWidget {
  const FlutterCakeShopProject({super.key});

  @override
  State<FlutterCakeShopProject> createState() => _FlutterCakeShopProjectState();
}

class _FlutterCakeShopProjectState extends State<FlutterCakeShopProject> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: GoogleFonts.kanit().fontFamily,
          fontFamilyFallback: GoogleFonts.kanit().fontFamilyFallback,
        ),
      ),
    );
  }
}
