import 'package:driver_app/screens/splash_screen/splash_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenModel(context)),
      ],
      child: Consumer<SplashScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(),),
          );
        },
      ),
    );
  }
}
