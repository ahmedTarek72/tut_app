import '../../base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goToNextPage() {

  }

  @override
  void goToPreviousPage() {

  }

  @override
  void onPageChanged(int index) {
    
  }
  OnBoardingViewModel model = OnBoardingViewModel();
}

// inputs means orders from view to view model
mixin OnBoardingViewModelInputs {
  void goToNextPage();
  void goToPreviousPage();
  void onPageChanged(int index);
}

mixin OnBoardingViewModelOutputs {}
