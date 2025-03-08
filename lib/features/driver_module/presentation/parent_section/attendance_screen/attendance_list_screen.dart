import 'package:flutter/material.dart';

class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({super.key});

  @override
  State<AttendanceListScreen> createState() => _AttendanceListScreenState();
}

class _AttendanceListScreenState extends State<AttendanceListScreen> {



  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text( "Attendance List",
          style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700),),
        leading:  IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: Card(
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
        ); }
      ),
    );
  }
}
