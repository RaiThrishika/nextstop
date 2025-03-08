import 'package:flutter/material.dart';

class LeaveRequestFormScreen extends StatefulWidget {
  const LeaveRequestFormScreen({super.key});

  @override
  State<LeaveRequestFormScreen> createState() => _LeaveRequestFormScreenState();
}

class _LeaveRequestFormScreenState extends State<LeaveRequestFormScreen> {

  TextEditingController _nameController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Student Name:", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black45),),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the box
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Background color
                  borderRadius: BorderRadius.circular(30), // Optional: Rounded corners
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: RichText(
                      text: TextSpan(
                        text: "Your name", // Normal text
                        style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w600,),
                        children: [
                          TextSpan(
                            text: " *", // Asterisk
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                ),
              )),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Class", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black45),),
                        SizedBox(height: 5,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the box
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Background color
                              borderRadius: BorderRadius.circular(30), // Optional: Rounded corners
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: RichText(
                                  text: TextSpan(
                                    text: "Your class", // Normal text
                                    style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w600,),
                                    children: [
                                      TextSpan(
                                        text: " *", // Asterisk
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Division", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black45),),
                        SizedBox(height: 5,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the box
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Background color
                              borderRadius: BorderRadius.circular(30), // Optional: Rounded corners
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: RichText(
                                  text: TextSpan(
                                    text: "Your division", // Normal text
                                    style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w600,),
                                    children: [
                                      TextSpan(
                                        text: " *", // Asterisk
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Contact No", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black45),),
                        SizedBox(height: 5,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the box
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Background color
                              borderRadius: BorderRadius.circular(30), // Optional: Rounded corners
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: RichText(
                                  text: TextSpan(
                                    text: "Your contact no", // Normal text
                                    style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w600,),
                                    children: [
                                      TextSpan(
                                        text: " *", // Asterisk
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Roll No", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15, color: Colors.black45),),
                        SizedBox(height: 5,),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10), // Add padding inside the box
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Background color
                              borderRadius: BorderRadius.circular(30), // Optional: Rounded corners
                            ),
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                label: RichText(
                                  text: TextSpan(
                                    text: "Your roll no", // Normal text
                                    style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w600,),
                                    children: [
                                      TextSpan(
                                        text: " *", // Asterisk
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}
