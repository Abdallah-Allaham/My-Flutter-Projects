import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supa_auth_flutter/main.dart';

import '../home_screen.dart';

class SignupEmailPasswordScreen extends StatefulWidget {
  const SignupEmailPasswordScreen({super.key});

  @override
  State<SignupEmailPasswordScreen> createState() =>
      _SignupEmailPasswordScreenState();
}

class _SignupEmailPasswordScreenState extends State<SignupEmailPasswordScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;

  signup({required String email, required String password}) async {
    isLoading = true;
    setState(() {});

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email And Password", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.h,
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Enter your email",
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  controller: password,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        isObscure = !isObscure;
                        setState(() {});
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    hintText: "Enter your password",
                    icon: Icon(Icons.password_sharp),
                  ),
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          signup(
                            email: email.text.trim(),
                            password: password.text,
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
