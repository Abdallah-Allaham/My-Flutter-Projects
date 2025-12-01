import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = supabase.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supabase Auth", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.h,
              children: [
                Text("Home Screen", style: TextStyle(fontSize: 20.sp)),
                user != null
                    ? Text(
                        "Welcome ${user!.email ?? user!.phone}",
                        style: TextStyle(fontSize: 20.sp),
                      )
                    : Text("Welcome Guest"),
                user != null
                    ? Text(
                        "Your ID is ${supabase.auth.currentUser!.id}",
                        softWrap: true,
                      )
                    : Container(),
                ElevatedButton(
                  onPressed: () async {
                    if (user != null) await supabase.auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Text("Sign Out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
