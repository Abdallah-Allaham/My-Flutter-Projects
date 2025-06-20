import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm/presentation/resources/assets_manager.dart';

import '../resources/constant_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3),() {
  //     Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  //   },);
  // }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context,Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
