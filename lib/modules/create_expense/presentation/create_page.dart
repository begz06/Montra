import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:montra_app_a1/assets/constants/app_icons.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/globals/widgets/my_drop_down.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/widget/continue_button.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/widget/image_bottomsheet.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/widget/image_picker_bottomsheet.dart';
import 'package:montra_app_a1/utils/enums.dart';

class CreateExpense extends StatefulWidget {
  final bool isExpense;

  const CreateExpense({required this.isExpense, super.key});

  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  CategoryEnum? categoryType;
  late CreateExpenseBloc createExpenseBloc;

  late TextEditingController _priceController;
  late TextEditingController _descController;

  @override
  void initState() {
    createExpenseBloc = CreateExpenseBloc(widget.isExpense);
    _priceController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: createExpenseBloc,
      child: WillPopScope(
        onWillPop: () {
          Navigator.popUntil(context, (route) => route.isFirst);

          return Future.value(false);
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:
                widget.isExpense ? Color(0xffFD3C4A) : Color(0xff00A86B),
            appBar: AppBar(
                elevation: 0,
                backgroundColor:
                    widget.isExpense ? Color(0xffFD3C4A) : Color(0xff00A86B),
                leadingWidth: 40,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SvgPicture.asset(
                      AppIcons.arrow,
                      width: 32,
                      height: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Expense",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 30, bottom: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "How much?",
                          style: TextStyle(
                              color: Color(0xffFCFCFC),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _priceController,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 26),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                            hintText: '\$0',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.transparent,
                            )),
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 26)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                        color: Color(0xffFFFFFF)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff91919F))),
                              child: CategoryDropDown(
                                list: const [
                                  CategoryEnum.shopping,
                                  CategoryEnum.subscription,
                                  CategoryEnum.food,
                                ],
                                onChanged: (newType) {
                                  print(newType.toString());
                                  createExpenseBloc.add(
                                      CreateExpenseEvent.changeCategory(
                                          category: newType));
                                },
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0)),
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xff91919F))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 0),
                                child: SizedBox(
                                    height: 60,
                                    child: TextField(
                                      controller: _descController,
                                    )),
                              ),
                            ),
                          ),

                          //rasm qoshish uchun boshlandi
                          BlocBuilder<CreateExpenseBloc, CreateExpenseState>(
                            builder: (context, state) {
                              if (state.image.isNotEmpty) {
                                return SizedBox(
                                  height: 116,
                                  width: 116,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.file(
                                            File(state.image),
                                            fit: BoxFit.cover,
                                            width: 110,
                                            height: 110,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: GestureDetector(
                                            behavior:
                                                HitTestBehavior.translucent,
                                            onTap: () {
                                              context
                                                  .read<CreateExpenseBloc>()
                                                  .add(const CreateExpenseEvent
                                                      .changeImage(image: ''));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.32),
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.close,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(24),
                                                  topRight:
                                                      Radius.circular(24))),
                                          context: context,
                                          builder: (c) => BlocProvider.value(
                                              value: createExpenseBloc,
                                              child: ImageBottomSheet()));
                                    },
                                    child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(16.0)),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xffF1F1FA))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/Vector.svg',
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Add attachment",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff91919F)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),

                          //ochirib yoqish tugmasi
                          Spacer(),

                          //countinue tugmasi
                          BlocBuilder<CreateExpenseBloc, CreateExpenseState>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  if (state.image.isNotEmpty &&
                                      state.category != null &&
                                      _priceController.text.isNotEmpty) {
                                    print('adding to db');
                                    context.read<CreateExpenseBloc>().add(
                                        CreateExpenseEvent.createExpense(
                                            price: _priceController.text,
                                            desc: _descController.text,
                                            isExpense: widget.isExpense));
                                    Navigator.popUntil(
                                        context, (route) => route.isFirst);
                                  } else {
                                    print('fill fields');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.0)),
                                        color: Color(0xff7F3DFF),
                                        border: Border.all(
                                            color: Color(0xff91919F))),
                                    child: Center(
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFCFCFC)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
