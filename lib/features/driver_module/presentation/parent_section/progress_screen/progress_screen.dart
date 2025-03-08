import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

  List<double> values = [5, 8, 6, 3, 7, 10]; // Bar heights
  List<Color> colors = [Colors.blue, Colors.purple, Colors.purpleAccent, Colors.green, Colors.orange]; // Colors list

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text( "Progress",
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
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(14),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: GridView.builder(
                            itemCount: 6,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
                              childAspectRatio: 2.5,),
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.08,
                                child:
                                Row(
                                  children: [
                                    Icon(Icons.circle, color: colors[index % colors.length],),
                                    Text("Sceince", style: TextStyle(fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              );
                            },
                          ),
                      ),
                  SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BarChart(
              BarChartData(
                barGroups: List.generate(values.length, (index) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: values[index].toDouble(), // Heights of bars
                      color: colors[index % colors.length], // Use modulo to repeat colors
                      width: 30,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ],
                )),
                borderData: FlBorderData(show: false), // Hide border
                gridData: FlGridData(show: false), // Hide grid lines
                titlesData: FlTitlesData(show: false),
              ),
            ),
          ),
                  )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
                  ListView.separated(
                      padding: const EdgeInsets.all(15),
                      itemCount: 3,
                      separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 20),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                                itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Remarks", style: TextStyle(fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4,),
                                  Text("Class Teacher", style: TextStyle(fontWeight: FontWeight.w600)),
                                  SizedBox(height: 7),
                                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a"),
                                ],
                              ),
                            );
                                })

            ],
          ),
        ),
      ),
    );
  }
}
