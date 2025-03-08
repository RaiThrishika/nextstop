import 'package:flutter/material.dart';

class FeeManagementScreen extends StatefulWidget {
  const FeeManagementScreen({super.key});

  @override
  State<FeeManagementScreen> createState() => _FeeManagementScreenState();
}

class _FeeManagementScreenState extends State<FeeManagementScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text( "Fee Management",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("July 2023", style: TextStyle(fontWeight: FontWeight.w900),),
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("School Fee for July", style: TextStyle(fontWeight: FontWeight.w700),),
                              Text("15000/-", style: TextStyle(fontWeight: FontWeight.w700),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(width: MediaQuery.of(context).size.width, height: 1, color: Colors.black,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Fee", style: TextStyle(fontWeight: FontWeight.w700),),
                              Text("14000/-", style: TextStyle(fontWeight: FontWeight.w700),),
                            ],
                          ),SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Library Fee", style: TextStyle(fontWeight: FontWeight.w700),),
                              Text("1000/-", style: TextStyle(fontWeight: FontWeight.w700),),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(17.0))
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                              child: Text("Remained", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),),
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ); }
      ),
    );
  }
}
