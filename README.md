# Weather app

A weather app made in Flutter using Open Meteo (<https://open-meteo.com/>) API.

## Getting Started

### Preview

| Home | Settings | Location search
:--------------:|:-------------:|:-------------:
![screenshot_01](screenshot_01.png) | ![screenshot_02](screenshot_02.png) | ![screenshot_03](screenshot_03.png)

### Android APK

Just copy and install the [weather-app-release.apk](weather-app-release.apk) on your Android device.

## Features

- App changes theme (dark/light) according to night/day.
- Detects current user location and gets weather data (Open Meteo Weather Forecast API)
- Show current temperature and condition
- Shows hourly temperatures and conditions for the next 24h
- Shows 7-day forecast with max and min temperatures and conditions
- Allows search for a specific location (uses Open Meteo Geocoding API)
- Saves user selections (in SharedPreferences) for current location and units
- Uses beautiful Lottie animations to show current weather conditions

### Debug run

Run:

```sh
$ flutter run
```

And select your device or emulator.

### Build

Build a release APK for Android:

```sh
$ flutter build apk --release
```

### Release run for iOS

Discover the connected devices:

```sh
$ fluter devices
```

Select a device ID to run as release:

```sh
$ flutter run -d [device_id] --release
```

## More info

- Carlos E. Torres (<cetorres@cetorres.com>)
