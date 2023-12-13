import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:montra_app_a1/assets/constants/colors.dart';
import 'package:montra_app_a1/modules/navigation/presentation/widgets/screens/budget_create2.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditBudgetScreen extends StatefulWidget {
  const EditBudgetScreen({super.key});

  @override
  State<EditBudgetScreen> createState() => _EditBudgetScreenState();
}

class _EditBudgetScreenState extends State<EditBudgetScreen> {
  List<String> category = ["Category", "Shopping", "Market"];

  String _currentItem = " ";
  bool  isSwitch=false;

  @override
  void initState() {
    _currentItem = category[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 75,
                ),
                Center(
                  child: Text(
                    "Create Budget",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 230,
          ),
          Opacity(
            opacity: 0.64,
            child: Text(
              "  How much do yo want to spend?",
              style: TextStyle(
                color: Color(0xFFFBFBFB),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              " \$0",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 35),
            ),
          ),
          Expanded(
            child: Container(
              width: 350,
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: 340,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.2, color: Color(0xFFF1F1FA)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: DropdownButton(
                          items: category.map<DropdownMenuItem<String>>(
                                  (String dropDownValue) {
                                return DropdownMenuItem(
                                  value: dropDownValue,
                                  child: Text(dropDownValue),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _currentItem = newValue ?? 'Category null';
                            });
                          },
                          hint: Text(
                            "  Category  ",

                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color:  Color(0xFF90909F),

                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 350,
                    height: 65,

                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(


                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(

                          child:const  Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Receive Alert',
                                style: TextStyle(
                                  color: Color(0xFF292B2D),
                                  fontSize: 16,

                                  fontWeight: FontWeight.w500,

                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Receive alert when  it reaches some point.',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF90909F),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoSwitch(

                            trackColor:CupertinoColors.systemGrey3 ,
                            activeColor: CupertinoColors.systemIndigo,
                            thumbColor: CupertinoColors.white,
                            // boolean variable value
                            value: isSwitch,
                            // changes the state of the switch
                            onChanged: (value) {
                              setState(() {
                                isSwitch = !isSwitch;
                              });
                            },

                          ),
                        ),

                      ],
                    ),
                  ),

                  if(isSwitch)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,

                        child: LinearPercentIndicator(
                          width: 350,
                          backgroundColor: Colors.grey,
                          percent: 0.8,
                          lineHeight:20 ,
                          barRadius: Radius.circular(8),
                          animation: true,
                          animationDuration: 2000,
                          center:Text("80%"),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: primaryColor,

                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 342,
                      ),
                    ),




                  Padding(
                    padding: const EdgeInsets.only(top: 0,bottom: 15),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context)=> const BudgetContinuePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: Size(350,50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)
                            )
                        ),
                        child: Text(
                          " Continue ",style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,fontWeight: FontWeight.w500),
                        )),
                  ),
                ]
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
