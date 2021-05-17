import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(
    {required FToast fToast,
    required BuildContext context,
    required String body}) {
  fToast.init(context);
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: const Color(0xe60D243B),
    ),
    child: Text(
      body,
      style: const TextStyle(color: Colors.white),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
  );
}
