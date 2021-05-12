import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const double ICON_SIZE = 50;

class HomeIcon extends StatelessWidget {
  final String name;
  final ImageProvider image;
  final void Function() onTap;

  HomeIcon(this.name, this.image, this.onTap);

  static HomeIcon item(String name, String thumbnail, void Function() onTap) =>
      HomeIcon(name, CachedNetworkImageProvider(thumbnail), onTap);

  static HomeIcon more(void Function() onTap) =>
      HomeIcon('더보기', AssetImage('assets/more.png'), onTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: ICON_SIZE - 5,
                width: ICON_SIZE - 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
              Container(
                height: ICON_SIZE,
                width: ICON_SIZE,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
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
