// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:tut_app/domain/models.dart';

import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goToNextPage() {}

  @override
  void goToPreviousPage() {}

  @override
  void onPageChanged(int index) {}
  OnBoardingViewModel model = OnBoardingViewModel();

  // data will be inputted to view model
  @override
  Sink get inputSliderViewModel => throw UnimplementedError();

  // data will be outputted from view model
  @override
  Stream get outputSliderViewModel => throw UnimplementedError();
}

// inputs means orders from view to view model
mixin OnBoardingViewModelInputs {
  void goToNextPage();
  void goToPreviousPage();
  void onPageChanged(int index);

  // input data to view
  Sink get inputSliderViewModel;
}

mixin OnBoardingViewModelOutputs {
  // output data from view model to view
  Stream get outputSliderViewModel;
}
