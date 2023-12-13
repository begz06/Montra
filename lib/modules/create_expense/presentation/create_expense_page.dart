import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra_app_a1/assets/constants/png_pictures.dart';
import 'package:montra_app_a1/globals/widgets/category_drop_down.dart';
import 'package:montra_app_a1/modules/create_expense/presentation/bloc/create_expense/create_expense_bloc.dart';
import 'package:montra_app_a1/modules/create_expense/widget/continue_button.dart';
import 'package:montra_app_a1/modules/create_expense/widget/image_bottomsheet.dart';
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
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: widget.isExpense
              ? const Color(0xffFD3C4A)
              : const Color(0xff00A86B),
          appBar: AppBar(
              elevation: 0,
              backgroundColor: widget.isExpense
                  ? const Color(0xffFD3C4A)
                  : const Color(0xff00A86B),
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      widget.isExpense ? "Expense" : "Income",
                      style: const TextStyle(
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
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26),
                      decoration: const InputDecoration(
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
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
                                border:
                                    Border.all(color: const Color(0xff91919F))),
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
                          padding: const EdgeInsets.all(10.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            controller: _descController,
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
                                        borderRadius: BorderRadius.circular(12),
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
                                          behavior: HitTestBehavior.translucent,
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
                                                topRight: Radius.circular(24))),
                                        context: context,
                                        builder: (c) => BlocProvider.value(
                                            value: createExpenseBloc,
                                            child: const ImageBottomSheet()));
                                  },
                                  child: Container(
                                    height: 60,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: const Color(0xffF1F1FA))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(PngImages.attachment),
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
                        const Spacer(),

                        //countinue tugmasi
                        BlocBuilder<CreateExpenseBloc, CreateExpenseState>(
                          builder: (context, state) {
                            return ContinueButton(onTap: () {
                              if (state.image.isNotEmpty &&
                                  state.category != null &&
                                  _priceController.text.isNotEmpty) {
                                print('adding to db');
                                context.read<CreateExpenseBloc>().add(
                                    CreateExpenseEvent.createExpense(
                                        isExpense: widget.isExpense,
                                        price: _priceController.text,
                                        desc: _descController.text));
                                Navigator.pop(context);
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                print('fill fields');
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
