import 'package:driver_app/features/driver_module/presentation/parent_section/parent_home_screen/parent_home_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/track_bus_screen/track_bus_screen.dart';
import 'package:driver_app/features/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [
    const ParentHomeScreen(),
    const TrackBusScreen(),
    const ParentHomeScreen(),
    const NotificationListScreen()
  ];
  int _currentIndex = 0;
  DateTime? backButtonPressedTime;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => onWillPopClose(),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          // color: Colors.white24,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 4),
            child: SizedBox(
              height: 65, // Custom height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.home,
                        size: 30,
                        color: _currentIndex == 0
                            ? Colors.purple
                            : theme.disabledColor),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 0;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on_outlined,
                        size: 30,
                        color: _currentIndex == 1
                            ? Colors.purple
                            : theme.disabledColor),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person,
                        size: 30,
                        color: _currentIndex == 2
                            ? Colors.purple
                            : theme.disabledColor),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none,
                        size: 30,
                        color: _currentIndex == 3
                            ? Colors.purple
                            : theme.disabledColor),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPopClose() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressedTime == null ||
        currentTime.difference(backButtonPressedTime!) > Duration(seconds: 3);
    if (backButton) {
      backButtonPressedTime = currentTime;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Tap again to close the app'),
            duration: Duration(seconds: 1)),
      );
      return false;
    } else {
      Navigator.pop(context);
    }
    return true;
  }
}
