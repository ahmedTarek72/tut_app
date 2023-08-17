import 'package:flutter/material.dart';
import 'package:tut_app/presentation/forgot_password/forgot_password_view.dart';
import 'package:tut_app/presentation/login/login_view.dart';
import 'package:tut_app/presentation/main/main_view.dart';
import 'package:tut_app/presentation/onboarding/onboarding_view.dart';
import 'package:tut_app/presentation/register/register_view.dart';
import 'package:tut_app/presentation/splash/splash_view.dart';
import 'package:tut_app/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SplashView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LoginVIew(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const RegisterView(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const OnboardingView(),
        );
      case Routes.mainRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const MainView(),
          settings: settings,
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const StoreDetailsView(),
          settings: settings,
        );
      default:
        return unDefinedView();
    }
  }

  static Route unDefinedView() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(" No Route Found"),
        ),
        body: const Center(
          child: Text("No Route Found "),
        ),
      ),
    );
  }
}
