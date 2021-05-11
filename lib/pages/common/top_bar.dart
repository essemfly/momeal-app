import 'package:flutter/material.dart';
import 'dart:math' as math;

class TopBar extends StatelessWidget {
  final String title;
  final void Function()? onBackTap;

  TopBar({required this.title, this.onBackTap});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    ];

    if (onBackTap != null) {
      children.add(Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Transform.rotate(
              angle: 90 * math.pi / 180,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_circle_down,
                    size: 30,
                  ),
                  onPressed: onBackTap),
            ),
          ],
        ),
      ));
    }
    return Column(
      children: [
        Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 5)),
        Stack(
          alignment: Alignment.center,
          children: children,
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
