import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/app_icons.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/create_page.dart';
import 'package:montra_app_a1/modules/navigation/presentation/navigator.dart';

showImagePickerBottomSheet(
  BuildContext context,
) {
  showModalBottomSheet(
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (_) => ImagePickerBottomSheet());
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
        decoration: BoxDecoration(
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
                  onTap: ()  {
                     Navigator.push(
                        context,
                        fade(
                            page: const CreateExpense(
                          isExpense: false,
                        )));


                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: SvgPicture.asset(AppIcons.income),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                GestureDetector(
                  onTap: () async{
                Navigator.push(
                        context,
                        fade(
                            page: CreateExpense(
                          isExpense: true,
                        )));

                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    width: 40,
                    height: 40,
                    child: Center(
                      child: SvgPicture.asset(AppIcons.expense),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            )
          ],
        ),
      );
}
