import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'features/signup/presentation/pages/signup_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  print("/////////////////////////////////////////////////");
  print(await SmsAutoFill().getAppSignature);
  print("/////////////////////////////////////////////////");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SignupPage(),
    );
  }
}
