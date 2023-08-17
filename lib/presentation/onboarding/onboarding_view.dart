import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/color_manager.dart';
import 'package:tut_app/presentation/resources/font_manager.dart';
import 'package:tut_app/presentation/resources/styles_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            tag: "2",
            child: Center(
              child: Text(
                "Onboarding View",
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.s16),
              ),
            )));
  }
}
