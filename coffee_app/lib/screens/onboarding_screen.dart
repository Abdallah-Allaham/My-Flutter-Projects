import 'package:coffee_app/constant.dart';
import 'package:coffee_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(24.0),
          width: .infinity,
          height: .infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image_onboarding.png'),
              fit: .cover,
            ),
          ),
          alignment: .center,
          child: Column(
            mainAxisAlignment: .end,
            children: [
              Text(
                'Fall in Love with Coffee in Blissful Delight!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: .w600,
                ),
                textAlign: .center,
              ),
              SizedBox(height: 8),
              Text(
                'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffababab),
                  fontWeight: .w400,
                ),
                textAlign: .center,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontWeight: .w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
