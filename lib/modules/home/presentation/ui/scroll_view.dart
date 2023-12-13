// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ScrollViewTest extends StatelessWidget {
//   const ScrollViewTest({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(),
//         SliverToBoxAdapter(),
//         SliverPadding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           sliver: SliverGrid(
//             delegate: SliverChildBuilderDelegate((context, index) {
//               return TransactionItem();
//             }, childCount: 10),
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           ),
//         ),
//         SliverFillRemaining(child: ,),
//       ],
//     );
//
//     return NestedScrollView(
//         headerSliverBuilder: (c, b) {
//           return [
//             SliverAppBar(),
//           ];
//         },
//         body: Container(
//           height: 1000,
//         ));
//   }
// }
