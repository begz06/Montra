 import 'package:flutter/material.dart';
import 'package:montra_app_a1/assets/constants/app_images.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/starter/onboarding/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedPage = 0;

  late PageController pageController;

  Widget item(int index) {
    bool isSelected = selectedPage == index;

    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 16),
      width: isSelected ? 16 : 8,
      height: isSelected ? 16 : 8,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? primaryColor : lightPurple),
    );
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 500,
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (newPage) {
                        setState(() {
                          selectedPage = newPage;
                        });
                      },
                      children: [
                        OnboardingPage(
                            image: AppImages.onboarding1,
                            title: 'Gain total control of your money',
                            desc:
                                'Become your own money manager and make every cent count'),
                        OnboardingPage(
                            image: AppImages.onboarding2,
                            title: 'Know where your money goes',
                            desc:
                                'Track your transaction easily,with categories and financial report '),
                        OnboardingPage(
                            image: AppImages.onboarding3,
                            title: 'Planning ahead \n',
                            desc:
                                'Setup your budget for each category so you in control'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => item(index)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (selectedPage > 0)
                    TextButton(
                        onPressed: () {
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        child: Text(
                          'Prev',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: grey),
                        ))
                  else
                    const SizedBox(),
                  TextButton(
                      onPressed: () {
                        if (selectedPage < 2) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom + 16,
            )
          ],
        ),
      );
}
