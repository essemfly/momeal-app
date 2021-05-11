import 'package:flutter/material.dart';

const double ICON_SIZE = 50;

class HomeIcon extends StatelessWidget {
  final String name;
  final String thumbnail;
  final bool isCircular;
  final void Function() onTap;

  HomeIcon(this.name, this.thumbnail, this.isCircular, this.onTap);

  static HomeIcon rounded(
          String name, String thumbnail, void Function() onTap) =>
      HomeIcon(name, thumbnail, false, onTap);

  static HomeIcon circular(
          String name, String thumbnail, void Function() onTap) =>
      HomeIcon(name, thumbnail, true, onTap);

  static HomeIcon more(void Function() onTap) =>
      HomeIcon('더보기', 'assets/more.png', true, onTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: ICON_SIZE,
            width: ICON_SIZE,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(thumbnail),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(isCircular ? 10000 : 10),
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(name),
        ),
      ],
    );
  }
}
