import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/widgets/button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScrrens extends StatefulWidget {
  const OnboardingScrrens({super.key});

  @override
  State<OnboardingScrrens> createState() => _OnboardingScrrensState();
}

class _OnboardingScrrensState extends State<OnboardingScrrens> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> title = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> subTitle = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/images/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/images/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/images/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) => {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  )
                },
              ),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 97,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kBlackSoftColor,
              ),
              child: Column(
                children: [
                  Text(
                    title[currentIndex],
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subTitle[currentIndex],
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: 'Get Started',
                              color: kBlueDarkColor,
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/sign-up', (route) => false);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextButton(
                              title: 'Sign In',
                              color: kBlackSoftColor,
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/sign-in', (route) => false);
                              },
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? kBlueDarkColor
                                    : kGraySoftColor,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? kBlueDarkColor
                                    : kGraySoftColor,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 2
                                    ? kBlueDarkColor
                                    : kGraySoftColor,
                              ),
                            ),
                            const Spacer(),
                            CustomFilledButton(
                              title: 'Continue',
                              color: kBlueDarkColor,
                              width: 150,
                              onPressed: () {
                                carouselController.nextPage();
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
