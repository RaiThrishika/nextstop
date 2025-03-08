import 'package:driver_app/features/notification_screen/notification_details_screen.dart';
import 'package:flutter/material.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",
          style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700),),
      ),
      body: ListView.builder(
      padding: const EdgeInsets.all(15),
          itemCount: 6,
          itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NotificationDetailsScreen()));

          },
          child: Card(
            color: Colors.white,
            shadowColor: const Color(0x19000248),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Icon(Icons.location_on, color: theme.primaryColor,),
                         Text("Arrival Reminder",  style: TextStyle(
                             fontSize: 16, color: theme.primaryColor
                         ),),
                       ],
                     ),
                     Text("07:35 PM",  style: TextStyle(
                         fontSize: 16, color: theme.primaryColor
                     ),)
                   ],
                 ),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
