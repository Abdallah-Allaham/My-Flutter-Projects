import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supa_auth_flutter/screens/home_screen.dart';
import 'package:supa_auth_flutter/screens/login/login_options_screen.dart';
import 'package:supa_auth_flutter/screens/signup/signup_options_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Supabase Auth"), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20.h,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupOptionsScreen(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up Options",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginOptionsScreen(),
                    ),
                  );
                },
                child: Text("Login Options", style: TextStyle(fontSize: 20.sp)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Guest", style: TextStyle(fontSize: 20.sp)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
