import 'package:amplitude_flutter/amplitude.dart';
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

const _amplitudeApiKey = "a7e164ed304fdbefc414b62863dfe32c";
const _isDev = true;

class AnalyticsService {
  final Amplitude _amplitude = Amplitude.getInstance();

  static AnalyticsService to() => Get.find();

  AnalyticsService() {
    _amplitude.init(_amplitudeApiKey);

    _amplitude.logEvent("${_isDev ? 'dev_' : ''}APP_OPENED");
    _printAction("${_isDev ? 'dev_' : ''}APP_OPENED");
  }

  _printAction(String actionName, {dynamic? payload}) {
    const prefix = "[AnalyticsService]";
    final payloadMessage = payload != null ? "($payload)" : "";
    print("$prefix $actionName $payloadMessage");
  }

  _getScreenName(PageType screenType) => screenType.toString().split('.').last;

  _getActionName(PageType screenType, String actionName) =>
      "${_isDev ? 'dev_' : ''}${actionName}_${_getScreenName(screenType)}";

  logIconClicked(ClickableButtonType buttonType, PageType pageType,
      {Map<String, dynamic>? payload}) {
    final actionName = _getActionName(pageType, "ICON_CLICKED");
    Map<String, dynamic> finalPayload = payload ?? {};
    finalPayload["buttonType"] = buttonType.toString().split(".").last;
    _printAction(actionName, payload: finalPayload);
    _amplitude.logEvent(actionName, eventProperties: finalPayload);
  }
}
