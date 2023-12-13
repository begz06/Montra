import 'package:flutter/material.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/widgets/my_sheet_container.dart.dart';

showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(useRootNavigator: true,

      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (c) {
        return const MyBottomSheet();
      });
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int selected = 0;
  int selected2 = 0;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter Transaction',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                    height: 32,
                    width: 71,
                    decoration: ShapeDecoration(
                        color: const Color(0xFFEEE5FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )),
                    child: const Center(
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Color(0xFF7E3DFF),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Filter By',
              style: TextStyle(
                color: Color(0xFF0D0E0F),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                    istapped: selected == 1,
                    text: 'Income'),
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected = 2;
                      });
                    },
                    istapped: selected == 2,
                    text: 'Expence'),
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected = 3;
                      });
                    },
                    istapped: selected == 3,
                    text: 'Transfer'),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Row(
              children: [
                Text(
                  'Sort By',
                  style: TextStyle(
                    color: Color(0xFF0D0E0F),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected2 = 1;
                      });
                    },
                    istapped: selected2 == 1,
                    text: 'Highest'),
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected2 = 2;
                      });
                    },
                    istapped: selected2 == 2,
                    text: 'Lowest'),
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected2 = 3;
                      });
                    },
                    istapped: selected2 == 3,
                    text: 'Newest')
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBottomSheetWidget(
                    onTap: () {
                      setState(() {
                        selected2 = 4;
                      });
                    },
                    istapped: selected2 == 4,
                    text: 'Oldest'),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Category',
              style: TextStyle(
                color: Color(0xFF0D0E0F),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose Category',
                  style: TextStyle(
                    color: Color(0xFF292B2D),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Text(
                        '0 Selected',
                        style: TextStyle(
                          color: Color(0xFF90909F),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 16,
            // ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7E3DFF),
                      fixedSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {},
                  child: const Text(
                    'Apply',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFBFBFB),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
