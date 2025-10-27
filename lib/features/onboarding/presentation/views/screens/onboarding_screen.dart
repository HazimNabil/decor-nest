import 'package:decor_nest/core/constants/cache_constants.dart';
import 'package:decor_nest/core/helper/cache_helper.dart';
import 'package:decor_nest/core/widgets/custom_button.dart';
import 'package:decor_nest/features/auth/presentation/views/screens/login_screen.dart';
import 'package:decor_nest/features/onboarding/presentation/views/widgets/dot_indicator.dart';
import 'package:decor_nest/features/onboarding/presentation/views/widgets/onboarding_buttons.dart';
import 'package:decor_nest/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:decor_nest/core/helper/extensions.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  static const path = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  late final ValueNotifier<bool> _lastPageNotifier;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _lastPageNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    _lastPageNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 87 * context.heightRatio),
              Flexible(
                flex: 10,
                child: OnboardingPageView(
                  pageController: _pageController,
                  lastPageNotifier: _lastPageNotifier,
                ),
              ),
              SizedBox(height: 24 * context.heightRatio),
              ListenableBuilder(
                listenable: _pageController,
                builder: (_, _) {
                  return DotIndicator(
                    currentIndex: _pageController.page?.round() ?? 0,
                  );
                },
              ),
              const Spacer(),
              ValueListenableBuilder(
                valueListenable: _lastPageNotifier,
                builder: _onboardingButtonsBuilder,
              ),
              SizedBox(height: 32 * context.heightRatio),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onboardingButtonsBuilder(_, isLastPage, _) {
    if (isLastPage) {
      return CustomButton(
        text: 'Get Started',
        color: context.primaryColor,
        onPressed: () async {
          await CacheHelper.setData<bool>(CacheConstants.isFirstTime, false);
          if (mounted) context.pushReplacement(LoginScreen.path);
        },
      );
    } else {
      return OnboardingButtons(pageController: _pageController);
    }
  }
}
