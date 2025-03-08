import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackBusScreen extends StatefulWidget {
  const TrackBusScreen({super.key});

  @override
  State<TrackBusScreen> createState() => _TrackBusScreenState();
}

class _TrackBusScreenState extends State<TrackBusScreen> {

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  GoogleMapController? mapController;
  final LatLng school = LatLng(12.569427622703314, 74.95536864281762);


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return LayoutBuilder(builder: (context, box) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Track Bus",
              style: TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w700),),
            // leading:  IconButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: Icon(Icons.arrow_back_ios_new)),
          ),
          body: DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: box.maxHeight* 0.6,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: school,
                        zoom: 14,
                      ),
                      markers: markers,
                      polylines: polylines,
                      onMapCreated: (GoogleMapController controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                    ),
                  ),
              TabBar(
                labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicatorPadding: EdgeInsets.symmetric(vertical: 10),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.amber), // Indi/ Adjusts indicator width
                ),
                tabs: [
                  Tab(text: "Tracking"),
                  Tab(text: "Bus Info"),
                ],
              ),
              // TabBarView inside a constrained height
              SizedBox(
                height: box.maxHeight * 0.22, // Adjust height as needed
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 45, // Adjust size
                                backgroundImage: AssetImage('assets/profile.jpg'),
                              ),
                              Text("John",  style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.purple
                              ))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bus Number", style: TextStyle(color: theme.primaryColor,
                              fontSize: 20, fontWeight: FontWeight.w800),),
                          Text("UP 16 BL 2633", style: TextStyle(color: Colors.black,),),
                          Text("Driver Number", style: TextStyle(color: theme.primaryColor,
                              fontSize: 20, fontWeight: FontWeight.w800),),
                          Text("John Samual", style: TextStyle(color: Colors.black,),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
