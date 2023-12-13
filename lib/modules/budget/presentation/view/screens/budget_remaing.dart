

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra_app_a1/assets/constants/app_icons.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/budget/presentation/view/screens/edit_budget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RemaingScreen extends StatefulWidget {
  const RemaingScreen({super.key});

  @override
  State<RemaingScreen> createState() => _RemaingScreenState();
}

class _RemaingScreenState extends State<RemaingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {}, icon: SvgPicture.asset(AppIcons.income)),
              Text(
                "Detail Budget",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                       showModalBottomSheet(context: context,

                           builder: (BuildContext context){

                            return  Container(

                                 width: double.infinity,
                                 height: 220,
                                 decoration: const BoxDecoration(
                                   color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )
                                 ),
                                 child: Column(
                                   children: [

                                     SizedBox(

                                         child: Divider(color: Colors.grey,thickness: 5,indent: 50,)),
                                     Center(child: Text("Remove  this budget?",style: GoogleFonts.roboto(
                                       fontWeight: FontWeight.w800,
                                        fontSize: 16,

                                     ),),),

                                     Padding(
                                       padding: const EdgeInsets.all(20.0),
                                       child: Text(
                                            "   Are you sure do   you wanna remove this budget?      ",

                                          style:GoogleFonts.roboto(

                                                 fontSize: 16,
                                                 fontWeight: FontWeight.w500,
                                                color: Color(0xFF91919F)),
                                         overflow: TextOverflow.clip,textAlign: TextAlign.center,),
                                     ),
                                     Row(

                                       children: [
                                          SizedBox(width: 30,),
                                         OutlinedButton(
                                             onPressed: (){},
                                             style: OutlinedButton.styleFrom(
                                               primary:primaryColor,
                                               backgroundColor: violetNo
                                           ),
                                             child:Text(" No ",style: GoogleFonts.roboto(
                                                fontSize: 22,

                                               fontWeight: FontWeight.w600,
                                               color: primaryColor),)),
                                         SizedBox(width: 150,),
                                         OutlinedButton(
                                             onPressed: (){},
                                             style: OutlinedButton.styleFrom(
                                                 primary:Colors.white,
                                                 backgroundColor: primaryColor
                                             ),
                                             child:Text(" Yes ",style: GoogleFonts.roboto(color:Colors.white,
                                             fontSize: 22,
                                             fontWeight: FontWeight.w600,
                                             ),))
                                       ],
                                     )
                                   ],
                                 ),
                            );
                           });
                  }, icon: SvgPicture.asset(AppIcons.plus)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 64,
              width: 160,
              decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                   borderRadius: BorderRadius.circular(45),

                   color: Colors.white
                 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(AppIcons.income,height: 50,),
                  Text(
                    "Shopping",
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30,),
          Text("Remaining",style: GoogleFonts.roboto(fontSize: 23,fontWeight: FontWeight.w600),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("\$0",style: GoogleFonts.roboto(fontSize: 35,fontWeight: FontWeight.w900),),
          ),
          Padding(
            padding:  EdgeInsets.all(12.0),
            child: LinearPercentIndicator(

                  width: 370,
                  lineHeight: 20,
                  barRadius: const Radius.circular(20) ,
                  progressColor: Colors.yellow,
                  percent: 1,
                  linearStrokeCap: LinearStrokeCap.round,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Color(0xFFFD3C4A)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset("assets/icons/warning.svg"),
                  Text(" You've  exceed the limit ",
                     style: GoogleFonts.roboto(color: Colors.white,
                         fontSize: 14,
                         fontWeight: FontWeight.w500),)
                ],
              ),
            ),
          ),


         const  SizedBox(height: 230,),

          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>EditBudgetScreen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const  Size(350,50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  )
              ),
              child: Text(
                " Edit ",style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,fontWeight: FontWeight.w500),
              )),

        ],
      ),
    );
  }
}
