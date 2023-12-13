


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/navigation/presentation/widgets/screens/create_budget.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {


  List<String> months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

    int curentMonthsIndex=0;

  @override
  Widget build(BuildContext context) {
    return
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: primaryColor,
          child: Column(
            children: [

              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    height: 250,
                  decoration: BoxDecoration(
                    color: primaryColor
                  ),

                  child:Row(
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
                  )
                )
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  // height:MediaQuery.of(context).size.height*0.7,
                  height: 565,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight:Radius.circular(25),),
                        color: Colors.white

                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 200,),
                      Text("You don’t have a budget. Let’s make one so you in control.",
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                           style: GoogleFonts.roboto(color:Color(0xFF91919F),fontSize: 16),),
                       SizedBox(height: 280,),
                      ElevatedButton(
                            onPressed: (){
                              Navigator.push(
                                   context, MaterialPageRoute(builder: (context)=>CreateBudgetScreen()));
                            },
                          style: ElevatedButton.styleFrom(
                             backgroundColor: primaryColor,
                             minimumSize: Size(350,50),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(14)
                             )
                          ),
                           child: Text(
                             "Create a budget",style: GoogleFonts.roboto(
                                     color: Colors.white,
                                     fontSize: 16,fontWeight: FontWeight.w500),
                           )),
                    ],
                  ),
                ),
              )
            ],

    ),
        );
  }
}
