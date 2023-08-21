import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tut_app/presentation/resources/assets_manager.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:tut_app/presentation/resources/values_manager.dart';

import '../../../domain/models.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppStrings.onBoardingHeader1,
            description: AppStrings.onBoardingBody1,
            image: ImageAssets.splashLogo1),
        SliderObject(
            title: AppStrings.onBoardingHeader2,
            description: AppStrings.onBoardingBody2,
            image: ImageAssets.splashLogo2),
        SliderObject(
            title: AppStrings.onBoardingHeader3,
            description: AppStrings.onBoardingBody3,
            image: ImageAssets.splashLogo3),
        SliderObject(
            title: AppStrings.onBoardingHeader4,
            description: AppStrings.onBoardingBody4,
            image: ImageAssets.splashLogo4),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        bottomSheet: Container(
          height: AppSize.s100,
          color: ColorManager.white,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p16),
                    child: TextButton(
                      child: Text(
                        AppStrings.skip,
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.end,
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                    ),
                  )),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                color: ColorManager.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.white,
                      ),
                    ),
                    const Spacer(),
                    for (int i = 0; i < _list.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Container(
                          height: AppSize.s8,
                          width: AppSize.s8,
                          decoration: BoxDecoration(
                              color: buildProperCircle(i),
                              borderRadius: BorderRadius.circular(AppSize.s4)),
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        if (_currentPageIndex == _list.length - 1) {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute);
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorManager.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: Hero(
          tag: "2",
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              controller: _pageController,
              itemCount: _list.length,
              itemBuilder: (context, index) => OnBoardingPage(
                    sliderObject: _list[index],
                  )),
        ));
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  Color buildProperCircle(int index) {
    if (_currentPageIndex == index) {
      return ColorManager.white;
    } else {
      return ColorManager.grey.withOpacity(.5);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnBoardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: AppSize.s60,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const SizedBox(
          height: AppSize.s12,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(sliderObject.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        SvgPicture.asset(
          sliderObject.image,
        ),
      ],
    );
  }
}
