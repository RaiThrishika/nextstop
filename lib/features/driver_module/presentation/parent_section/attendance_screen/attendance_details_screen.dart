import 'package:driver_app/features/driver_module/presentation/parent_section/attendance_screen/attendance_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceDetailsScreen extends StatefulWidget {
  const AttendanceDetailsScreen({super.key});

  @override
  State<AttendanceDetailsScreen> createState() => _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {

  DateTime _focusedDay = DateTime.utc(2025, 3, 26);
  List<DateTime> _greyDays = [
    DateTime.utc(2025, 3, 22),
    DateTime.utc(2025, 3, 18),
    DateTime.utc(2025, 3, 16),
  ];


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text( "Attendance",
          style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700),),
        leading:  IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AttendanceListScreen()));
                    },
                      child: Text("View All", style: TextStyle(
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),)),
                ),
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("July 2023", style: TextStyle(fontWeight: FontWeight.w900),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.center, // Center the text
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.17, // Set custom width
                                height: MediaQuery.of(context).size.height * 0.17,
                                child: CircularProgressIndicator(
                                  value: 0.6, // 60% progress
                                  backgroundColor: Colors.grey[300], // Background color
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Progress color
                                  strokeWidth: 7, // Thickness
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Present", // Text inside
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "22 Days", // Text inside
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 25,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Total Working Days - 24", style: TextStyle(fontWeight: FontWeight.w900),),
                              SizedBox(height: 25,),
                              Text("Official Leaves - 4", style: TextStyle(fontWeight: FontWeight.w900),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child:  Column(
                    children: [
                      TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: _focusedDay, // Used only for navigation

                        // No selection behavior
                        onDaySelected: null,
                        selectedDayPredicate: null,

                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(), // Remove today's highlight
                          outsideDaysVisible: false, // Hide previous/next month dates
                        ),

                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            if (_greyDays.any((d) => isSameDay(d, day))) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey, // Grey highlight for specified dates
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    '${day.day}',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            }
                            if (day.weekday == DateTime.sunday) {
                              return Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              );
                            }
                            return null;
                          },
                        ),

                        headerStyle: HeaderStyle(
                          formatButtonVisible: false, // Hide format button
                          titleCentered: true, // Center month title
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.circle, color: Colors.grey,),
                          Text("Absent")
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
