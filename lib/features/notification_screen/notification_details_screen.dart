import 'package:flutter/material.dart';


class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});

  @override
  State<NotificationDetailsScreen> createState() => _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications",
          style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700),),
        leading:  IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type speci men book. It has survived not only five centuries, but also the leap into electronic typesetting, rem aining essentially unchanged. "
              "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"
              " and more recently with desktop publishing software like Al dus PageMaker including versions of Lorem Ipsum",
          style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  }
}
