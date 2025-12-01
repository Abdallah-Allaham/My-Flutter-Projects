import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supa_auth_flutter/screens/splash/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");

    final String? supaBaseUrl = dotenv.env["SUPABASE_URL"];
    final String? supaBaseAnonKey = dotenv.env["SUPABASE_ANON_KEY"];

    if (supaBaseUrl == null || supaBaseAnonKey == null) {
      return;
    }

    await Supabase.initialize(url: supaBaseUrl, anonKey: supaBaseAnonKey);
  } catch (e) {
    print("====================Catch Error ${e.toString()}");
  }
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
