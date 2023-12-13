import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/svg_pictures.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/create_expense_page.dart';
import 'package:montra_app_a1/modules/navigation/presentation/navigator.dart';

showImagePickerBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (_) => const ImagePickerBottomSheet());
}

class ImagePickerBottomSheet extends StatelessWidget {
  const ImagePickerBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin:
            EdgeInsets.only(bottom: 72 + MediaQuery.of(context).padding.bottom),
        height: MediaQuery.of(context).size.height -
            72 -
            MediaQuery.of(context).padding.bottom,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0x008B50FF), Color(0x3D8B4FFF)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          fade(
                              page: const CreateExpense(
                            isExpense: false,
                          )));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 25,
                      child: Center(
                        child: SvgPicture.asset(
                          SvgPictures.income,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 80,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          fade(
                              page: const CreateExpense(
                            isExpense: true,
                          )));
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                      child: Center(
                        child: SvgPicture.asset(
                          SvgPictures.expense,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
}
