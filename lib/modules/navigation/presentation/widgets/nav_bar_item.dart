import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/navigation/model/navbar.dart';

class NavItemWidget extends StatelessWidget {
  final int currentIndex;
  final NavBar navBar;

  const NavItemWidget({
    required this.navBar,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 11),
      child: Column(
        children: [
          if (navBar.networkIcon != null && navBar.networkIcon!.isNotEmpty)
            Center(
              child: currentIndex != navBar.id
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        navBar.networkIcon!,
                        loadingBuilder: (c, child, progress) {
                          if (progress == null) {
                            return child;
                          } else {
                            return SvgPicture.asset(
                              navBar.icon,
                              height: 32,
                              width: 32,
                              color: Colors.grey,
                            );
                          }
                        },
                        errorBuilder: (a, b, c) {
                          return SvgPicture.asset(
                            navBar.icon,
                            height: 32,
                            width: 32,
                            color:
                                currentIndex == navBar.id ? null : Colors.grey,
                          );
                        },
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    )
                  : SvgPicture.asset(
                      navBar.icon,
                      height: 32,
                      width: 32,
                      color: currentIndex == navBar.id ? null : Colors.grey,
                    ),
            )
          else
            Center(
              child: SvgPicture.asset(
                navBar.icon,
                color: currentIndex == navBar.id ? primaryColor : Colors.grey,
                height: 32,
                width: 32,
              ),
            ),
          const SizedBox(
            height: 4,
          ),
          if (navBar.label != null)
            Text(
              navBar.label!,
              style: TextStyle(
                  color: currentIndex == navBar.id ? primaryColor : Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 10),
            )
          else
            const Text(
              ' ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
            ),
        ],
      ),
    );
  }
}
