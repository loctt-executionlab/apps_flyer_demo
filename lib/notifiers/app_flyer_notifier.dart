import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_flyer_notifier.g.dart';

final _appsFlyerOptions = AppsFlyerOptions(
    afDevKey: dotenv.get("DEV_KEY"), appId: dotenv.get("APP_ID"));

@riverpod
class AppsFlyerNotifier extends _$AppsFlyerNotifier {
  @override
  AppsflyerSdk build() {
    print(dotenv.get("DEV_KEY"));
    print(dotenv.get("APP_ID"));
    var sdk = AppsflyerSdk(_appsFlyerOptions);
    sdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
    sdk.startSDK();
    return sdk;
  }
}
