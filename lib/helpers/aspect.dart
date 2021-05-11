import 'package:flutter/material.dart';

double getAspectRatio(
    {required int desiredHeight, required BuildContext context}) {
  double screenWidth = MediaQuery.of(context).size.width / 2;
  return screenWidth / desiredHeight;
}
