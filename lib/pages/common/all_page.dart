import 'package:flutter/material.dart';
import 'package:momeal_app/pages/common/page_with_topnav.dart';

import 'all_list.dart';

class AllPage extends StatelessWidget {
  final String title;
  final AllList allList;
  final void Function() backToHome;

  AllPage(this.title, this.allList, this.backToHome);

  @override
  Widget build(BuildContext context) {
    return PageWithTopNav.physicalBackOnly(
      title: title,
      child: allList,
      onBackTap: backToHome,
    );
  }
}
