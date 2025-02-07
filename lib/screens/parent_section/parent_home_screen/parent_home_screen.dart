import 'package:driver_app/screens/parent_section/parent_home_screen/parent_home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ParentHomeScreenModel(context)),
      ],
      child: Consumer<ParentHomeScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.logout))
              ],
            ),
            body: Center(child:  Text('Parent Section'),),
          );
        },
      ),
    );
  }
}
