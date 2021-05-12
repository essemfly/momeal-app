import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/instance_manager.dart';

enum ClickableButtonType {
  CATEGORY,
  BRAND,
  CATEGORY_MORE,
  BRAND_MORE,
  PRODUCT,
}

enum PageType {
  HOME,
  CATEGORIES,
  BRANDS,
  PRODUCTS,
}

class AnalyticsService {
  final FirebaseAnalytics _analytics;
  static AnalyticsService to() => Get.find();

  AnalyticsService(this._analytics) {
    _analytics.logAppOpen();
    _printAction("APP_OPENED");
  }

  _printAction(String actionName, {dynamic? payload}) {
    const prefix = "[AnalyticsService]";
    final payloadMessage = payload != null ? "($payload)" : "";
    print("$prefix $actionName $payloadMessage");
  }

  _getScreenName(PageType screenType) => screenType.toString().split('.').last;

  _getActionName(PageType screenType, String actionName) =>
      "dev_${actionName}_${_getScreenName(screenType)}";

  logIconClicked(ClickableButtonType buttonType, PageType pageType,
      {Map<String, dynamic>? payload}) {
    final actionName = _getActionName(pageType, "ICON_CLICKED");
    Map<String, dynamic> finalPayload = payload ?? {};
    finalPayload["buttonType"] = buttonType.toString().split(".").last;
    _printAction(actionName, payload: finalPayload);
    _analytics.logEvent(
      name: actionName,
      parameters: finalPayload,
    );
  }
}
