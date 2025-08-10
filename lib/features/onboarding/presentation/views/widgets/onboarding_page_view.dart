import 'package:decor_nest/core/helper/assets.dart';
import 'package:decor_nest/features/onboarding/presentation/views/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<bool> lastPageNotifier;

  final _pagesData = const [
    (
      image: Assets.imagesOnBoardingOne,
      description:
          'View And Experience Furniture With The Help Of Augmented Reality',
    ),
    (
      image: Assets.imagesOnBoardingTwo,
      description: 'Design Your Space With Augmented Reality By Creating Room',
    ),
    (
      image: Assets.imagesOnBoardingThree,
      description:
          'Explore Top Class Furniture As Per Your Requirements & Choice',
    ),
  ];

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.lastPageNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: _pagesData.length,
      onPageChanged: (index) {
        lastPageNotifier.value = (index == _pagesData.length - 1);
      },
      itemBuilder: (_, index) {
        return OnboardingPage(
          image: _pagesData[index].image,
          description: _pagesData[index].description,
        );
      },
    );
  }
}
