

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_flyer_notifier.g.dart';

final _appsFlyerOptions = AppsFlyerOptions(afDevKey: "dev key", appId: "ID");

@riverpod
class AppsFlyerNotifier extends _$AppsFlyerNotifier {

  @override
   AppsflyerSdk build() {
    var sdk = AppsflyerSdk(_appsFlyerOptions);
    sdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
    return sdk;
  }
}
