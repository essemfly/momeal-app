import 'package:flutter/material.dart';
import 'package:momeal_app/constants.dart';

class HomeNotice extends StatelessWidget {
  final int brandsCount;
  HomeNotice(this.brandsCount);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF5F7FF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  '$brandsCount개 브랜드의 밀키트를',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  '한번에 비교해보세요,',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  '밀키트 모두모아, 모밀',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color(0xFF0F6ACA),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Expanded(child: Image.asset(AssetImages.notice))
          ],
        ),
      ),
    );
  }
}
