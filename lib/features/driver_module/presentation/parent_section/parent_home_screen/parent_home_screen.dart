import 'package:driver_app/features/driver_module/presentation/parent_section/attendance_screen/attendance_details_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/attendance_screen/attendance_list_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/fee_management_screen/fee_management_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/leave_request_form/leave_request_form_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/parent_home_screen/parent_home_screen_model.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/progress_screen/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParentHomeScreenModel(context)),
      ],
      child: Consumer<ParentHomeScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20.0, top: 35.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Text("Good Morning", style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.purple
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.all(Radius.circular(17),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50, // Adjust size
                                backgroundImage: AssetImage('assets/profile.jpg'),
                              ),
                              SizedBox(width: 30,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("Jolly Samual", style: TextStyle(color: Colors.white,
                                      fontSize: 22, fontWeight: FontWeight.w700),),
                                  Text("Class: X A", style: TextStyle(color: Colors.white,
                                      fontSize: 18, fontWeight: FontWeight.w600)),
                                  Text("Age: 16", style: TextStyle(color: Colors.white,
                                      fontSize: 18, fontWeight: FontWeight.w600)),

                                ]
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Track Bus',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),),
                        Card(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.bus_alert, size: 80,),
                                Column(
                                  children: [
                                    Text("25 Min", style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.purple
                                    )),
                                    Text('Arrive to You',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.all(Radius.circular(7),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, color: Colors.white,),
                                      Text("Track Bus",  style: TextStyle(
                                          fontSize: 16, color: Colors.white
                                      ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('Others', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => ProgressScreen()));
                              },
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Image.asset("assets/progress-report.png", height: 60, width: 60,)
                                    ),
                                  ),
                                  Text("Progress", style: TextStyle(fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => AttendanceDetailsScreen()));
                              },
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Image.asset("assets/attendance.png", height: 60, width: 60,)
                                    ),
                                  ),
                                  Text("Attendance", style: TextStyle(fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => FeeManagementScreen()));

                              },
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Image.asset("assets/fee.png", height: 60, width: 60,)
                                    ),
                                  ),
                                  Text("Fee", style: TextStyle(fontWeight: FontWeight.w700),)
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => LeaveRequestFormScreen()));
                              },
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(23.0),
                                      child: Image.asset("assets/leave.png", height: 60, width: 60,)
                                    ),
                                  ),
                                  Text("Leave Request", style: TextStyle(fontWeight: FontWeight.w700),)
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(23.0),
                                    child: Image.asset("assets/schedule.png", height: 60, width: 60,)
                                  ),
                                ),
                                Text("Time Table", style: TextStyle(fontWeight: FontWeight.w700),)
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(23.0),
                                    child: Image.asset("assets/calendar.png", height: 60, width: 60,)
                                  ),
                                ),
                                Text("School Calendar", style: TextStyle(fontWeight: FontWeight.w700),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
