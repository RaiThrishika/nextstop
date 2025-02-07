import 'package:driver_app/screens/otp_screen/otp_screen_model.dart';
import 'package:driver_app/samples/sample_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleModel(context)),
      ],
      child: Consumer<SampleModel>(
        builder: (context, model, child) {
          return Scaffold();
        },
      ),
    );
  }
}
