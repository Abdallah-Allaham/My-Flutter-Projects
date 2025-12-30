import 'package:coffee_app/constant.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:coffee_app/screens/onboarding_screen.dart';
import 'package:coffee_app/screens/product_details.dart';
import 'package:coffee_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: kFontFamily,
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SplashScreen(),
      routes: {
        "/":(context) => SplashScreen(),//  / means this is the first page
        "/onboarding": (context) => OnboardingScreen(),
        "/home": (context) => HomeScreen(),
        "/product-details": (context) => ProductDetails(),
      },
    );
  }
}
