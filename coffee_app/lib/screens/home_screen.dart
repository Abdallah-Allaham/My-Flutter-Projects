import 'package:coffee_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: .all(16),
                      fillColor: Color(0xffe9e9e9),
                      hintText: 'Search Coffee',
                      border: OutlineInputBorder(
                        borderRadius: .circular(12),
                        borderSide: .none,
                      ),
                      enabledBorder: customOutlineInputBorder(),
                      focusedBorder: customOutlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                        borderRadius: .circular(12),
                        borderSide: BorderSide(color: Colors.red.shade600),
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xffa2a2a2),
                        fontSize: 14,
                        fontWeight: .w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          colorFilter: ColorFilter.mode(
                            Color(0xff594040),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/grid.svg'),
                  style: IconButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 31),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder customOutlineInputBorder() {
  return OutlineInputBorder(borderRadius: .circular(12), borderSide: .none);
}

/// another way to add icon
// Container(
// decoration: BoxDecoration(
// color: Color(0xffc67c4e),
// borderRadius: .circular(12),
// ),
// child: IconButton(
// onPressed: () {},
// icon: SvgPicture.asset('assets/images/grid.svg'),
// ),
// ),
