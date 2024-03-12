# flutter_deep_link

Deep link demo using AppsFlyer

## Setup

This assume you have already setup your apps in AppsFlyer (both iOS and Android), and use OneLink deep linking setup already. This only cover integrate AppsFlyer with Flutter

Your Android app namespace need to be the same with AppsFlyer app name for it to work

### 1. Android Deeplink Setup

#### URI Scheme

Add following intent-filter to your relevant activity in `AndroidManifest.xml`:

``` xml
<intent-filter  android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" />
    <data android:host="[your_domain]" />
</intent-filter>        
<intent-filter  android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" />
    <data android:host="[your_domain]" />
    <data android:pathPrefix="/" />
</intent-filter>        
```
Replace `[your_domain]` with your AppsFlyer domain registered in `android:host` 

I've found subdomain need separate intent filter for it to work (need more testing).

### 2. iOS Deeplink Setup

#### Set plugin for IOS 14

add [app_tracking_transparency]() package in Flutter
add Privacy - Tracking Usage Description inside `.plist` file in Xcode
```plist
<key>NSUserTrackingUsageDescription</key>
<string>This identifier will be used to deliver personalized ads to you.</string>
```

### 3. Usage

Add [appsflyer_sdk](https://pub.dev/packages/appsflyer_sdk) to Flutter

```dart
final _appsFlyerOptions = AppsFlyerOptions(
    afDevKey: dotenv.get("DEV_KEY"), appId: dotenv.get("APP_ID"));

var sdk = AppsflyerSdk(_appsFlyerOptions);
sdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
);
sdk.startSDK();

```

`AppsFlyerOptions` Defines your configurations, Requires [afDevKey] and [appId] as mandatory Named parameters, use to initialize `AppsflyerSdk` instance

`AppsflyerSdk` is used to get events from deeplink:

```dart
    sdk.onDeepLinking(
      (deepLinkResult) {
        print("Open app");
        print(deepLinkResult.status.name);
        switch (deepLinkResult.status) {
            ...
        }
      },
    );

```