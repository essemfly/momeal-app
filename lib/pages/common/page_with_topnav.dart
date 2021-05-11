import 'package:flutter/material.dart';
import 'package:momeal_app/pages/common/top_bar.dart';

class PageWithTopNav extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hideBackButton;
  final bool scrollable;
  final void Function()? onBackTap;

  PageWithTopNav(
      {required this.title,
      required this.child,
      this.onBackTap,
      this.hideBackButton = false,
      this.scrollable = true});

  static physicalBackOnly(
          {required title, required child, required onBackTap}) =>
      PageWithTopNav(
          title: title,
          child: child,
          onBackTap: onBackTap,
          hideBackButton: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // https://stackoverflow.com/questions/50452710/catch-android-back-button-event-on-flutter
        if (onBackTap != null) {
          onBackTap!();
        }

        return onBackTap == null;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TopBar(
            title: title,
            onBackTap: hideBackButton ? null : onBackTap,
          ),
          Expanded(
              child: scrollable ? SingleChildScrollView(child: child) : child),
        ],
      ),
    );
  }
}
