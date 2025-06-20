import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm/presentation/resources/values_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _sliderData = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      title: AppString.onBoardingTitle1,
      subTitle: AppString.onBoardingSubTitle1,
      image: ImageAssets.onboardingLogo1,
    ),
    SliderObject(
      title: AppString.onBoardingTitle2,
      subTitle: AppString.onBoardingSubTitle2,
      image: ImageAssets.onboardingLogo2,
    ),
    SliderObject(
      title: AppString.onBoardingTitle3,
      subTitle: AppString.onBoardingSubTitle3,
      image: ImageAssets.onboardingLogo3,
    ),
    SliderObject(
      title: AppString.onBoardingTitle4,
      subTitle: AppString.onBoardingSubTitle4,
      image: ImageAssets.onboardingLogo4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          // like time or charge because the color is white
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _sliderData.length,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingView(sliderObject: _sliderData[index]);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(AppString.skip, textAlign: TextAlign.end),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingView extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnboardingView({super.key, required SliderObject sliderObject})
    : _sliderObject = sliderObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s40),
        Image.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
