import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:montra_app_a1/assets/constants/app_icons.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/bloc/create_expense/create_expense_bloc.dart';

class ImageBottomSheet extends StatelessWidget {
  const ImageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 200,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 45),
              child: Container(
                width: 40,
                height: 7,
                decoration: const BoxDecoration(
                    color: Color(0xffD3BDFF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (image != null) {
                        context.read<CreateExpenseBloc>().add(
                            CreateExpenseEvent.changeImage(image: image.path));
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 107,
                      height: 91,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xffEEE5FF)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.camera,
                          ),
                          const Text(
                            "Camera",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff7F3DFF)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                //ikkinchi
                GestureDetector(
                  onTap: () async {
                    final image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      context.read<CreateExpenseBloc>().add(
                          CreateExpenseEvent.changeImage(image: image.path));
                    }

                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 107,
                    height: 91,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Color(0xffEEE5FF)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.gallery,
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff7F3DFF)),
                        )
                      ],
                    ),
                  ),
                ),

                //uchinchi
              ],
            ),
          ],
        ),
      );
}
