import 'dart:async';

import 'package:flutter_mvvm/domain/models.dart';

import '../../base/base_view_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // stream controller outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderData;
  int _currentIndex = 0;

  // OnBoardingViewModel Inputs
  @override
  void start() {
    // view model start your job
    _sliderData = _getSliderData();
    _postDateToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = _currentIndex + 1;
    if (nextIndex == _sliderData.length) {
      return 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex - 1;
    if (previousIndex == -1) {
      return _sliderData.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDateToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

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

  void _postDateToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _sliderData[_currentIndex],
        numberOfSlides: _sliderData.length,
        currentIndex: _currentIndex,
      ),
    );
  }
}

// inputs mean that "Order" that our view model will receive from view
mixin OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  //stream controller input
  Sink get inputSliderViewObject;
}

// outputs mean that "Order" that our view model will send to view
mixin OnBoardingViewModelOutputs {
  //stream controller output
  Stream<SliderViewObject> get outputSliderViewObject;
}
