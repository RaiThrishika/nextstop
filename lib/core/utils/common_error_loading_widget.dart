import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CommonErrorLoadingWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final double? height;
  final double? width;
  const CommonErrorLoadingWidget(
      {super.key,
      this.isLoading = false,
      required this.error,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      return SizedBox(
        height: height ?? box.maxHeight,
        width: width ?? box.maxWidth,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  error ?? "Unexpected Error Occurred",
                  style: context.theme.textTheme.labelLarge,
                ),
        ),
      );
    });
  }
}
