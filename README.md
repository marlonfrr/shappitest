# shappitest

A new Flutter project.

## How to run the code

The app uses Flutter version `3.0.5` and Dart version `2.17.6`

The app should work fine on both Android and iOS simulators, so for example to run it on iOS simulator execute the following commands:

- `open -a Simulator`
- `flutter run`

To run the widget tests:

- `flutter test test/widget`

## Third party dependencies

I used the following dependencies:

- `http`: To manage HTTP requests
- `mockito`: To mock services responses and verify behaviours
- `flutter_riverpod`: To introduce state management to the architecture
- `cached_network_image`: To cache characters images
