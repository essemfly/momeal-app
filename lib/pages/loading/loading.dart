import 'package:flutter/material.dart';
import 'package:momeal_app/constants.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetImages.bi,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: CircularProgressIndicator(
              value: null,
            ),
          ),
        ],
      ),
    );
  }
}
