import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supa_auth_flutter/screens/signup/signup_email_password_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import '../home_screen.dart';

class SignupOptionsScreen extends StatefulWidget {
  const SignupOptionsScreen({super.key});

  @override
  State<SignupOptionsScreen> createState() => _SignupOptionsScreenState();
}

class _SignupOptionsScreenState extends State<SignupOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Options", style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ListTile(
              title: Text(
                "Email And Password",
                style: TextStyle(fontSize: 20.sp),
              ),
              leading: Icon(Icons.email, size: 30.sp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupEmailPasswordScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Magic Link", style: TextStyle(fontSize: 20.sp)),
              leading: Icon(Icons.link, size: 30.sp),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Phone Number (SMS)",
                style: TextStyle(fontSize: 20.sp),
              ),
              leading: Icon(Icons.phone, size: 30.sp),
              onTap: () {},
            ),
            ListTile(
              title: Text("With Google", style: TextStyle(fontSize: 20.sp)),
              leading: Icon(Icons.g_mobiledata, size: 30.sp),
              onTap: () async {
                try {
                  /// Web Client ID that you registered with Google Cloud.
                  const webClientId =
                      '849912722517-9hmmiui36j9inrskihidprjsgp8hb6dl.apps.googleusercontent.com';

                  /// iOS Client ID that you registered with Google Cloud.
                  const iosClientId =
                      '849912722517-hk4247loeti15gp9p718g7c7gg2nm9pc.apps.googleusercontent.com';

                  // Google sign in on Android will work without providing the Android
                  // Client ID registered on Google Cloud.

                  final GoogleSignIn signIn = GoogleSignIn.instance;

                  // At the start of your app, initialize the GoogleSignIn instance
                  unawaited(
                    signIn.initialize(
                      clientId: iosClientId,
                      serverClientId: webClientId,
                    ),
                  );

                  // Perform the sign in
                  final googleAccount = await signIn.authenticate();
                  final googleAuthorization = await googleAccount
                      .authorizationClient
                      .authorizationForScopes(['email']);
                  final googleAuthentication = googleAccount.authentication;
                  final idToken = googleAuthentication.idToken;
                  final accessToken = googleAuthorization!.accessToken;

                  if (idToken == null) {
                    throw 'No ID Token found.';
                  }

                  await supabase.auth.signInWithIdToken(
                    provider: OAuthProvider.google,
                    idToken: idToken,
                    accessToken: accessToken,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
