import 'package:flutter/cupertino.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String desc;

  const OnboardingPage(
      {required this.image, required this.title, required this.desc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset(
              image,
              height: 310,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: mainDark),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: grey,
                  ),
                )
              ],
            ),
          )
        ],
      );
}
