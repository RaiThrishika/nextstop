import 'package:driver_app/core/base_constants.dart';
import 'package:driver_app/features/driver_module/presentation/driver_home_screen/home_screen/screens/driver_map_screen.dart';
import 'package:driver_app/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/introScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isLoading = false;

  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/profile.jpg',
      text: "Live Bus Tracking",
      desc: "Find Transportation services for school. Now with us! Search for Transportation Services For School in Your Area. Find It With Us! Visit Our Website. Across the Web. Results Today. Millions of Visitors. "
          "Get to Know Us Today. A Range of Info. Visit Our Site. Curated Listings. ."
          "Find Transportation services for school. Now with us! Search for Transportation Services For School in Your Area. Find It With Us! Visit Our Website. Across the Web. Results Today. Millions of Visitors. "
          "Get to Know Us Today. A Range of Info. Visit Our Site. Curated Listings. .",
    ),
    OnboardModel(
      img: 'assets/profile.jpg',
      text: "Live Progress",
      desc: "Find Transportation services for school. Now with us! Search for Transportation Services For School in Your Area. Find It With Us! Visit Our Website. Across the Web. Results Today. Millions of Visitors. Get to Know Us Today. A Range of Info. Visit Our Site. Curated Listings. ",
    ),
    OnboardModel(
      img: 'assets/profile.jpg',
      text: "Daily Attendance",
      desc: "Find Transportation services for school. Now with us! Search for Transportation Services For School in Your Area. Find It With Us! Visit Our Website. Across the Web. Results Today. Millions of Visitors. Get to Know Us Today. A Range of Info. Visit Our Site. Curated Listings. ",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    debugPrint("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                PageView.builder(
                    itemCount: screens.length,
                    controller: _pageController,
                    // physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, index) {
                      return
                          Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0.01, 0),
                            colors: [
                              Color(0xffbD6EFF5),
                              Colors.white,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.0, top: 190.0, left: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  screens[index].text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  screens[index].desc,
                                  textAlign: TextAlign.center,
                                  maxLines: 10,
                                  style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              ClipRect(
                                child: Image.asset(screens[index].img, width: 190.0, height: 190.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          Container(
            height: 10.0,
            child: ListView.builder(
              itemCount: screens.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border.all(color: currentIndex == index ? Colors.purple : Colors.purple),
                      color: currentIndex == index ? Colors.purple : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ]);
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          currentIndex != 2
              ? Container(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentIndex != 2
                            ? TextButton(
                                onPressed: () {
                                  _storeOnboardInfo();
                                  setState(() {
                                    currentIndex = 2;
                                  });
                                },
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))
                            : SizedBox.shrink(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () async {
                              print(currentIndex);
                              if (currentIndex == screens.length - 1) {
                                await _storeOnboardInfo();
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => DriverMapScreen()));
                              }

                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInCirc,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 89,
                                height: 40,
                                decoration:
                                    BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(100.0)),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                  Text("Next",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),

                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: 140,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          SharedPrefs.setIsSkipped(true);
                        });
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        width: 343,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class OnboardModel {
  String img;
  String text;
  String desc;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
  });
}
