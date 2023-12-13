



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/budget/presentation/view/screens/budget_remaing.dart';
import 'package:montra_app_a1/modules/starter/onboarding/widgets/myCard.dart';

class BudgetContinuePage extends StatefulWidget {
  const BudgetContinuePage({super.key});

  @override
  State<BudgetContinuePage> createState() => _BudgetContinuePageState();
}

class _BudgetContinuePageState extends State<BudgetContinuePage> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  int curentMonthsIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 79,
      ),
      color: const Color(0xFF7F3DFF),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: (){
                  if (curentMonthsIndex > 0) {
                    setState(() {
                      curentMonthsIndex--;
                    });
                  }
                },
                icon: Icon(Icons.arrow_back_ios,color:Colors.white,size: 32,),
              ),
              Text( months[curentMonthsIndex],
                style: GoogleFonts.roboto(color:Colors.white,fontSize: 28,
                    fontWeight: FontWeight.w800 ),
              ),
              IconButton(onPressed: (){
                if (curentMonthsIndex ==months.length - 1) {
                  setState(() {
                    curentMonthsIndex=0;
                  });
                }else{
                  setState(() {
                    curentMonthsIndex++;
                  });

                }
              },
                  icon: Icon(Icons.arrow_forward_ios,color:Colors.white,size: 32,))
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 147,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                   SizedBox(
                     height: 190,

                     child: MyCard(percentValue: 1, title: "Shopping", titleColor: Colors.yellow,
                         remainingMoney: 0,
                         limitMoney: "You ve exceed the limit!"),
                   ),


                    SizedBox(
                      height: 190,
                      child: MyCard(percentValue: 0.5,
                            title: "Tarnsportation",
                              titleColor: Colors.blueAccent,
                                remainingMoney: 350, limitMoney: " of \$700"),
                    ),
                     SizedBox(height: 35,),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context)=> const RemaingScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              minimumSize: Size(350,50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)
                              )
                          ),
                          child: Text(
                            " Create a budget ",style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,fontWeight: FontWeight.w500),
                          )),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
